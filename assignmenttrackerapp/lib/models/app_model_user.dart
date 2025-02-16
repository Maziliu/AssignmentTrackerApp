import 'package:assignmenttrackerapp/database/app_database.dart';
import 'package:assignmenttrackerapp/enums/user_type.dart';
import 'package:assignmenttrackerapp/models/abstracts/app_model.dart';

class AppModelUser extends AppModel {
  final String? _email;
  final String _username, _cloudDBSyncId;

  AppModelUser(
      {required super.id,
      required String? email,
      required String username,
      required String cloudDBSyncId})
      : _email = email,
        _username = username,
        _cloudDBSyncId = cloudDBSyncId;

  String get email => _email!;
  String get username => _username;
  String get cloudDBSyncId => _cloudDBSyncId;
}
