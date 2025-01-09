import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/enums/event_type.dart';
import 'package:assignmenttrackerapp/models/cache_stream.dart';
import 'package:assignmenttrackerapp/models/db_course.dart';
import 'package:assignmenttrackerapp/models/db_event.dart';
import 'package:assignmenttrackerapp/services/database/database_exceptions.dart';
import 'package:assignmenttrackerapp/services/database/database_service.dart';
import 'package:assignmenttrackerapp/utils/pair.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class CoursesService extends DatabaseService {
  static final CoursesService _instance = CoursesService._singleton();

  CoursesService._singleton()
      : super(courseTableName, CacheStream<DatabaseCourse>());

  factory CoursesService() => _instance;

  //CRUD Operations
  Future<DatabaseCourse> createCourse({
    required int userId,
    required String courseName,
    required Map<String, Object?> courseEventMap,
    required Map<String, Object?> tutorialEventMap,
    required Map<String, Object?> labEventMap,
  }) async {
    final row = {
      'user_id': userId,
      'course_name': courseName,
    };

    final courseId = await insertRecord(row);

    DatabaseEvent courseEvent = await createEvent(
      userId: userId,
      courseId: courseId,
      eventType: EventType.course,
      scheduledDays: courseEventMap['scheduled_days'] as List<bool>,
      timeSlots:
          courseEventMap['time_slots'] as List<Pair<TimeOfDay?, TimeOfDay?>>,
    );

    DatabaseEvent tutorialEvent = await createEvent(
      userId: userId,
      courseId: courseId,
      eventType: EventType.tutorial,
      scheduledDays: tutorialEventMap['scheduled_days'] as List<bool>,
      timeSlots:
          tutorialEventMap['time_slots'] as List<Pair<TimeOfDay?, TimeOfDay?>>,
    );

    DatabaseEvent labEvent = await createEvent(
      userId: userId,
      courseId: courseId,
      eventType: EventType.lab,
      scheduledDays: labEventMap['scheduled_days'] as List<bool>,
      timeSlots:
          labEventMap['time_slots'] as List<Pair<TimeOfDay?, TimeOfDay?>>,
    );

    DatabaseCourse course = DatabaseCourse(
      id: courseId,
      userId: userId,
      courseName: courseName,
      courseEvent: courseEvent,
      tutorialEvent: tutorialEvent,
      labEvent: labEvent,
    );

    cache.updateCache(course);

    return course;
  }

  Future<DatabaseEvent> createEvent({
    required int userId,
    required int courseId,
    required EventType eventType,
    required List<bool> scheduledDays,
    required List<Pair<TimeOfDay?, TimeOfDay?>> timeSlots,
  }) async {
    await checkDbIsOpen();
    Database database = getDatabase();

    final row = {
      'user_id': userId,
      'course_id': courseId,
      'event_type': eventType.index,
      'scheduled_days': DatabaseEvent.encodeScheduledDaysArray(scheduledDays),
      'time_slots': DatabaseEvent.encodeTimeSlots(timeSlots),
    };

    final eventId = await database.insert(eventTableName, row);

    final event = DatabaseEvent(
      id: eventId,
      userId: userId,
      courseId: courseId,
      eventType: eventType,
    );
    event.scheduledDays = scheduledDays;
    event.timeSlots = timeSlots;

    return event;
  }

  Future<DatabaseEvent?> getEventByCourseIdAndType(
      {required int courseId, required EventType eventType}) async {
    await checkDbIsOpen();
    final database = getDatabase();

    final result = await database.query(
      eventTableName,
      limit: 1,
      where: 'course_id = ? AND event_type = ?',
      whereArgs: [courseId, eventType.index],
    );

    if (result.isEmpty) {
      return null;
    }

    return DatabaseEvent.fromRow(result.first);
  }

  Future<List<DatabaseCourse>> getAllCourses() async {
    await checkDbIsOpen();
    final database = getDatabase();

    final result = await database.query(tableName);

    final allCoursesInDB = result.map((row) => mapRowToModel(row)).toList();

    for (DatabaseCourse course in allCoursesInDB) {
      course.courseEvent = await getEventByCourseIdAndType(
        courseId: course.courseId,
        eventType: EventType.course,
      );
      course.tutorialEvent = await getEventByCourseIdAndType(
        courseId: course.courseId,
        eventType: EventType.tutorial,
      );
      course.labEvent = await getEventByCourseIdAndType(
        courseId: course.courseId,
        eventType: EventType.lab,
      );

      cache.updateCache(course);
    }

    return allCoursesInDB;
  }

  Future<DatabaseCourse> getCourseById({required int id}) async {
    final results = await getRecordById(id);

    if (results.isEmpty) {
      throw CourseNotFoundException();
    }

    final course = DatabaseCourse.fromRow(results.first);
    course.courseEvent = await getEventByCourseIdAndType(
        courseId: course.courseId, eventType: EventType.course);
    course.tutorialEvent = await getEventByCourseIdAndType(
        courseId: course.courseId, eventType: EventType.tutorial);
    course.labEvent = await getEventByCourseIdAndType(
        courseId: course.courseId, eventType: EventType.lab);

    cache.updateCache(course);

    return course;
  }

  Future<DatabaseCourse> updateCourse(
      {required DatabaseCourse originalCourse,
      required String courseName,
      required List<Map<String, Object?>> events}) async {
    await getCourseById(id: originalCourse.courseId);
    final row = {'course_name': courseName};

    final count = await updateRecord(originalCourse.courseId, row);

    if (count == 0) {
      throw UnableToUpdateCourseException();
    }

    for (int i = 0; i < events.length; i++) {
      await updateEvent(
        courseId: originalCourse.courseId,
        eventType: EventType.values[i],
        scheduledDays: (events[i] as Map)['scheduled_days'],
        timeSlots: (events[i] as Map)['time_slots'],
      );
    }

    return await getCourseById(id: originalCourse.courseId);
  }

  Future<DatabaseEvent?> updateEvent(
      {required int courseId,
      required EventType eventType,
      required List<bool> scheduledDays,
      required List<Pair<TimeOfDay?, TimeOfDay?>> timeSlots}) async {
    DatabaseEvent? originalEvent = await getEventByCourseIdAndType(
        courseId: courseId, eventType: eventType);

    if (originalEvent == null) {
      return null;
    }

    await checkDbIsOpen();
    final database = getDatabase();

    final row = {
      'scheduled_days': DatabaseEvent.encodeScheduledDaysArray(scheduledDays),
      'time_slots': DatabaseEvent.encodeTimeSlots(timeSlots)
    };

    final count = await database.update(eventTableName, row,
        where: 'id = ?', whereArgs: [originalEvent.id]);

    if (count == 0) {
      throw UnableToUpdateEventException();
    }

    return await getEventByCourseIdAndType(
        courseId: courseId, eventType: eventType);
  }

  Future<void> deleteEventById({required int id}) async {
    await checkDbIsOpen();
    final database = getDatabase();

    final count =
        await database.delete(eventTableName, where: 'id = ?', whereArgs: [id]);

    if (count != 1) {
      throw UnableToDeleteEventException();
    }
  }

  Future<void> deleteCourseByIdAndEventIds(
      {required int id, required List<int> eventIds}) async {
    final count = await deleteRecord(id);

    if (count != 1) {
      throw UnableToDeleteCourseException();
    }

    for (int eventId in eventIds) {
      await deleteEventById(id: eventId);
    }

    cache.removeFromCacheUsingId(id);
  }

  Future<void> deleteCourseById({required int id}) async {
    await checkDbIsOpen();
    Database database = getDatabase();

    final DatabaseCourse course = await getCourseById(id: id);

    if (course.courseEvent != null) {
      await deleteEventById(id: course.courseEvent!.id);
    }
    if (course.tutorialEvent != null) {
      await deleteEventById(id: course.tutorialEvent!.id);
    }
    if (course.labEvent != null) {
      await deleteEventById(id: course.labEvent!.id);
    }

    final count = await database.delete(
      courseTableName,
      where: 'course_id = ?',
      whereArgs: [id],
    );

    if (count == 0) {
      throw UnableToDeleteCourseException();
    }
  }

  @override
  CacheStream<DatabaseCourse> get cache =>
      super.cache as CacheStream<DatabaseCourse>;

  @override
  DatabaseCourse mapRowToModel(Map<String, Object?> row) {
    return DatabaseCourse.fromRow(row);
  }
}
