import 'package:assignmenttrackerapp/constants/database_constants.dart';
import 'package:assignmenttrackerapp/exceptions/database_exceptions.dart';
import 'package:assignmenttrackerapp/repositories/interfaces/database_accesser.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDatabaseAccessHandler implements DatabaseAccesser{
  static Database? _database;
  static final SqliteDatabaseAccessHandler _instance = SqliteDatabaseAccessHandler._singleton();

  SqliteDatabaseAccessHandler._singleton();

  factory SqliteDatabaseAccessHandler() => _instance;

  @override
  Future<Database> fetchOrCreateDatabase() async {
    if (_database == null) {
      await openDatabaseConnection();
    }
    return _database!;
  }

  @override
  Future<void> dispose() async => closeDatabaseConnection();

  @override
  Future<void> closeDatabaseConnection() async {
    if (_database == null) {
      throw NonExistentDatabaseException();
    }
    await _database?.close();
    _database = null;
  }


  @override
  Future<void> openDatabaseConnection() async {
    if (_database != null) {
      throw ExistingDatabaseException();
    }

    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      final databasePath = join(appDocDir.path, databaseName);
      final database = await openDatabase(
          databasePath); //Note: if the db does not exist this will create it empty with no tables
      _database = database;

      for (String sqfliteCommand in allTableCreates) {
        await database.execute(sqfliteCommand);
      }
    } on MissingPlatformDirectoryException {
      throw DocumentsDirectoryNotFoundException();
    }
  }
}
