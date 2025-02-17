import 'package:assignmenttrackerapp/data/models/abstracts/app_model.dart';

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
