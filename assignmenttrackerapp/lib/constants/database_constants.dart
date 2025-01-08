const databaseName = 'assignment_tracker_db';
const assignmentTableName = 'assignment';
const userTableName = 'user';
const courseTableName = 'course';
const eventTableName = 'event';

// SQL commands
const createUserTable = '''
CREATE TABLE IF NOT EXISTS "user" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "email" TEXT NOT NULL UNIQUE
);''';

const createAssignmentTable = '''
CREATE TABLE IF NOT EXISTS "assignment" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER NOT NULL,
  "creation_date" INTEGER NOT NULL,
  "due_date" INTEGER NOT NULL,
  "title" TEXT NOT NULL,
  "course" TEXT NOT NULL,
  FOREIGN KEY ("user_id") REFERENCES "user" ("id")
);''';

const createCourseTable = '''
CREATE TABLE IF NOT EXISTS "course" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER NOT NULL,
  "course_name" TEXT NOT NULL,
  FOREIGN KEY ("user_id") REFERENCES "user" ("id")
);''';

const createEventTable = '''
CREATE TABLE IF NOT EXISTS "event" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER NOT NULL,
  "course_id" INTEGER NOT NULL,
  "event_type" INTEGER NOT NULL,
  "scheduled_days" INTEGER NOT NULL,
  "time_slots" TEXT NOT NULL,
  FOREIGN KEY ("user_id") REFERENCES "user" ("id"),
  FOREIGN KEY ("course_id") REFERENCES "course" ("id")
);''';

const allTableCreates = [
  createUserTable,
  createAssignmentTable,
  createCourseTable,
  createEventTable
];
