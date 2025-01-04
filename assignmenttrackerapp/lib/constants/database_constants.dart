const databaseName = 'assignment_tracker_db';
const assignmentTableName = 'assignment';
const userTableName = 'user';

//sqflite commands
const createUserTable = '''CREATE TABLE IF NOT EXISTS "user" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "email" TEXT NOT NULL UNIQUE,
      );''';

const createAssignmentTable = '''CREATE TABLE IF NOT EXISTS "assignment" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "user_id" INTEGER NOT NULL,
        "creation_date" INTEGER NOT NULL,
        "due_date" INTEGER NOT NULL,
        "title" TEXT NOT NULL,
        FOREIGN KEY ("user_id") REFERENCES "user" ("id")
      );''';

const allTableCreates = [createUserTable, createAssignmentTable];
