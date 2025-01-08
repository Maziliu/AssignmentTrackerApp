import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/enums/event_type.dart';
import 'package:assignmenttrackerapp/models/cache_stream.dart';
import 'package:assignmenttrackerapp/models/db_course.dart';
import 'package:assignmenttrackerapp/models/db_event.dart';
import 'package:assignmenttrackerapp/services/database/database_service.dart';
import 'package:assignmenttrackerapp/utils/pair.dart';

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
          courseEventMap['time_slots'] as List<Pair<DateTime?, DateTime?>>,
    );

    DatabaseEvent tutorialEvent = await createEvent(
      userId: userId,
      courseId: courseId,
      eventType: EventType.tutorial,
      scheduledDays: tutorialEventMap['scheduled_days'] as List<bool>,
      timeSlots:
          tutorialEventMap['time_slots'] as List<Pair<DateTime?, DateTime?>>,
    );

    DatabaseEvent labEvent = await createEvent(
      userId: userId,
      courseId: courseId,
      eventType: EventType.lab,
      scheduledDays: labEventMap['scheduled_days'] as List<bool>,
      timeSlots: labEventMap['time_slots'] as List<Pair<DateTime?, DateTime?>>,
    );

    return DatabaseCourse(
      id: courseId,
      userId: userId,
      courseName: courseName,
      courseEvent: courseEvent,
      tutorialEvent: tutorialEvent,
      labEvent: labEvent,
    );
  }

  Future<DatabaseEvent> createEvent({
    required int userId,
    required int courseId,
    required EventType eventType,
    required List<bool> scheduledDays,
    required List<Pair<DateTime?, DateTime?>> timeSlots,
  }) async {
    final row = {
      'user_id': userId,
      'course_id': courseId,
      'event_type': eventType.index,
      'scheduled_days': DatabaseEvent.encodeScheduledDaysArray(scheduledDays),
      'time_slots': DatabaseEvent.encodeTimeSlots(timeSlots),
    };

    final eventId = await insertRecord(row);

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

  @override
  CacheStream<DatabaseCourse> get cache =>
      super.cache as CacheStream<DatabaseCourse>;

  @override
  DatabaseCourse mapRowToModel(Map<String, Object?> row) {
    return DatabaseCourse.fromRow(row);
  }
}
