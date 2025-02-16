import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get cloudDBSyncId => text().unique()();
  TextColumn get username => text().unique()();
  TextColumn get email => text().unique()();
}
