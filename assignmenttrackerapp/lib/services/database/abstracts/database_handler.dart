import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

mixin DatabaseHandler {
  Database? _database;
  Future<Database> fetchOrCreateDatabase() async {
    if (_database == null) {
      await openDB();
    }
    return _database!;
  }

  Future<void> closeDB() async {
    if (_database == null) {
      throw NonExistentDatabaseException();
    }
    await _database?.close();
    _database = null;
  }

  Future<void> openDB() async {
    if (_database != null) {
      throw ExistingDatabaseException();
    }

    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      final databasePath = join(appDocDir.path, databaseName);
      final database = await openDatabase(
          databasePath); //Note: if the db does not exist this will create it empty with no tables
      _database = database;

      //Create all tables if exists
      for (String sqfliteCommand in allTableCreates) {
        await database.execute(sqfliteCommand);
      }
    } on MissingPlatformDirectoryException {
      throw DocumentsDirectoryNotFoundException();
    }
  }
}
