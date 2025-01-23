import 'package:sqflite/sqflite.dart';

abstract class DatabaseAccesser {
  Future<Database> fetchOrCreateDatabase();
  Future<void> dispose();
  Future<void> openDatabaseConnection();
  Future<void> closeDatabaseConnection();
}