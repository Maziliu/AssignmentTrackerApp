import 'package:assignmenttrackerapp/enums/assessment_type.dart';
import 'package:assignmenttrackerapp/enums/time_slot_type.dart';

const databaseName = 'assignment_tracker_db';

// SQL Tables
const String userTableName = 'user';
const String createUserTable = '''
CREATE TABLE IF NOT EXISTS "$userTableName" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "email" TEXT NOT NULL UNIQUE
);''';

const String timeSlotTableName = 'time_slot';
String createTimeSlotTable = '''
CREATE TABLE IF NOT EXISTS "$timeSlotTableName" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "reference_id" INTEGER NOT NULL,
  "type" TEXT NOT NULL CHECK ("type" IN (${TimeSlotType.allTimeSlotTypes})),
  "end_day_index" INTEGER NOT NULL,
  "start_date" INTEGER,
  "end_date" INTEGER NOT NULL
);''';

const gradedComponentTableName = 'graded_component';
const String createGradedComponentTable = '''
CREATE TABLE IF NOT EXISTS "$gradedComponentTableName" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "weight_decimal" REAL,
  "grade_percentage" REAL NOT NULL,
  "grade_letter" TEXT NOT NULL
);''';

const String gradeScaleTableName = 'grade_scale';
const String createGradeScaleTable = '''
CREATE TABLE IF NOT EXISTS "$gradeScaleTableName" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "a_plus_min" INTEGER, 
  "a_min" INTEGER NOT NULL,
  "a_minus_min" INTEGER,
  "b_plus_min" INTEGER,
  "b_min" INTEGER NOT NULL,
  "b_minus_min" INTEGER,
  "c_plus_min" INTEGER,
  "c_min" INTEGER NOT NULL,
  "c_minus_min" INTEGER,
  "d_plus_min" INTEGER,
  "d_min" INTEGER NOT NULL
);''';

const String profileTableName = 'profile';
const String createProfileTable = '''
CREATE TABLE IF NOT EXISTS "$profileTableName" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER,
  "profile_name" TEXT NOT NULL,
  FOREIGN KEY ("user_id") REFERENCES "$userTableName" ("id") ON DELETE CASCADE
);''';

const String courseTableName = 'course';
const String createCourseTable = '''
CREATE TABLE IF NOT EXISTS "$courseTableName" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "profile_id" INTEGER NOT NULL,
  "graded_component_id" INTEGER,
  "grade_scale_id" INTEGER,
  "course_name" TEXT NOT NULL,
  "course_code" TEXT NOT NULL,
  "schedule_bitmask" INTEGER NOT NULL,
  FOREIGN KEY ("profile_id") REFERENCES "$profileTableName" ("id") ON DELETE CASCADE,
  FOREIGN KEY ("graded_component_id") REFERENCES "$gradedComponentTableName" ("id") ON DELETE CASCADE,
  FOREIGN KEY ("grade_scale_id") REFERENCES "$gradeScaleTableName" ("id") ON DELETE CASCADE
);''';

const String assessmentTableName = 'assessment';
String createAssessmentTable = '''
CREATE TABLE IF NOT EXISTS "$assessmentTableName" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "course_id" INTEGER NOT NULL,
  "graded_component_id" INTEGER NOT NULL,
  "assessment_name" TEXT NOT NULL,
  "type" TEXT NOT NULL CHECK ("type" IN (${AssessmentType.allAssesmentTypes})),
  "is_complete" INTEGER NOT NULL DEFAULT 0,
  FOREIGN KEY ("course_id") REFERENCES "$courseTableName" ("id") ON DELETE CASCADE,
  FOREIGN KEY ("graded_component_id") REFERENCES "$gradedComponentTableName" ("id") ON DELETE CASCADE
);''';

const String eventTableName = 'event';
const String createEventTable = '''
CREATE TABLE IF NOT EXISTS "$eventTableName" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "event_name" TEXT NOT NULL
);''';

final allTableCreates = [
  // Keep in mind for future additions taht order matters
  createUserTable,
  createEventTable,
  createProfileTable,
  createGradedComponentTable,
  createGradeScaleTable,
  createCourseTable,
  createAssessmentTable,
  createTimeSlotTable,
];
