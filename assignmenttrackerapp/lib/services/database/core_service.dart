// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignmenttrackerapp/services/database/assignments_service.dart';
import 'package:sqflite/sqflite.dart';

class CoreService {
  Database? _database;

  final AssignmentsService _assignmentsService;

  CoreService({
    required assignmentsService,
  }) : _assignmentsService = assignmentsService;
}
