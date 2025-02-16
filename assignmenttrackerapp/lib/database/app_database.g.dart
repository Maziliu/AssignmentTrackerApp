// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _cloudDBSyncIdMeta =
      const VerificationMeta('cloudDBSyncId');
  @override
  late final GeneratedColumn<String> cloudDBSyncId = GeneratedColumn<String>(
      'cloud_d_b_sync_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id, cloudDBSyncId, username, email];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cloud_d_b_sync_id')) {
      context.handle(
          _cloudDBSyncIdMeta,
          cloudDBSyncId.isAcceptableOrUnknown(
              data['cloud_d_b_sync_id']!, _cloudDBSyncIdMeta));
    } else if (isInserting) {
      context.missing(_cloudDBSyncIdMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      cloudDBSyncId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cloud_d_b_sync_id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String cloudDBSyncId;
  final String username;
  final String email;
  const User(
      {required this.id,
      required this.cloudDBSyncId,
      required this.username,
      required this.email});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cloud_d_b_sync_id'] = Variable<String>(cloudDBSyncId);
    map['username'] = Variable<String>(username);
    map['email'] = Variable<String>(email);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      cloudDBSyncId: Value(cloudDBSyncId),
      username: Value(username),
      email: Value(email),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      cloudDBSyncId: serializer.fromJson<String>(json['cloudDBSyncId']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cloudDBSyncId': serializer.toJson<String>(cloudDBSyncId),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
    };
  }

  User copyWith(
          {int? id, String? cloudDBSyncId, String? username, String? email}) =>
      User(
        id: id ?? this.id,
        cloudDBSyncId: cloudDBSyncId ?? this.cloudDBSyncId,
        username: username ?? this.username,
        email: email ?? this.email,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      cloudDBSyncId: data.cloudDBSyncId.present
          ? data.cloudDBSyncId.value
          : this.cloudDBSyncId,
      username: data.username.present ? data.username.value : this.username,
      email: data.email.present ? data.email.value : this.email,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('cloudDBSyncId: $cloudDBSyncId, ')
          ..write('username: $username, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, cloudDBSyncId, username, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.cloudDBSyncId == this.cloudDBSyncId &&
          other.username == this.username &&
          other.email == this.email);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> cloudDBSyncId;
  final Value<String> username;
  final Value<String> email;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.cloudDBSyncId = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String cloudDBSyncId,
    required String username,
    required String email,
  })  : cloudDBSyncId = Value(cloudDBSyncId),
        username = Value(username),
        email = Value(email);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? cloudDBSyncId,
    Expression<String>? username,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cloudDBSyncId != null) 'cloud_d_b_sync_id': cloudDBSyncId,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? cloudDBSyncId,
      Value<String>? username,
      Value<String>? email}) {
    return UsersCompanion(
      id: id ?? this.id,
      cloudDBSyncId: cloudDBSyncId ?? this.cloudDBSyncId,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cloudDBSyncId.present) {
      map['cloud_d_b_sync_id'] = Variable<String>(cloudDBSyncId.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('cloudDBSyncId: $cloudDBSyncId, ')
          ..write('username: $username, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $GradeScalesTable extends GradeScales
    with TableInfo<$GradeScalesTable, GradeScale> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GradeScalesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (cloud_d_b_sync_id) ON DELETE CASCADE'));
  static const VerificationMeta _thresholdsJsonMeta =
      const VerificationMeta('thresholdsJson');
  @override
  late final GeneratedColumn<String> thresholdsJson = GeneratedColumn<String>(
      'thresholds_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, thresholdsJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grade_scales';
  @override
  VerificationContext validateIntegrity(Insertable<GradeScale> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('thresholds_json')) {
      context.handle(
          _thresholdsJsonMeta,
          thresholdsJson.isAcceptableOrUnknown(
              data['thresholds_json']!, _thresholdsJsonMeta));
    } else if (isInserting) {
      context.missing(_thresholdsJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GradeScale map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GradeScale(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      thresholdsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}thresholds_json'])!,
    );
  }

  @override
  $GradeScalesTable createAlias(String alias) {
    return $GradeScalesTable(attachedDatabase, alias);
  }
}

class GradeScale extends DataClass implements Insertable<GradeScale> {
  final int id;
  final String userId;
  final String thresholdsJson;
  const GradeScale(
      {required this.id, required this.userId, required this.thresholdsJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['thresholds_json'] = Variable<String>(thresholdsJson);
    return map;
  }

  GradeScalesCompanion toCompanion(bool nullToAbsent) {
    return GradeScalesCompanion(
      id: Value(id),
      userId: Value(userId),
      thresholdsJson: Value(thresholdsJson),
    );
  }

  factory GradeScale.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GradeScale(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      thresholdsJson: serializer.fromJson<String>(json['thresholdsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'thresholdsJson': serializer.toJson<String>(thresholdsJson),
    };
  }

  GradeScale copyWith({int? id, String? userId, String? thresholdsJson}) =>
      GradeScale(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        thresholdsJson: thresholdsJson ?? this.thresholdsJson,
      );
  GradeScale copyWithCompanion(GradeScalesCompanion data) {
    return GradeScale(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      thresholdsJson: data.thresholdsJson.present
          ? data.thresholdsJson.value
          : this.thresholdsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GradeScale(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('thresholdsJson: $thresholdsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, thresholdsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GradeScale &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.thresholdsJson == this.thresholdsJson);
}

class GradeScalesCompanion extends UpdateCompanion<GradeScale> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> thresholdsJson;
  const GradeScalesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.thresholdsJson = const Value.absent(),
  });
  GradeScalesCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String thresholdsJson,
  })  : userId = Value(userId),
        thresholdsJson = Value(thresholdsJson);
  static Insertable<GradeScale> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? thresholdsJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (thresholdsJson != null) 'thresholds_json': thresholdsJson,
    });
  }

  GradeScalesCompanion copyWith(
      {Value<int>? id, Value<String>? userId, Value<String>? thresholdsJson}) {
    return GradeScalesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      thresholdsJson: thresholdsJson ?? this.thresholdsJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (thresholdsJson.present) {
      map['thresholds_json'] = Variable<String>(thresholdsJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GradeScalesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('thresholdsJson: $thresholdsJson')
          ..write(')'))
        .toString();
  }
}

class $GradedComponentsTable extends GradedComponents
    with TableInfo<$GradedComponentsTable, GradedComponent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GradedComponentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (cloud_d_b_sync_id) ON DELETE CASCADE'));
  static const VerificationMeta _weightDecimalMeta =
      const VerificationMeta('weightDecimal');
  @override
  late final GeneratedColumn<double> weightDecimal = GeneratedColumn<double>(
      'weight_decimal', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _gradePercentageMeta =
      const VerificationMeta('gradePercentage');
  @override
  late final GeneratedColumn<double> gradePercentage = GeneratedColumn<double>(
      'grade_percentage', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _gradeLetterMeta =
      const VerificationMeta('gradeLetter');
  @override
  late final GeneratedColumn<String> gradeLetter = GeneratedColumn<String>(
      'grade_letter', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, weightDecimal, gradePercentage, gradeLetter];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'graded_components';
  @override
  VerificationContext validateIntegrity(Insertable<GradedComponent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('weight_decimal')) {
      context.handle(
          _weightDecimalMeta,
          weightDecimal.isAcceptableOrUnknown(
              data['weight_decimal']!, _weightDecimalMeta));
    } else if (isInserting) {
      context.missing(_weightDecimalMeta);
    }
    if (data.containsKey('grade_percentage')) {
      context.handle(
          _gradePercentageMeta,
          gradePercentage.isAcceptableOrUnknown(
              data['grade_percentage']!, _gradePercentageMeta));
    } else if (isInserting) {
      context.missing(_gradePercentageMeta);
    }
    if (data.containsKey('grade_letter')) {
      context.handle(
          _gradeLetterMeta,
          gradeLetter.isAcceptableOrUnknown(
              data['grade_letter']!, _gradeLetterMeta));
    } else if (isInserting) {
      context.missing(_gradeLetterMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GradedComponent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GradedComponent(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      weightDecimal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight_decimal'])!,
      gradePercentage: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}grade_percentage'])!,
      gradeLetter: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}grade_letter'])!,
    );
  }

  @override
  $GradedComponentsTable createAlias(String alias) {
    return $GradedComponentsTable(attachedDatabase, alias);
  }
}

class GradedComponent extends DataClass implements Insertable<GradedComponent> {
  final int id;
  final String userId;
  final double weightDecimal;
  final double gradePercentage;
  final String gradeLetter;
  const GradedComponent(
      {required this.id,
      required this.userId,
      required this.weightDecimal,
      required this.gradePercentage,
      required this.gradeLetter});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['weight_decimal'] = Variable<double>(weightDecimal);
    map['grade_percentage'] = Variable<double>(gradePercentage);
    map['grade_letter'] = Variable<String>(gradeLetter);
    return map;
  }

  GradedComponentsCompanion toCompanion(bool nullToAbsent) {
    return GradedComponentsCompanion(
      id: Value(id),
      userId: Value(userId),
      weightDecimal: Value(weightDecimal),
      gradePercentage: Value(gradePercentage),
      gradeLetter: Value(gradeLetter),
    );
  }

  factory GradedComponent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GradedComponent(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      weightDecimal: serializer.fromJson<double>(json['weightDecimal']),
      gradePercentage: serializer.fromJson<double>(json['gradePercentage']),
      gradeLetter: serializer.fromJson<String>(json['gradeLetter']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'weightDecimal': serializer.toJson<double>(weightDecimal),
      'gradePercentage': serializer.toJson<double>(gradePercentage),
      'gradeLetter': serializer.toJson<String>(gradeLetter),
    };
  }

  GradedComponent copyWith(
          {int? id,
          String? userId,
          double? weightDecimal,
          double? gradePercentage,
          String? gradeLetter}) =>
      GradedComponent(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        weightDecimal: weightDecimal ?? this.weightDecimal,
        gradePercentage: gradePercentage ?? this.gradePercentage,
        gradeLetter: gradeLetter ?? this.gradeLetter,
      );
  GradedComponent copyWithCompanion(GradedComponentsCompanion data) {
    return GradedComponent(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      weightDecimal: data.weightDecimal.present
          ? data.weightDecimal.value
          : this.weightDecimal,
      gradePercentage: data.gradePercentage.present
          ? data.gradePercentage.value
          : this.gradePercentage,
      gradeLetter:
          data.gradeLetter.present ? data.gradeLetter.value : this.gradeLetter,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GradedComponent(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('weightDecimal: $weightDecimal, ')
          ..write('gradePercentage: $gradePercentage, ')
          ..write('gradeLetter: $gradeLetter')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, weightDecimal, gradePercentage, gradeLetter);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GradedComponent &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.weightDecimal == this.weightDecimal &&
          other.gradePercentage == this.gradePercentage &&
          other.gradeLetter == this.gradeLetter);
}

class GradedComponentsCompanion extends UpdateCompanion<GradedComponent> {
  final Value<int> id;
  final Value<String> userId;
  final Value<double> weightDecimal;
  final Value<double> gradePercentage;
  final Value<String> gradeLetter;
  const GradedComponentsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.weightDecimal = const Value.absent(),
    this.gradePercentage = const Value.absent(),
    this.gradeLetter = const Value.absent(),
  });
  GradedComponentsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required double weightDecimal,
    required double gradePercentage,
    required String gradeLetter,
  })  : userId = Value(userId),
        weightDecimal = Value(weightDecimal),
        gradePercentage = Value(gradePercentage),
        gradeLetter = Value(gradeLetter);
  static Insertable<GradedComponent> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<double>? weightDecimal,
    Expression<double>? gradePercentage,
    Expression<String>? gradeLetter,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (weightDecimal != null) 'weight_decimal': weightDecimal,
      if (gradePercentage != null) 'grade_percentage': gradePercentage,
      if (gradeLetter != null) 'grade_letter': gradeLetter,
    });
  }

  GradedComponentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<double>? weightDecimal,
      Value<double>? gradePercentage,
      Value<String>? gradeLetter}) {
    return GradedComponentsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      weightDecimal: weightDecimal ?? this.weightDecimal,
      gradePercentage: gradePercentage ?? this.gradePercentage,
      gradeLetter: gradeLetter ?? this.gradeLetter,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (weightDecimal.present) {
      map['weight_decimal'] = Variable<double>(weightDecimal.value);
    }
    if (gradePercentage.present) {
      map['grade_percentage'] = Variable<double>(gradePercentage.value);
    }
    if (gradeLetter.present) {
      map['grade_letter'] = Variable<String>(gradeLetter.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GradedComponentsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('weightDecimal: $weightDecimal, ')
          ..write('gradePercentage: $gradePercentage, ')
          ..write('gradeLetter: $gradeLetter')
          ..write(')'))
        .toString();
  }
}

class $TimeslotsTable extends Timeslots
    with TableInfo<$TimeslotsTable, Timeslot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimeslotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (cloud_d_b_sync_id) ON DELETE CASCADE'));
  static const VerificationMeta _endingDayMeta =
      const VerificationMeta('endingDay');
  @override
  late final GeneratedColumnWithTypeConverter<DaysOfTheWeek, int> endingDay =
      GeneratedColumn<int>('ending_day', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<DaysOfTheWeek>($TimeslotsTable.$converterendingDay);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, endingDay, startDate, endDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timeslots';
  @override
  VerificationContext validateIntegrity(Insertable<Timeslot> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    context.handle(_endingDayMeta, const VerificationResult.success());
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Timeslot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Timeslot(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      endingDay: $TimeslotsTable.$converterendingDay.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ending_day'])!),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
    );
  }

  @override
  $TimeslotsTable createAlias(String alias) {
    return $TimeslotsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DaysOfTheWeek, int, int> $converterendingDay =
      const EnumIndexConverter<DaysOfTheWeek>(DaysOfTheWeek.values);
}

class Timeslot extends DataClass implements Insertable<Timeslot> {
  final int id;
  final String userId;
  final DaysOfTheWeek endingDay;
  final DateTime? startDate;
  final DateTime endDate;
  const Timeslot(
      {required this.id,
      required this.userId,
      required this.endingDay,
      this.startDate,
      required this.endDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    {
      map['ending_day'] =
          Variable<int>($TimeslotsTable.$converterendingDay.toSql(endingDay));
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    map['end_date'] = Variable<DateTime>(endDate);
    return map;
  }

  TimeslotsCompanion toCompanion(bool nullToAbsent) {
    return TimeslotsCompanion(
      id: Value(id),
      userId: Value(userId),
      endingDay: Value(endingDay),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: Value(endDate),
    );
  }

  factory Timeslot.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Timeslot(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      endingDay: $TimeslotsTable.$converterendingDay
          .fromJson(serializer.fromJson<int>(json['endingDay'])),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'endingDay': serializer
          .toJson<int>($TimeslotsTable.$converterendingDay.toJson(endingDay)),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
    };
  }

  Timeslot copyWith(
          {int? id,
          String? userId,
          DaysOfTheWeek? endingDay,
          Value<DateTime?> startDate = const Value.absent(),
          DateTime? endDate}) =>
      Timeslot(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        endingDay: endingDay ?? this.endingDay,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate ?? this.endDate,
      );
  Timeslot copyWithCompanion(TimeslotsCompanion data) {
    return Timeslot(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      endingDay: data.endingDay.present ? data.endingDay.value : this.endingDay,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Timeslot(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('endingDay: $endingDay, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, endingDay, startDate, endDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Timeslot &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.endingDay == this.endingDay &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class TimeslotsCompanion extends UpdateCompanion<Timeslot> {
  final Value<int> id;
  final Value<String> userId;
  final Value<DaysOfTheWeek> endingDay;
  final Value<DateTime?> startDate;
  final Value<DateTime> endDate;
  const TimeslotsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.endingDay = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  TimeslotsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required DaysOfTheWeek endingDay,
    this.startDate = const Value.absent(),
    required DateTime endDate,
  })  : userId = Value(userId),
        endingDay = Value(endingDay),
        endDate = Value(endDate);
  static Insertable<Timeslot> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<int>? endingDay,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (endingDay != null) 'ending_day': endingDay,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  TimeslotsCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<DaysOfTheWeek>? endingDay,
      Value<DateTime?>? startDate,
      Value<DateTime>? endDate}) {
    return TimeslotsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      endingDay: endingDay ?? this.endingDay,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (endingDay.present) {
      map['ending_day'] = Variable<int>(
          $TimeslotsTable.$converterendingDay.toSql(endingDay.value));
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimeslotsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('endingDay: $endingDay, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

class $CoursesTable extends Courses with TableInfo<$CoursesTable, Course> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoursesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (cloud_d_b_sync_id) ON DELETE CASCADE'));
  static const VerificationMeta _gradeScaleIdMeta =
      const VerificationMeta('gradeScaleId');
  @override
  late final GeneratedColumn<int> gradeScaleId = GeneratedColumn<int>(
      'grade_scale_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES grade_scales (id) ON DELETE CASCADE'));
  static const VerificationMeta _gradedComponentIdMeta =
      const VerificationMeta('gradedComponentId');
  @override
  late final GeneratedColumn<int> gradedComponentId = GeneratedColumn<int>(
      'graded_component_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES graded_components (id) ON DELETE CASCADE'));
  static const VerificationMeta _timeslotIdMeta =
      const VerificationMeta('timeslotId');
  @override
  late final GeneratedColumn<int> timeslotId = GeneratedColumn<int>(
      'timeslot_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES timeslots (id) ON DELETE CASCADE'));
  static const VerificationMeta _courseNameMeta =
      const VerificationMeta('courseName');
  @override
  late final GeneratedColumn<String> courseName = GeneratedColumn<String>(
      'course_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _courseCodeMeta =
      const VerificationMeta('courseCode');
  @override
  late final GeneratedColumn<String> courseCode = GeneratedColumn<String>(
      'course_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scheduleBitMaskMeta =
      const VerificationMeta('scheduleBitMask');
  @override
  late final GeneratedColumn<int> scheduleBitMask = GeneratedColumn<int>(
      'schedule_bit_mask', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        gradeScaleId,
        gradedComponentId,
        timeslotId,
        courseName,
        courseCode,
        scheduleBitMask
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'courses';
  @override
  VerificationContext validateIntegrity(Insertable<Course> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('grade_scale_id')) {
      context.handle(
          _gradeScaleIdMeta,
          gradeScaleId.isAcceptableOrUnknown(
              data['grade_scale_id']!, _gradeScaleIdMeta));
    } else if (isInserting) {
      context.missing(_gradeScaleIdMeta);
    }
    if (data.containsKey('graded_component_id')) {
      context.handle(
          _gradedComponentIdMeta,
          gradedComponentId.isAcceptableOrUnknown(
              data['graded_component_id']!, _gradedComponentIdMeta));
    } else if (isInserting) {
      context.missing(_gradedComponentIdMeta);
    }
    if (data.containsKey('timeslot_id')) {
      context.handle(
          _timeslotIdMeta,
          timeslotId.isAcceptableOrUnknown(
              data['timeslot_id']!, _timeslotIdMeta));
    } else if (isInserting) {
      context.missing(_timeslotIdMeta);
    }
    if (data.containsKey('course_name')) {
      context.handle(
          _courseNameMeta,
          courseName.isAcceptableOrUnknown(
              data['course_name']!, _courseNameMeta));
    } else if (isInserting) {
      context.missing(_courseNameMeta);
    }
    if (data.containsKey('course_code')) {
      context.handle(
          _courseCodeMeta,
          courseCode.isAcceptableOrUnknown(
              data['course_code']!, _courseCodeMeta));
    } else if (isInserting) {
      context.missing(_courseCodeMeta);
    }
    if (data.containsKey('schedule_bit_mask')) {
      context.handle(
          _scheduleBitMaskMeta,
          scheduleBitMask.isAcceptableOrUnknown(
              data['schedule_bit_mask']!, _scheduleBitMaskMeta));
    } else if (isInserting) {
      context.missing(_scheduleBitMaskMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Course map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Course(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      gradeScaleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grade_scale_id'])!,
      gradedComponentId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}graded_component_id'])!,
      timeslotId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timeslot_id'])!,
      courseName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_name'])!,
      courseCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_code'])!,
      scheduleBitMask: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}schedule_bit_mask'])!,
    );
  }

  @override
  $CoursesTable createAlias(String alias) {
    return $CoursesTable(attachedDatabase, alias);
  }
}

class Course extends DataClass implements Insertable<Course> {
  final int id;
  final String userId;
  final int gradeScaleId;
  final int gradedComponentId;
  final int timeslotId;
  final String courseName;
  final String courseCode;
  final int scheduleBitMask;
  const Course(
      {required this.id,
      required this.userId,
      required this.gradeScaleId,
      required this.gradedComponentId,
      required this.timeslotId,
      required this.courseName,
      required this.courseCode,
      required this.scheduleBitMask});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['grade_scale_id'] = Variable<int>(gradeScaleId);
    map['graded_component_id'] = Variable<int>(gradedComponentId);
    map['timeslot_id'] = Variable<int>(timeslotId);
    map['course_name'] = Variable<String>(courseName);
    map['course_code'] = Variable<String>(courseCode);
    map['schedule_bit_mask'] = Variable<int>(scheduleBitMask);
    return map;
  }

  CoursesCompanion toCompanion(bool nullToAbsent) {
    return CoursesCompanion(
      id: Value(id),
      userId: Value(userId),
      gradeScaleId: Value(gradeScaleId),
      gradedComponentId: Value(gradedComponentId),
      timeslotId: Value(timeslotId),
      courseName: Value(courseName),
      courseCode: Value(courseCode),
      scheduleBitMask: Value(scheduleBitMask),
    );
  }

  factory Course.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Course(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      gradeScaleId: serializer.fromJson<int>(json['gradeScaleId']),
      gradedComponentId: serializer.fromJson<int>(json['gradedComponentId']),
      timeslotId: serializer.fromJson<int>(json['timeslotId']),
      courseName: serializer.fromJson<String>(json['courseName']),
      courseCode: serializer.fromJson<String>(json['courseCode']),
      scheduleBitMask: serializer.fromJson<int>(json['scheduleBitMask']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'gradeScaleId': serializer.toJson<int>(gradeScaleId),
      'gradedComponentId': serializer.toJson<int>(gradedComponentId),
      'timeslotId': serializer.toJson<int>(timeslotId),
      'courseName': serializer.toJson<String>(courseName),
      'courseCode': serializer.toJson<String>(courseCode),
      'scheduleBitMask': serializer.toJson<int>(scheduleBitMask),
    };
  }

  Course copyWith(
          {int? id,
          String? userId,
          int? gradeScaleId,
          int? gradedComponentId,
          int? timeslotId,
          String? courseName,
          String? courseCode,
          int? scheduleBitMask}) =>
      Course(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        gradeScaleId: gradeScaleId ?? this.gradeScaleId,
        gradedComponentId: gradedComponentId ?? this.gradedComponentId,
        timeslotId: timeslotId ?? this.timeslotId,
        courseName: courseName ?? this.courseName,
        courseCode: courseCode ?? this.courseCode,
        scheduleBitMask: scheduleBitMask ?? this.scheduleBitMask,
      );
  Course copyWithCompanion(CoursesCompanion data) {
    return Course(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      gradeScaleId: data.gradeScaleId.present
          ? data.gradeScaleId.value
          : this.gradeScaleId,
      gradedComponentId: data.gradedComponentId.present
          ? data.gradedComponentId.value
          : this.gradedComponentId,
      timeslotId:
          data.timeslotId.present ? data.timeslotId.value : this.timeslotId,
      courseName:
          data.courseName.present ? data.courseName.value : this.courseName,
      courseCode:
          data.courseCode.present ? data.courseCode.value : this.courseCode,
      scheduleBitMask: data.scheduleBitMask.present
          ? data.scheduleBitMask.value
          : this.scheduleBitMask,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Course(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('gradeScaleId: $gradeScaleId, ')
          ..write('gradedComponentId: $gradedComponentId, ')
          ..write('timeslotId: $timeslotId, ')
          ..write('courseName: $courseName, ')
          ..write('courseCode: $courseCode, ')
          ..write('scheduleBitMask: $scheduleBitMask')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, gradeScaleId, gradedComponentId,
      timeslotId, courseName, courseCode, scheduleBitMask);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Course &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.gradeScaleId == this.gradeScaleId &&
          other.gradedComponentId == this.gradedComponentId &&
          other.timeslotId == this.timeslotId &&
          other.courseName == this.courseName &&
          other.courseCode == this.courseCode &&
          other.scheduleBitMask == this.scheduleBitMask);
}

class CoursesCompanion extends UpdateCompanion<Course> {
  final Value<int> id;
  final Value<String> userId;
  final Value<int> gradeScaleId;
  final Value<int> gradedComponentId;
  final Value<int> timeslotId;
  final Value<String> courseName;
  final Value<String> courseCode;
  final Value<int> scheduleBitMask;
  const CoursesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.gradeScaleId = const Value.absent(),
    this.gradedComponentId = const Value.absent(),
    this.timeslotId = const Value.absent(),
    this.courseName = const Value.absent(),
    this.courseCode = const Value.absent(),
    this.scheduleBitMask = const Value.absent(),
  });
  CoursesCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required int gradeScaleId,
    required int gradedComponentId,
    required int timeslotId,
    required String courseName,
    required String courseCode,
    required int scheduleBitMask,
  })  : userId = Value(userId),
        gradeScaleId = Value(gradeScaleId),
        gradedComponentId = Value(gradedComponentId),
        timeslotId = Value(timeslotId),
        courseName = Value(courseName),
        courseCode = Value(courseCode),
        scheduleBitMask = Value(scheduleBitMask);
  static Insertable<Course> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<int>? gradeScaleId,
    Expression<int>? gradedComponentId,
    Expression<int>? timeslotId,
    Expression<String>? courseName,
    Expression<String>? courseCode,
    Expression<int>? scheduleBitMask,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (gradeScaleId != null) 'grade_scale_id': gradeScaleId,
      if (gradedComponentId != null) 'graded_component_id': gradedComponentId,
      if (timeslotId != null) 'timeslot_id': timeslotId,
      if (courseName != null) 'course_name': courseName,
      if (courseCode != null) 'course_code': courseCode,
      if (scheduleBitMask != null) 'schedule_bit_mask': scheduleBitMask,
    });
  }

  CoursesCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<int>? gradeScaleId,
      Value<int>? gradedComponentId,
      Value<int>? timeslotId,
      Value<String>? courseName,
      Value<String>? courseCode,
      Value<int>? scheduleBitMask}) {
    return CoursesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      gradeScaleId: gradeScaleId ?? this.gradeScaleId,
      gradedComponentId: gradedComponentId ?? this.gradedComponentId,
      timeslotId: timeslotId ?? this.timeslotId,
      courseName: courseName ?? this.courseName,
      courseCode: courseCode ?? this.courseCode,
      scheduleBitMask: scheduleBitMask ?? this.scheduleBitMask,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (gradeScaleId.present) {
      map['grade_scale_id'] = Variable<int>(gradeScaleId.value);
    }
    if (gradedComponentId.present) {
      map['graded_component_id'] = Variable<int>(gradedComponentId.value);
    }
    if (timeslotId.present) {
      map['timeslot_id'] = Variable<int>(timeslotId.value);
    }
    if (courseName.present) {
      map['course_name'] = Variable<String>(courseName.value);
    }
    if (courseCode.present) {
      map['course_code'] = Variable<String>(courseCode.value);
    }
    if (scheduleBitMask.present) {
      map['schedule_bit_mask'] = Variable<int>(scheduleBitMask.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoursesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('gradeScaleId: $gradeScaleId, ')
          ..write('gradedComponentId: $gradedComponentId, ')
          ..write('timeslotId: $timeslotId, ')
          ..write('courseName: $courseName, ')
          ..write('courseCode: $courseCode, ')
          ..write('scheduleBitMask: $scheduleBitMask')
          ..write(')'))
        .toString();
  }
}

class $AssessmentsTable extends Assessments
    with TableInfo<$AssessmentsTable, Assessment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssessmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (cloud_d_b_sync_id) ON DELETE CASCADE'));
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<int> courseId = GeneratedColumn<int>(
      'course_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES courses (id) ON DELETE CASCADE'));
  static const VerificationMeta _gradedComponentIdMeta =
      const VerificationMeta('gradedComponentId');
  @override
  late final GeneratedColumn<int> gradedComponentId = GeneratedColumn<int>(
      'graded_component_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES graded_components (id) ON DELETE CASCADE'));
  static const VerificationMeta _timeslotIdMeta =
      const VerificationMeta('timeslotId');
  @override
  late final GeneratedColumn<int> timeslotId = GeneratedColumn<int>(
      'timeslot_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES timeslots (id) ON DELETE CASCADE'));
  static const VerificationMeta _assessmentNameMeta =
      const VerificationMeta('assessmentName');
  @override
  late final GeneratedColumn<String> assessmentName = GeneratedColumn<String>(
      'assessment_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<AssessmentType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<AssessmentType>($AssessmentsTable.$convertertype);
  static const VerificationMeta _isCompleteMeta =
      const VerificationMeta('isComplete');
  @override
  late final GeneratedColumn<bool> isComplete = GeneratedColumn<bool>(
      'is_complete', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_complete" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        courseId,
        gradedComponentId,
        timeslotId,
        assessmentName,
        type,
        isComplete
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assessments';
  @override
  VerificationContext validateIntegrity(Insertable<Assessment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('graded_component_id')) {
      context.handle(
          _gradedComponentIdMeta,
          gradedComponentId.isAcceptableOrUnknown(
              data['graded_component_id']!, _gradedComponentIdMeta));
    } else if (isInserting) {
      context.missing(_gradedComponentIdMeta);
    }
    if (data.containsKey('timeslot_id')) {
      context.handle(
          _timeslotIdMeta,
          timeslotId.isAcceptableOrUnknown(
              data['timeslot_id']!, _timeslotIdMeta));
    } else if (isInserting) {
      context.missing(_timeslotIdMeta);
    }
    if (data.containsKey('assessment_name')) {
      context.handle(
          _assessmentNameMeta,
          assessmentName.isAcceptableOrUnknown(
              data['assessment_name']!, _assessmentNameMeta));
    } else if (isInserting) {
      context.missing(_assessmentNameMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('is_complete')) {
      context.handle(
          _isCompleteMeta,
          isComplete.isAcceptableOrUnknown(
              data['is_complete']!, _isCompleteMeta));
    } else if (isInserting) {
      context.missing(_isCompleteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Assessment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Assessment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}course_id'])!,
      gradedComponentId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}graded_component_id'])!,
      timeslotId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timeslot_id'])!,
      assessmentName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}assessment_name'])!,
      type: $AssessmentsTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      isComplete: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_complete'])!,
    );
  }

  @override
  $AssessmentsTable createAlias(String alias) {
    return $AssessmentsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AssessmentType, int, int> $convertertype =
      const EnumIndexConverter<AssessmentType>(AssessmentType.values);
}

class Assessment extends DataClass implements Insertable<Assessment> {
  final int id;
  final String userId;
  final int courseId;
  final int gradedComponentId;
  final int timeslotId;
  final String assessmentName;
  final AssessmentType type;
  final bool isComplete;
  const Assessment(
      {required this.id,
      required this.userId,
      required this.courseId,
      required this.gradedComponentId,
      required this.timeslotId,
      required this.assessmentName,
      required this.type,
      required this.isComplete});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['course_id'] = Variable<int>(courseId);
    map['graded_component_id'] = Variable<int>(gradedComponentId);
    map['timeslot_id'] = Variable<int>(timeslotId);
    map['assessment_name'] = Variable<String>(assessmentName);
    {
      map['type'] = Variable<int>($AssessmentsTable.$convertertype.toSql(type));
    }
    map['is_complete'] = Variable<bool>(isComplete);
    return map;
  }

  AssessmentsCompanion toCompanion(bool nullToAbsent) {
    return AssessmentsCompanion(
      id: Value(id),
      userId: Value(userId),
      courseId: Value(courseId),
      gradedComponentId: Value(gradedComponentId),
      timeslotId: Value(timeslotId),
      assessmentName: Value(assessmentName),
      type: Value(type),
      isComplete: Value(isComplete),
    );
  }

  factory Assessment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Assessment(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      courseId: serializer.fromJson<int>(json['courseId']),
      gradedComponentId: serializer.fromJson<int>(json['gradedComponentId']),
      timeslotId: serializer.fromJson<int>(json['timeslotId']),
      assessmentName: serializer.fromJson<String>(json['assessmentName']),
      type: $AssessmentsTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      isComplete: serializer.fromJson<bool>(json['isComplete']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'courseId': serializer.toJson<int>(courseId),
      'gradedComponentId': serializer.toJson<int>(gradedComponentId),
      'timeslotId': serializer.toJson<int>(timeslotId),
      'assessmentName': serializer.toJson<String>(assessmentName),
      'type':
          serializer.toJson<int>($AssessmentsTable.$convertertype.toJson(type)),
      'isComplete': serializer.toJson<bool>(isComplete),
    };
  }

  Assessment copyWith(
          {int? id,
          String? userId,
          int? courseId,
          int? gradedComponentId,
          int? timeslotId,
          String? assessmentName,
          AssessmentType? type,
          bool? isComplete}) =>
      Assessment(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        courseId: courseId ?? this.courseId,
        gradedComponentId: gradedComponentId ?? this.gradedComponentId,
        timeslotId: timeslotId ?? this.timeslotId,
        assessmentName: assessmentName ?? this.assessmentName,
        type: type ?? this.type,
        isComplete: isComplete ?? this.isComplete,
      );
  Assessment copyWithCompanion(AssessmentsCompanion data) {
    return Assessment(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      gradedComponentId: data.gradedComponentId.present
          ? data.gradedComponentId.value
          : this.gradedComponentId,
      timeslotId:
          data.timeslotId.present ? data.timeslotId.value : this.timeslotId,
      assessmentName: data.assessmentName.present
          ? data.assessmentName.value
          : this.assessmentName,
      type: data.type.present ? data.type.value : this.type,
      isComplete:
          data.isComplete.present ? data.isComplete.value : this.isComplete,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Assessment(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('courseId: $courseId, ')
          ..write('gradedComponentId: $gradedComponentId, ')
          ..write('timeslotId: $timeslotId, ')
          ..write('assessmentName: $assessmentName, ')
          ..write('type: $type, ')
          ..write('isComplete: $isComplete')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, courseId, gradedComponentId,
      timeslotId, assessmentName, type, isComplete);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Assessment &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.courseId == this.courseId &&
          other.gradedComponentId == this.gradedComponentId &&
          other.timeslotId == this.timeslotId &&
          other.assessmentName == this.assessmentName &&
          other.type == this.type &&
          other.isComplete == this.isComplete);
}

class AssessmentsCompanion extends UpdateCompanion<Assessment> {
  final Value<int> id;
  final Value<String> userId;
  final Value<int> courseId;
  final Value<int> gradedComponentId;
  final Value<int> timeslotId;
  final Value<String> assessmentName;
  final Value<AssessmentType> type;
  final Value<bool> isComplete;
  const AssessmentsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.courseId = const Value.absent(),
    this.gradedComponentId = const Value.absent(),
    this.timeslotId = const Value.absent(),
    this.assessmentName = const Value.absent(),
    this.type = const Value.absent(),
    this.isComplete = const Value.absent(),
  });
  AssessmentsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required int courseId,
    required int gradedComponentId,
    required int timeslotId,
    required String assessmentName,
    required AssessmentType type,
    required bool isComplete,
  })  : userId = Value(userId),
        courseId = Value(courseId),
        gradedComponentId = Value(gradedComponentId),
        timeslotId = Value(timeslotId),
        assessmentName = Value(assessmentName),
        type = Value(type),
        isComplete = Value(isComplete);
  static Insertable<Assessment> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<int>? courseId,
    Expression<int>? gradedComponentId,
    Expression<int>? timeslotId,
    Expression<String>? assessmentName,
    Expression<int>? type,
    Expression<bool>? isComplete,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (courseId != null) 'course_id': courseId,
      if (gradedComponentId != null) 'graded_component_id': gradedComponentId,
      if (timeslotId != null) 'timeslot_id': timeslotId,
      if (assessmentName != null) 'assessment_name': assessmentName,
      if (type != null) 'type': type,
      if (isComplete != null) 'is_complete': isComplete,
    });
  }

  AssessmentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<int>? courseId,
      Value<int>? gradedComponentId,
      Value<int>? timeslotId,
      Value<String>? assessmentName,
      Value<AssessmentType>? type,
      Value<bool>? isComplete}) {
    return AssessmentsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      courseId: courseId ?? this.courseId,
      gradedComponentId: gradedComponentId ?? this.gradedComponentId,
      timeslotId: timeslotId ?? this.timeslotId,
      assessmentName: assessmentName ?? this.assessmentName,
      type: type ?? this.type,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<int>(courseId.value);
    }
    if (gradedComponentId.present) {
      map['graded_component_id'] = Variable<int>(gradedComponentId.value);
    }
    if (timeslotId.present) {
      map['timeslot_id'] = Variable<int>(timeslotId.value);
    }
    if (assessmentName.present) {
      map['assessment_name'] = Variable<String>(assessmentName.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($AssessmentsTable.$convertertype.toSql(type.value));
    }
    if (isComplete.present) {
      map['is_complete'] = Variable<bool>(isComplete.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('courseId: $courseId, ')
          ..write('gradedComponentId: $gradedComponentId, ')
          ..write('timeslotId: $timeslotId, ')
          ..write('assessmentName: $assessmentName, ')
          ..write('type: $type, ')
          ..write('isComplete: $isComplete')
          ..write(')'))
        .toString();
  }
}

class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (cloud_d_b_sync_id) ON DELETE CASCADE'));
  static const VerificationMeta _timeslotIdMeta =
      const VerificationMeta('timeslotId');
  @override
  late final GeneratedColumn<int> timeslotId = GeneratedColumn<int>(
      'timeslot_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES timeslots (id) ON DELETE CASCADE'));
  static const VerificationMeta _eventNameMeta =
      const VerificationMeta('eventName');
  @override
  late final GeneratedColumn<String> eventName = GeneratedColumn<String>(
      'event_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, timeslotId, eventName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  VerificationContext validateIntegrity(Insertable<Event> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('timeslot_id')) {
      context.handle(
          _timeslotIdMeta,
          timeslotId.isAcceptableOrUnknown(
              data['timeslot_id']!, _timeslotIdMeta));
    } else if (isInserting) {
      context.missing(_timeslotIdMeta);
    }
    if (data.containsKey('event_name')) {
      context.handle(_eventNameMeta,
          eventName.isAcceptableOrUnknown(data['event_name']!, _eventNameMeta));
    } else if (isInserting) {
      context.missing(_eventNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Event(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      timeslotId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timeslot_id'])!,
      eventName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event_name'])!,
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }
}

class Event extends DataClass implements Insertable<Event> {
  final int id;
  final String userId;
  final int timeslotId;
  final String eventName;
  const Event(
      {required this.id,
      required this.userId,
      required this.timeslotId,
      required this.eventName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['timeslot_id'] = Variable<int>(timeslotId);
    map['event_name'] = Variable<String>(eventName);
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      userId: Value(userId),
      timeslotId: Value(timeslotId),
      eventName: Value(eventName),
    );
  }

  factory Event.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      timeslotId: serializer.fromJson<int>(json['timeslotId']),
      eventName: serializer.fromJson<String>(json['eventName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'timeslotId': serializer.toJson<int>(timeslotId),
      'eventName': serializer.toJson<String>(eventName),
    };
  }

  Event copyWith(
          {int? id, String? userId, int? timeslotId, String? eventName}) =>
      Event(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        timeslotId: timeslotId ?? this.timeslotId,
        eventName: eventName ?? this.eventName,
      );
  Event copyWithCompanion(EventsCompanion data) {
    return Event(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      timeslotId:
          data.timeslotId.present ? data.timeslotId.value : this.timeslotId,
      eventName: data.eventName.present ? data.eventName.value : this.eventName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('timeslotId: $timeslotId, ')
          ..write('eventName: $eventName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, timeslotId, eventName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.timeslotId == this.timeslotId &&
          other.eventName == this.eventName);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<int> id;
  final Value<String> userId;
  final Value<int> timeslotId;
  final Value<String> eventName;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.timeslotId = const Value.absent(),
    this.eventName = const Value.absent(),
  });
  EventsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required int timeslotId,
    required String eventName,
  })  : userId = Value(userId),
        timeslotId = Value(timeslotId),
        eventName = Value(eventName);
  static Insertable<Event> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<int>? timeslotId,
    Expression<String>? eventName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (timeslotId != null) 'timeslot_id': timeslotId,
      if (eventName != null) 'event_name': eventName,
    });
  }

  EventsCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<int>? timeslotId,
      Value<String>? eventName}) {
    return EventsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      timeslotId: timeslotId ?? this.timeslotId,
      eventName: eventName ?? this.eventName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (timeslotId.present) {
      map['timeslot_id'] = Variable<int>(timeslotId.value);
    }
    if (eventName.present) {
      map['event_name'] = Variable<String>(eventName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('timeslotId: $timeslotId, ')
          ..write('eventName: $eventName')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $GradeScalesTable gradeScales = $GradeScalesTable(this);
  late final $GradedComponentsTable gradedComponents =
      $GradedComponentsTable(this);
  late final $TimeslotsTable timeslots = $TimeslotsTable(this);
  late final $CoursesTable courses = $CoursesTable(this);
  late final $AssessmentsTable assessments = $AssessmentsTable(this);
  late final $EventsTable events = $EventsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        gradeScales,
        gradedComponents,
        timeslots,
        courses,
        assessments,
        events
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('grade_scales', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('graded_components', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('timeslots', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('courses', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('grade_scales',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('courses', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('graded_components',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('courses', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('timeslots',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('courses', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('assessments', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('courses',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('assessments', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('graded_components',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('assessments', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('timeslots',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('assessments', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('events', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('timeslots',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('events', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String cloudDBSyncId,
  required String username,
  required String email,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> cloudDBSyncId,
  Value<String> username,
  Value<String> email,
});

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GradeScalesTable, List<GradeScale>>
      _gradeScalesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.gradeScales,
              aliasName: $_aliasNameGenerator(
                  db.users.cloudDBSyncId, db.gradeScales.userId));

  $$GradeScalesTableProcessedTableManager get gradeScalesRefs {
    final manager = $$GradeScalesTableTableManager($_db, $_db.gradeScales)
        .filter((f) => f.userId.cloudDBSyncId($_item.cloudDBSyncId));

    final cache = $_typedResult.readTableOrNull(_gradeScalesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$GradedComponentsTable, List<GradedComponent>>
      _gradedComponentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.gradedComponents,
              aliasName: $_aliasNameGenerator(
                  db.users.cloudDBSyncId, db.gradedComponents.userId));

  $$GradedComponentsTableProcessedTableManager get gradedComponentsRefs {
    final manager =
        $$GradedComponentsTableTableManager($_db, $_db.gradedComponents)
            .filter((f) => f.userId.cloudDBSyncId($_item.cloudDBSyncId));

    final cache =
        $_typedResult.readTableOrNull(_gradedComponentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TimeslotsTable, List<Timeslot>>
      _timeslotsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.timeslots,
              aliasName: $_aliasNameGenerator(
                  db.users.cloudDBSyncId, db.timeslots.userId));

  $$TimeslotsTableProcessedTableManager get timeslotsRefs {
    final manager = $$TimeslotsTableTableManager($_db, $_db.timeslots)
        .filter((f) => f.userId.cloudDBSyncId($_item.cloudDBSyncId));

    final cache = $_typedResult.readTableOrNull(_timeslotsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$CoursesTable, List<Course>> _coursesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.courses,
          aliasName:
              $_aliasNameGenerator(db.users.cloudDBSyncId, db.courses.userId));

  $$CoursesTableProcessedTableManager get coursesRefs {
    final manager = $$CoursesTableTableManager($_db, $_db.courses)
        .filter((f) => f.userId.cloudDBSyncId($_item.cloudDBSyncId));

    final cache = $_typedResult.readTableOrNull(_coursesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AssessmentsTable, List<Assessment>>
      _assessmentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.assessments,
              aliasName: $_aliasNameGenerator(
                  db.users.cloudDBSyncId, db.assessments.userId));

  $$AssessmentsTableProcessedTableManager get assessmentsRefs {
    final manager = $$AssessmentsTableTableManager($_db, $_db.assessments)
        .filter((f) => f.userId.cloudDBSyncId($_item.cloudDBSyncId));

    final cache = $_typedResult.readTableOrNull(_assessmentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$EventsTable, List<Event>> _eventsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.events,
          aliasName:
              $_aliasNameGenerator(db.users.cloudDBSyncId, db.events.userId));

  $$EventsTableProcessedTableManager get eventsRefs {
    final manager = $$EventsTableTableManager($_db, $_db.events)
        .filter((f) => f.userId.cloudDBSyncId($_item.cloudDBSyncId));

    final cache = $_typedResult.readTableOrNull(_eventsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cloudDBSyncId => $composableBuilder(
      column: $table.cloudDBSyncId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  Expression<bool> gradeScalesRefs(
      Expression<bool> Function($$GradeScalesTableFilterComposer f) f) {
    final $$GradeScalesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cloudDBSyncId,
        referencedTable: $db.gradeScales,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradeScalesTableFilterComposer(
              $db: $db,
              $table: $db.gradeScales,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> gradedComponentsRefs(
      Expression<bool> Function($$GradedComponentsTableFilterComposer f) f) {
    final $$GradedComponentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cloudDBSyncId,
        referencedTable: $db.gradedComponents,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradedComponentsTableFilterComposer(
              $db: $db,
              $table: $db.gradedComponents,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> timeslotsRefs(
      Expression<bool> Function($$TimeslotsTableFilterComposer f) f) {
    final $$TimeslotsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cloudDBSyncId,
        referencedTable: $db.timeslots,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimeslotsTableFilterComposer(
              $db: $db,
              $table: $db.timeslots,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> coursesRefs(
      Expression<bool> Function($$CoursesTableFilterComposer f) f) {
    final $$CoursesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cloudDBSyncId,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableFilterComposer(
              $db: $db,
              $table: $db.courses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> assessmentsRefs(
      Expression<bool> Function($$AssessmentsTableFilterComposer f) f) {
    final $$AssessmentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cloudDBSyncId,
        referencedTable: $db.assessments,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssessmentsTableFilterComposer(
              $db: $db,
              $table: $db.assessments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> eventsRefs(
      Expression<bool> Function($$EventsTableFilterComposer f) f) {
    final $$EventsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cloudDBSyncId,
        referencedTable: $db.events,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventsTableFilterComposer(
              $db: $db,
              $table: $db.events,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cloudDBSyncId => $composableBuilder(
      column: $table.cloudDBSyncId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cloudDBSyncId => $composableBuilder(
      column: $table.cloudDBSyncId, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  Expression<T> gradeScalesRefs<T extends Object>(
      Expression<T> Function($$GradeScalesTableAnnotationComposer a) f) {
    final $$GradeScalesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cloudDBSyncId,
        referencedTable: $db.gradeScales,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradeScalesTableAnnotationComposer(
              $db: $db,
              $table: $db.gradeScales,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> gradedComponentsRefs<T extends Object>(
      Expression<T> Function($$GradedComponentsTableAnnotationComposer a) f) {
    final $$GradedComponentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cloudDBSyncId,
        referencedTable: $db.gradedComponents,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradedComponentsTableAnnotationComposer(
              $db: $db,
              $table: $db.gradedComponents,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> timeslotsRefs<T extends Object>(
      Expression<T> Function($$TimeslotsTableAnnotationComposer a) f) {
    final $$TimeslotsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cloudDBSyncId,
        referencedTable: $db.timeslots,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimeslotsTableAnnotationComposer(
              $db: $db,
              $table: $db.timeslots,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> coursesRefs<T extends Object>(
      Expression<T> Function($$CoursesTableAnnotationComposer a) f) {
    final $$CoursesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cloudDBSyncId,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableAnnotationComposer(
              $db: $db,
              $table: $db.courses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> assessmentsRefs<T extends Object>(
      Expression<T> Function($$AssessmentsTableAnnotationComposer a) f) {
    final $$AssessmentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cloudDBSyncId,
        referencedTable: $db.assessments,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssessmentsTableAnnotationComposer(
              $db: $db,
              $table: $db.assessments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> eventsRefs<T extends Object>(
      Expression<T> Function($$EventsTableAnnotationComposer a) f) {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cloudDBSyncId,
        referencedTable: $db.events,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventsTableAnnotationComposer(
              $db: $db,
              $table: $db.events,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function(
        {bool gradeScalesRefs,
        bool gradedComponentsRefs,
        bool timeslotsRefs,
        bool coursesRefs,
        bool assessmentsRefs,
        bool eventsRefs})> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> cloudDBSyncId = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> email = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            cloudDBSyncId: cloudDBSyncId,
            username: username,
            email: email,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String cloudDBSyncId,
            required String username,
            required String email,
          }) =>
              UsersCompanion.insert(
            id: id,
            cloudDBSyncId: cloudDBSyncId,
            username: username,
            email: email,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {gradeScalesRefs = false,
              gradedComponentsRefs = false,
              timeslotsRefs = false,
              coursesRefs = false,
              assessmentsRefs = false,
              eventsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (gradeScalesRefs) db.gradeScales,
                if (gradedComponentsRefs) db.gradedComponents,
                if (timeslotsRefs) db.timeslots,
                if (coursesRefs) db.courses,
                if (assessmentsRefs) db.assessments,
                if (eventsRefs) db.events
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (gradeScalesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._gradeScalesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .gradeScalesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userId == item.cloudDBSyncId),
                        typedResults: items),
                  if (gradedComponentsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$UsersTableReferences
                            ._gradedComponentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .gradedComponentsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userId == item.cloudDBSyncId),
                        typedResults: items),
                  if (timeslotsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._timeslotsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).timeslotsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userId == item.cloudDBSyncId),
                        typedResults: items),
                  if (coursesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._coursesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).coursesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userId == item.cloudDBSyncId),
                        typedResults: items),
                  if (assessmentsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._assessmentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .assessmentsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userId == item.cloudDBSyncId),
                        typedResults: items),
                  if (eventsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._eventsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).eventsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userId == item.cloudDBSyncId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function(
        {bool gradeScalesRefs,
        bool gradedComponentsRefs,
        bool timeslotsRefs,
        bool coursesRefs,
        bool assessmentsRefs,
        bool eventsRefs})>;
typedef $$GradeScalesTableCreateCompanionBuilder = GradeScalesCompanion
    Function({
  Value<int> id,
  required String userId,
  required String thresholdsJson,
});
typedef $$GradeScalesTableUpdateCompanionBuilder = GradeScalesCompanion
    Function({
  Value<int> id,
  Value<String> userId,
  Value<String> thresholdsJson,
});

final class $$GradeScalesTableReferences
    extends BaseReferences<_$AppDatabase, $GradeScalesTable, GradeScale> {
  $$GradeScalesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.gradeScales.userId, db.users.cloudDBSyncId));

  $$UsersTableProcessedTableManager get userId {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.cloudDBSyncId($_item.userId));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CoursesTable, List<Course>> _coursesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.courses,
          aliasName:
              $_aliasNameGenerator(db.gradeScales.id, db.courses.gradeScaleId));

  $$CoursesTableProcessedTableManager get coursesRefs {
    final manager = $$CoursesTableTableManager($_db, $_db.courses)
        .filter((f) => f.gradeScaleId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_coursesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GradeScalesTableFilterComposer
    extends Composer<_$AppDatabase, $GradeScalesTable> {
  $$GradeScalesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get thresholdsJson => $composableBuilder(
      column: $table.thresholdsJson,
      builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> coursesRefs(
      Expression<bool> Function($$CoursesTableFilterComposer f) f) {
    final $$CoursesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.gradeScaleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableFilterComposer(
              $db: $db,
              $table: $db.courses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GradeScalesTableOrderingComposer
    extends Composer<_$AppDatabase, $GradeScalesTable> {
  $$GradeScalesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get thresholdsJson => $composableBuilder(
      column: $table.thresholdsJson,
      builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GradeScalesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GradeScalesTable> {
  $$GradeScalesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get thresholdsJson => $composableBuilder(
      column: $table.thresholdsJson, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> coursesRefs<T extends Object>(
      Expression<T> Function($$CoursesTableAnnotationComposer a) f) {
    final $$CoursesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.gradeScaleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableAnnotationComposer(
              $db: $db,
              $table: $db.courses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GradeScalesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GradeScalesTable,
    GradeScale,
    $$GradeScalesTableFilterComposer,
    $$GradeScalesTableOrderingComposer,
    $$GradeScalesTableAnnotationComposer,
    $$GradeScalesTableCreateCompanionBuilder,
    $$GradeScalesTableUpdateCompanionBuilder,
    (GradeScale, $$GradeScalesTableReferences),
    GradeScale,
    PrefetchHooks Function({bool userId, bool coursesRefs})> {
  $$GradeScalesTableTableManager(_$AppDatabase db, $GradeScalesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GradeScalesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GradeScalesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GradeScalesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> thresholdsJson = const Value.absent(),
          }) =>
              GradeScalesCompanion(
            id: id,
            userId: userId,
            thresholdsJson: thresholdsJson,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userId,
            required String thresholdsJson,
          }) =>
              GradeScalesCompanion.insert(
            id: id,
            userId: userId,
            thresholdsJson: thresholdsJson,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GradeScalesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({userId = false, coursesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (coursesRefs) db.courses],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$GradeScalesTableReferences._userIdTable(db),
                    referencedColumn: $$GradeScalesTableReferences
                        ._userIdTable(db)
                        .cloudDBSyncId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (coursesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$GradeScalesTableReferences._coursesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GradeScalesTableReferences(db, table, p0)
                                .coursesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.gradeScaleId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GradeScalesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GradeScalesTable,
    GradeScale,
    $$GradeScalesTableFilterComposer,
    $$GradeScalesTableOrderingComposer,
    $$GradeScalesTableAnnotationComposer,
    $$GradeScalesTableCreateCompanionBuilder,
    $$GradeScalesTableUpdateCompanionBuilder,
    (GradeScale, $$GradeScalesTableReferences),
    GradeScale,
    PrefetchHooks Function({bool userId, bool coursesRefs})>;
typedef $$GradedComponentsTableCreateCompanionBuilder
    = GradedComponentsCompanion Function({
  Value<int> id,
  required String userId,
  required double weightDecimal,
  required double gradePercentage,
  required String gradeLetter,
});
typedef $$GradedComponentsTableUpdateCompanionBuilder
    = GradedComponentsCompanion Function({
  Value<int> id,
  Value<String> userId,
  Value<double> weightDecimal,
  Value<double> gradePercentage,
  Value<String> gradeLetter,
});

final class $$GradedComponentsTableReferences extends BaseReferences<
    _$AppDatabase, $GradedComponentsTable, GradedComponent> {
  $$GradedComponentsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.gradedComponents.userId, db.users.cloudDBSyncId));

  $$UsersTableProcessedTableManager get userId {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.cloudDBSyncId($_item.userId));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CoursesTable, List<Course>> _coursesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.courses,
          aliasName: $_aliasNameGenerator(
              db.gradedComponents.id, db.courses.gradedComponentId));

  $$CoursesTableProcessedTableManager get coursesRefs {
    final manager = $$CoursesTableTableManager($_db, $_db.courses)
        .filter((f) => f.gradedComponentId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_coursesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AssessmentsTable, List<Assessment>>
      _assessmentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.assessments,
              aliasName: $_aliasNameGenerator(
                  db.gradedComponents.id, db.assessments.gradedComponentId));

  $$AssessmentsTableProcessedTableManager get assessmentsRefs {
    final manager = $$AssessmentsTableTableManager($_db, $_db.assessments)
        .filter((f) => f.gradedComponentId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_assessmentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GradedComponentsTableFilterComposer
    extends Composer<_$AppDatabase, $GradedComponentsTable> {
  $$GradedComponentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weightDecimal => $composableBuilder(
      column: $table.weightDecimal, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get gradePercentage => $composableBuilder(
      column: $table.gradePercentage,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gradeLetter => $composableBuilder(
      column: $table.gradeLetter, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> coursesRefs(
      Expression<bool> Function($$CoursesTableFilterComposer f) f) {
    final $$CoursesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.gradedComponentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableFilterComposer(
              $db: $db,
              $table: $db.courses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> assessmentsRefs(
      Expression<bool> Function($$AssessmentsTableFilterComposer f) f) {
    final $$AssessmentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assessments,
        getReferencedColumn: (t) => t.gradedComponentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssessmentsTableFilterComposer(
              $db: $db,
              $table: $db.assessments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GradedComponentsTableOrderingComposer
    extends Composer<_$AppDatabase, $GradedComponentsTable> {
  $$GradedComponentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weightDecimal => $composableBuilder(
      column: $table.weightDecimal,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get gradePercentage => $composableBuilder(
      column: $table.gradePercentage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gradeLetter => $composableBuilder(
      column: $table.gradeLetter, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GradedComponentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GradedComponentsTable> {
  $$GradedComponentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get weightDecimal => $composableBuilder(
      column: $table.weightDecimal, builder: (column) => column);

  GeneratedColumn<double> get gradePercentage => $composableBuilder(
      column: $table.gradePercentage, builder: (column) => column);

  GeneratedColumn<String> get gradeLetter => $composableBuilder(
      column: $table.gradeLetter, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> coursesRefs<T extends Object>(
      Expression<T> Function($$CoursesTableAnnotationComposer a) f) {
    final $$CoursesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.gradedComponentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableAnnotationComposer(
              $db: $db,
              $table: $db.courses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> assessmentsRefs<T extends Object>(
      Expression<T> Function($$AssessmentsTableAnnotationComposer a) f) {
    final $$AssessmentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assessments,
        getReferencedColumn: (t) => t.gradedComponentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssessmentsTableAnnotationComposer(
              $db: $db,
              $table: $db.assessments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GradedComponentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GradedComponentsTable,
    GradedComponent,
    $$GradedComponentsTableFilterComposer,
    $$GradedComponentsTableOrderingComposer,
    $$GradedComponentsTableAnnotationComposer,
    $$GradedComponentsTableCreateCompanionBuilder,
    $$GradedComponentsTableUpdateCompanionBuilder,
    (GradedComponent, $$GradedComponentsTableReferences),
    GradedComponent,
    PrefetchHooks Function(
        {bool userId, bool coursesRefs, bool assessmentsRefs})> {
  $$GradedComponentsTableTableManager(
      _$AppDatabase db, $GradedComponentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GradedComponentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GradedComponentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GradedComponentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<double> weightDecimal = const Value.absent(),
            Value<double> gradePercentage = const Value.absent(),
            Value<String> gradeLetter = const Value.absent(),
          }) =>
              GradedComponentsCompanion(
            id: id,
            userId: userId,
            weightDecimal: weightDecimal,
            gradePercentage: gradePercentage,
            gradeLetter: gradeLetter,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userId,
            required double weightDecimal,
            required double gradePercentage,
            required String gradeLetter,
          }) =>
              GradedComponentsCompanion.insert(
            id: id,
            userId: userId,
            weightDecimal: weightDecimal,
            gradePercentage: gradePercentage,
            gradeLetter: gradeLetter,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GradedComponentsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {userId = false, coursesRefs = false, assessmentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (coursesRefs) db.courses,
                if (assessmentsRefs) db.assessments
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$GradedComponentsTableReferences._userIdTable(db),
                    referencedColumn: $$GradedComponentsTableReferences
                        ._userIdTable(db)
                        .cloudDBSyncId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (coursesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$GradedComponentsTableReferences
                            ._coursesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GradedComponentsTableReferences(db, table, p0)
                                .coursesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.gradedComponentId == item.id),
                        typedResults: items),
                  if (assessmentsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$GradedComponentsTableReferences
                            ._assessmentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GradedComponentsTableReferences(db, table, p0)
                                .assessmentsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.gradedComponentId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GradedComponentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GradedComponentsTable,
    GradedComponent,
    $$GradedComponentsTableFilterComposer,
    $$GradedComponentsTableOrderingComposer,
    $$GradedComponentsTableAnnotationComposer,
    $$GradedComponentsTableCreateCompanionBuilder,
    $$GradedComponentsTableUpdateCompanionBuilder,
    (GradedComponent, $$GradedComponentsTableReferences),
    GradedComponent,
    PrefetchHooks Function(
        {bool userId, bool coursesRefs, bool assessmentsRefs})>;
typedef $$TimeslotsTableCreateCompanionBuilder = TimeslotsCompanion Function({
  Value<int> id,
  required String userId,
  required DaysOfTheWeek endingDay,
  Value<DateTime?> startDate,
  required DateTime endDate,
});
typedef $$TimeslotsTableUpdateCompanionBuilder = TimeslotsCompanion Function({
  Value<int> id,
  Value<String> userId,
  Value<DaysOfTheWeek> endingDay,
  Value<DateTime?> startDate,
  Value<DateTime> endDate,
});

final class $$TimeslotsTableReferences
    extends BaseReferences<_$AppDatabase, $TimeslotsTable, Timeslot> {
  $$TimeslotsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.timeslots.userId, db.users.cloudDBSyncId));

  $$UsersTableProcessedTableManager get userId {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.cloudDBSyncId($_item.userId));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CoursesTable, List<Course>> _coursesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.courses,
          aliasName:
              $_aliasNameGenerator(db.timeslots.id, db.courses.timeslotId));

  $$CoursesTableProcessedTableManager get coursesRefs {
    final manager = $$CoursesTableTableManager($_db, $_db.courses)
        .filter((f) => f.timeslotId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_coursesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AssessmentsTable, List<Assessment>>
      _assessmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.assessments,
          aliasName:
              $_aliasNameGenerator(db.timeslots.id, db.assessments.timeslotId));

  $$AssessmentsTableProcessedTableManager get assessmentsRefs {
    final manager = $$AssessmentsTableTableManager($_db, $_db.assessments)
        .filter((f) => f.timeslotId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_assessmentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$EventsTable, List<Event>> _eventsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.events,
          aliasName:
              $_aliasNameGenerator(db.timeslots.id, db.events.timeslotId));

  $$EventsTableProcessedTableManager get eventsRefs {
    final manager = $$EventsTableTableManager($_db, $_db.events)
        .filter((f) => f.timeslotId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_eventsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TimeslotsTableFilterComposer
    extends Composer<_$AppDatabase, $TimeslotsTable> {
  $$TimeslotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<DaysOfTheWeek, DaysOfTheWeek, int>
      get endingDay => $composableBuilder(
          column: $table.endingDay,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> coursesRefs(
      Expression<bool> Function($$CoursesTableFilterComposer f) f) {
    final $$CoursesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.timeslotId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableFilterComposer(
              $db: $db,
              $table: $db.courses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> assessmentsRefs(
      Expression<bool> Function($$AssessmentsTableFilterComposer f) f) {
    final $$AssessmentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assessments,
        getReferencedColumn: (t) => t.timeslotId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssessmentsTableFilterComposer(
              $db: $db,
              $table: $db.assessments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> eventsRefs(
      Expression<bool> Function($$EventsTableFilterComposer f) f) {
    final $$EventsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.events,
        getReferencedColumn: (t) => t.timeslotId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventsTableFilterComposer(
              $db: $db,
              $table: $db.events,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TimeslotsTableOrderingComposer
    extends Composer<_$AppDatabase, $TimeslotsTable> {
  $$TimeslotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endingDay => $composableBuilder(
      column: $table.endingDay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TimeslotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimeslotsTable> {
  $$TimeslotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DaysOfTheWeek, int> get endingDay =>
      $composableBuilder(column: $table.endingDay, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> coursesRefs<T extends Object>(
      Expression<T> Function($$CoursesTableAnnotationComposer a) f) {
    final $$CoursesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.timeslotId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableAnnotationComposer(
              $db: $db,
              $table: $db.courses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> assessmentsRefs<T extends Object>(
      Expression<T> Function($$AssessmentsTableAnnotationComposer a) f) {
    final $$AssessmentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assessments,
        getReferencedColumn: (t) => t.timeslotId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssessmentsTableAnnotationComposer(
              $db: $db,
              $table: $db.assessments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> eventsRefs<T extends Object>(
      Expression<T> Function($$EventsTableAnnotationComposer a) f) {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.events,
        getReferencedColumn: (t) => t.timeslotId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventsTableAnnotationComposer(
              $db: $db,
              $table: $db.events,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TimeslotsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TimeslotsTable,
    Timeslot,
    $$TimeslotsTableFilterComposer,
    $$TimeslotsTableOrderingComposer,
    $$TimeslotsTableAnnotationComposer,
    $$TimeslotsTableCreateCompanionBuilder,
    $$TimeslotsTableUpdateCompanionBuilder,
    (Timeslot, $$TimeslotsTableReferences),
    Timeslot,
    PrefetchHooks Function(
        {bool userId,
        bool coursesRefs,
        bool assessmentsRefs,
        bool eventsRefs})> {
  $$TimeslotsTableTableManager(_$AppDatabase db, $TimeslotsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimeslotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimeslotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimeslotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<DaysOfTheWeek> endingDay = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
          }) =>
              TimeslotsCompanion(
            id: id,
            userId: userId,
            endingDay: endingDay,
            startDate: startDate,
            endDate: endDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userId,
            required DaysOfTheWeek endingDay,
            Value<DateTime?> startDate = const Value.absent(),
            required DateTime endDate,
          }) =>
              TimeslotsCompanion.insert(
            id: id,
            userId: userId,
            endingDay: endingDay,
            startDate: startDate,
            endDate: endDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TimeslotsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {userId = false,
              coursesRefs = false,
              assessmentsRefs = false,
              eventsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (coursesRefs) db.courses,
                if (assessmentsRefs) db.assessments,
                if (eventsRefs) db.events
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$TimeslotsTableReferences._userIdTable(db),
                    referencedColumn: $$TimeslotsTableReferences
                        ._userIdTable(db)
                        .cloudDBSyncId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (coursesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TimeslotsTableReferences._coursesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TimeslotsTableReferences(db, table, p0)
                                .coursesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.timeslotId == item.id),
                        typedResults: items),
                  if (assessmentsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$TimeslotsTableReferences
                            ._assessmentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TimeslotsTableReferences(db, table, p0)
                                .assessmentsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.timeslotId == item.id),
                        typedResults: items),
                  if (eventsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TimeslotsTableReferences._eventsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TimeslotsTableReferences(db, table, p0)
                                .eventsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.timeslotId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TimeslotsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TimeslotsTable,
    Timeslot,
    $$TimeslotsTableFilterComposer,
    $$TimeslotsTableOrderingComposer,
    $$TimeslotsTableAnnotationComposer,
    $$TimeslotsTableCreateCompanionBuilder,
    $$TimeslotsTableUpdateCompanionBuilder,
    (Timeslot, $$TimeslotsTableReferences),
    Timeslot,
    PrefetchHooks Function(
        {bool userId,
        bool coursesRefs,
        bool assessmentsRefs,
        bool eventsRefs})>;
typedef $$CoursesTableCreateCompanionBuilder = CoursesCompanion Function({
  Value<int> id,
  required String userId,
  required int gradeScaleId,
  required int gradedComponentId,
  required int timeslotId,
  required String courseName,
  required String courseCode,
  required int scheduleBitMask,
});
typedef $$CoursesTableUpdateCompanionBuilder = CoursesCompanion Function({
  Value<int> id,
  Value<String> userId,
  Value<int> gradeScaleId,
  Value<int> gradedComponentId,
  Value<int> timeslotId,
  Value<String> courseName,
  Value<String> courseCode,
  Value<int> scheduleBitMask,
});

final class $$CoursesTableReferences
    extends BaseReferences<_$AppDatabase, $CoursesTable, Course> {
  $$CoursesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.courses.userId, db.users.cloudDBSyncId));

  $$UsersTableProcessedTableManager get userId {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.cloudDBSyncId($_item.userId));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GradeScalesTable _gradeScaleIdTable(_$AppDatabase db) =>
      db.gradeScales.createAlias(
          $_aliasNameGenerator(db.courses.gradeScaleId, db.gradeScales.id));

  $$GradeScalesTableProcessedTableManager get gradeScaleId {
    final manager = $$GradeScalesTableTableManager($_db, $_db.gradeScales)
        .filter((f) => f.id($_item.gradeScaleId));
    final item = $_typedResult.readTableOrNull(_gradeScaleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GradedComponentsTable _gradedComponentIdTable(_$AppDatabase db) =>
      db.gradedComponents.createAlias($_aliasNameGenerator(
          db.courses.gradedComponentId, db.gradedComponents.id));

  $$GradedComponentsTableProcessedTableManager get gradedComponentId {
    final manager =
        $$GradedComponentsTableTableManager($_db, $_db.gradedComponents)
            .filter((f) => f.id($_item.gradedComponentId));
    final item = $_typedResult.readTableOrNull(_gradedComponentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TimeslotsTable _timeslotIdTable(_$AppDatabase db) =>
      db.timeslots.createAlias(
          $_aliasNameGenerator(db.courses.timeslotId, db.timeslots.id));

  $$TimeslotsTableProcessedTableManager get timeslotId {
    final manager = $$TimeslotsTableTableManager($_db, $_db.timeslots)
        .filter((f) => f.id($_item.timeslotId));
    final item = $_typedResult.readTableOrNull(_timeslotIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$AssessmentsTable, List<Assessment>>
      _assessmentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.assessments,
              aliasName:
                  $_aliasNameGenerator(db.courses.id, db.assessments.courseId));

  $$AssessmentsTableProcessedTableManager get assessmentsRefs {
    final manager = $$AssessmentsTableTableManager($_db, $_db.assessments)
        .filter((f) => f.courseId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_assessmentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CoursesTableFilterComposer
    extends Composer<_$AppDatabase, $CoursesTable> {
  $$CoursesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get courseName => $composableBuilder(
      column: $table.courseName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get courseCode => $composableBuilder(
      column: $table.courseCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get scheduleBitMask => $composableBuilder(
      column: $table.scheduleBitMask,
      builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradeScalesTableFilterComposer get gradeScaleId {
    final $$GradeScalesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradeScaleId,
        referencedTable: $db.gradeScales,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradeScalesTableFilterComposer(
              $db: $db,
              $table: $db.gradeScales,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradedComponentsTableFilterComposer get gradedComponentId {
    final $$GradedComponentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradedComponentId,
        referencedTable: $db.gradedComponents,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradedComponentsTableFilterComposer(
              $db: $db,
              $table: $db.gradedComponents,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimeslotsTableFilterComposer get timeslotId {
    final $$TimeslotsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timeslotId,
        referencedTable: $db.timeslots,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimeslotsTableFilterComposer(
              $db: $db,
              $table: $db.timeslots,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> assessmentsRefs(
      Expression<bool> Function($$AssessmentsTableFilterComposer f) f) {
    final $$AssessmentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assessments,
        getReferencedColumn: (t) => t.courseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssessmentsTableFilterComposer(
              $db: $db,
              $table: $db.assessments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CoursesTableOrderingComposer
    extends Composer<_$AppDatabase, $CoursesTable> {
  $$CoursesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseName => $composableBuilder(
      column: $table.courseName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get courseCode => $composableBuilder(
      column: $table.courseCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get scheduleBitMask => $composableBuilder(
      column: $table.scheduleBitMask,
      builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradeScalesTableOrderingComposer get gradeScaleId {
    final $$GradeScalesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradeScaleId,
        referencedTable: $db.gradeScales,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradeScalesTableOrderingComposer(
              $db: $db,
              $table: $db.gradeScales,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradedComponentsTableOrderingComposer get gradedComponentId {
    final $$GradedComponentsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradedComponentId,
        referencedTable: $db.gradedComponents,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradedComponentsTableOrderingComposer(
              $db: $db,
              $table: $db.gradedComponents,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimeslotsTableOrderingComposer get timeslotId {
    final $$TimeslotsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timeslotId,
        referencedTable: $db.timeslots,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimeslotsTableOrderingComposer(
              $db: $db,
              $table: $db.timeslots,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CoursesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CoursesTable> {
  $$CoursesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get courseName => $composableBuilder(
      column: $table.courseName, builder: (column) => column);

  GeneratedColumn<String> get courseCode => $composableBuilder(
      column: $table.courseCode, builder: (column) => column);

  GeneratedColumn<int> get scheduleBitMask => $composableBuilder(
      column: $table.scheduleBitMask, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradeScalesTableAnnotationComposer get gradeScaleId {
    final $$GradeScalesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradeScaleId,
        referencedTable: $db.gradeScales,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradeScalesTableAnnotationComposer(
              $db: $db,
              $table: $db.gradeScales,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradedComponentsTableAnnotationComposer get gradedComponentId {
    final $$GradedComponentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradedComponentId,
        referencedTable: $db.gradedComponents,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradedComponentsTableAnnotationComposer(
              $db: $db,
              $table: $db.gradedComponents,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimeslotsTableAnnotationComposer get timeslotId {
    final $$TimeslotsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timeslotId,
        referencedTable: $db.timeslots,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimeslotsTableAnnotationComposer(
              $db: $db,
              $table: $db.timeslots,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> assessmentsRefs<T extends Object>(
      Expression<T> Function($$AssessmentsTableAnnotationComposer a) f) {
    final $$AssessmentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assessments,
        getReferencedColumn: (t) => t.courseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssessmentsTableAnnotationComposer(
              $db: $db,
              $table: $db.assessments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CoursesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CoursesTable,
    Course,
    $$CoursesTableFilterComposer,
    $$CoursesTableOrderingComposer,
    $$CoursesTableAnnotationComposer,
    $$CoursesTableCreateCompanionBuilder,
    $$CoursesTableUpdateCompanionBuilder,
    (Course, $$CoursesTableReferences),
    Course,
    PrefetchHooks Function(
        {bool userId,
        bool gradeScaleId,
        bool gradedComponentId,
        bool timeslotId,
        bool assessmentsRefs})> {
  $$CoursesTableTableManager(_$AppDatabase db, $CoursesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CoursesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CoursesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CoursesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<int> gradeScaleId = const Value.absent(),
            Value<int> gradedComponentId = const Value.absent(),
            Value<int> timeslotId = const Value.absent(),
            Value<String> courseName = const Value.absent(),
            Value<String> courseCode = const Value.absent(),
            Value<int> scheduleBitMask = const Value.absent(),
          }) =>
              CoursesCompanion(
            id: id,
            userId: userId,
            gradeScaleId: gradeScaleId,
            gradedComponentId: gradedComponentId,
            timeslotId: timeslotId,
            courseName: courseName,
            courseCode: courseCode,
            scheduleBitMask: scheduleBitMask,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userId,
            required int gradeScaleId,
            required int gradedComponentId,
            required int timeslotId,
            required String courseName,
            required String courseCode,
            required int scheduleBitMask,
          }) =>
              CoursesCompanion.insert(
            id: id,
            userId: userId,
            gradeScaleId: gradeScaleId,
            gradedComponentId: gradedComponentId,
            timeslotId: timeslotId,
            courseName: courseName,
            courseCode: courseCode,
            scheduleBitMask: scheduleBitMask,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$CoursesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {userId = false,
              gradeScaleId = false,
              gradedComponentId = false,
              timeslotId = false,
              assessmentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (assessmentsRefs) db.assessments],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable: $$CoursesTableReferences._userIdTable(db),
                    referencedColumn:
                        $$CoursesTableReferences._userIdTable(db).cloudDBSyncId,
                  ) as T;
                }
                if (gradeScaleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.gradeScaleId,
                    referencedTable:
                        $$CoursesTableReferences._gradeScaleIdTable(db),
                    referencedColumn:
                        $$CoursesTableReferences._gradeScaleIdTable(db).id,
                  ) as T;
                }
                if (gradedComponentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.gradedComponentId,
                    referencedTable:
                        $$CoursesTableReferences._gradedComponentIdTable(db),
                    referencedColumn:
                        $$CoursesTableReferences._gradedComponentIdTable(db).id,
                  ) as T;
                }
                if (timeslotId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.timeslotId,
                    referencedTable:
                        $$CoursesTableReferences._timeslotIdTable(db),
                    referencedColumn:
                        $$CoursesTableReferences._timeslotIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (assessmentsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$CoursesTableReferences._assessmentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CoursesTableReferences(db, table, p0)
                                .assessmentsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.courseId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CoursesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CoursesTable,
    Course,
    $$CoursesTableFilterComposer,
    $$CoursesTableOrderingComposer,
    $$CoursesTableAnnotationComposer,
    $$CoursesTableCreateCompanionBuilder,
    $$CoursesTableUpdateCompanionBuilder,
    (Course, $$CoursesTableReferences),
    Course,
    PrefetchHooks Function(
        {bool userId,
        bool gradeScaleId,
        bool gradedComponentId,
        bool timeslotId,
        bool assessmentsRefs})>;
typedef $$AssessmentsTableCreateCompanionBuilder = AssessmentsCompanion
    Function({
  Value<int> id,
  required String userId,
  required int courseId,
  required int gradedComponentId,
  required int timeslotId,
  required String assessmentName,
  required AssessmentType type,
  required bool isComplete,
});
typedef $$AssessmentsTableUpdateCompanionBuilder = AssessmentsCompanion
    Function({
  Value<int> id,
  Value<String> userId,
  Value<int> courseId,
  Value<int> gradedComponentId,
  Value<int> timeslotId,
  Value<String> assessmentName,
  Value<AssessmentType> type,
  Value<bool> isComplete,
});

final class $$AssessmentsTableReferences
    extends BaseReferences<_$AppDatabase, $AssessmentsTable, Assessment> {
  $$AssessmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.assessments.userId, db.users.cloudDBSyncId));

  $$UsersTableProcessedTableManager get userId {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.cloudDBSyncId($_item.userId));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CoursesTable _courseIdTable(_$AppDatabase db) =>
      db.courses.createAlias(
          $_aliasNameGenerator(db.assessments.courseId, db.courses.id));

  $$CoursesTableProcessedTableManager get courseId {
    final manager = $$CoursesTableTableManager($_db, $_db.courses)
        .filter((f) => f.id($_item.courseId));
    final item = $_typedResult.readTableOrNull(_courseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GradedComponentsTable _gradedComponentIdTable(_$AppDatabase db) =>
      db.gradedComponents.createAlias($_aliasNameGenerator(
          db.assessments.gradedComponentId, db.gradedComponents.id));

  $$GradedComponentsTableProcessedTableManager get gradedComponentId {
    final manager =
        $$GradedComponentsTableTableManager($_db, $_db.gradedComponents)
            .filter((f) => f.id($_item.gradedComponentId));
    final item = $_typedResult.readTableOrNull(_gradedComponentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TimeslotsTable _timeslotIdTable(_$AppDatabase db) =>
      db.timeslots.createAlias(
          $_aliasNameGenerator(db.assessments.timeslotId, db.timeslots.id));

  $$TimeslotsTableProcessedTableManager get timeslotId {
    final manager = $$TimeslotsTableTableManager($_db, $_db.timeslots)
        .filter((f) => f.id($_item.timeslotId));
    final item = $_typedResult.readTableOrNull(_timeslotIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AssessmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AssessmentsTable> {
  $$AssessmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assessmentName => $composableBuilder(
      column: $table.assessmentName,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<AssessmentType, AssessmentType, int>
      get type => $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get isComplete => $composableBuilder(
      column: $table.isComplete, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CoursesTableFilterComposer get courseId {
    final $$CoursesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.courseId,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableFilterComposer(
              $db: $db,
              $table: $db.courses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradedComponentsTableFilterComposer get gradedComponentId {
    final $$GradedComponentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradedComponentId,
        referencedTable: $db.gradedComponents,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradedComponentsTableFilterComposer(
              $db: $db,
              $table: $db.gradedComponents,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimeslotsTableFilterComposer get timeslotId {
    final $$TimeslotsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timeslotId,
        referencedTable: $db.timeslots,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimeslotsTableFilterComposer(
              $db: $db,
              $table: $db.timeslots,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AssessmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AssessmentsTable> {
  $$AssessmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assessmentName => $composableBuilder(
      column: $table.assessmentName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isComplete => $composableBuilder(
      column: $table.isComplete, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CoursesTableOrderingComposer get courseId {
    final $$CoursesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.courseId,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableOrderingComposer(
              $db: $db,
              $table: $db.courses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradedComponentsTableOrderingComposer get gradedComponentId {
    final $$GradedComponentsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradedComponentId,
        referencedTable: $db.gradedComponents,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradedComponentsTableOrderingComposer(
              $db: $db,
              $table: $db.gradedComponents,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimeslotsTableOrderingComposer get timeslotId {
    final $$TimeslotsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timeslotId,
        referencedTable: $db.timeslots,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimeslotsTableOrderingComposer(
              $db: $db,
              $table: $db.timeslots,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AssessmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssessmentsTable> {
  $$AssessmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assessmentName => $composableBuilder(
      column: $table.assessmentName, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AssessmentType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isComplete => $composableBuilder(
      column: $table.isComplete, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CoursesTableAnnotationComposer get courseId {
    final $$CoursesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.courseId,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableAnnotationComposer(
              $db: $db,
              $table: $db.courses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradedComponentsTableAnnotationComposer get gradedComponentId {
    final $$GradedComponentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradedComponentId,
        referencedTable: $db.gradedComponents,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradedComponentsTableAnnotationComposer(
              $db: $db,
              $table: $db.gradedComponents,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimeslotsTableAnnotationComposer get timeslotId {
    final $$TimeslotsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timeslotId,
        referencedTable: $db.timeslots,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimeslotsTableAnnotationComposer(
              $db: $db,
              $table: $db.timeslots,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AssessmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AssessmentsTable,
    Assessment,
    $$AssessmentsTableFilterComposer,
    $$AssessmentsTableOrderingComposer,
    $$AssessmentsTableAnnotationComposer,
    $$AssessmentsTableCreateCompanionBuilder,
    $$AssessmentsTableUpdateCompanionBuilder,
    (Assessment, $$AssessmentsTableReferences),
    Assessment,
    PrefetchHooks Function(
        {bool userId,
        bool courseId,
        bool gradedComponentId,
        bool timeslotId})> {
  $$AssessmentsTableTableManager(_$AppDatabase db, $AssessmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssessmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssessmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssessmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<int> courseId = const Value.absent(),
            Value<int> gradedComponentId = const Value.absent(),
            Value<int> timeslotId = const Value.absent(),
            Value<String> assessmentName = const Value.absent(),
            Value<AssessmentType> type = const Value.absent(),
            Value<bool> isComplete = const Value.absent(),
          }) =>
              AssessmentsCompanion(
            id: id,
            userId: userId,
            courseId: courseId,
            gradedComponentId: gradedComponentId,
            timeslotId: timeslotId,
            assessmentName: assessmentName,
            type: type,
            isComplete: isComplete,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userId,
            required int courseId,
            required int gradedComponentId,
            required int timeslotId,
            required String assessmentName,
            required AssessmentType type,
            required bool isComplete,
          }) =>
              AssessmentsCompanion.insert(
            id: id,
            userId: userId,
            courseId: courseId,
            gradedComponentId: gradedComponentId,
            timeslotId: timeslotId,
            assessmentName: assessmentName,
            type: type,
            isComplete: isComplete,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AssessmentsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {userId = false,
              courseId = false,
              gradedComponentId = false,
              timeslotId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$AssessmentsTableReferences._userIdTable(db),
                    referencedColumn: $$AssessmentsTableReferences
                        ._userIdTable(db)
                        .cloudDBSyncId,
                  ) as T;
                }
                if (courseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.courseId,
                    referencedTable:
                        $$AssessmentsTableReferences._courseIdTable(db),
                    referencedColumn:
                        $$AssessmentsTableReferences._courseIdTable(db).id,
                  ) as T;
                }
                if (gradedComponentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.gradedComponentId,
                    referencedTable: $$AssessmentsTableReferences
                        ._gradedComponentIdTable(db),
                    referencedColumn: $$AssessmentsTableReferences
                        ._gradedComponentIdTable(db)
                        .id,
                  ) as T;
                }
                if (timeslotId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.timeslotId,
                    referencedTable:
                        $$AssessmentsTableReferences._timeslotIdTable(db),
                    referencedColumn:
                        $$AssessmentsTableReferences._timeslotIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AssessmentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AssessmentsTable,
    Assessment,
    $$AssessmentsTableFilterComposer,
    $$AssessmentsTableOrderingComposer,
    $$AssessmentsTableAnnotationComposer,
    $$AssessmentsTableCreateCompanionBuilder,
    $$AssessmentsTableUpdateCompanionBuilder,
    (Assessment, $$AssessmentsTableReferences),
    Assessment,
    PrefetchHooks Function(
        {bool userId, bool courseId, bool gradedComponentId, bool timeslotId})>;
typedef $$EventsTableCreateCompanionBuilder = EventsCompanion Function({
  Value<int> id,
  required String userId,
  required int timeslotId,
  required String eventName,
});
typedef $$EventsTableUpdateCompanionBuilder = EventsCompanion Function({
  Value<int> id,
  Value<String> userId,
  Value<int> timeslotId,
  Value<String> eventName,
});

final class $$EventsTableReferences
    extends BaseReferences<_$AppDatabase, $EventsTable, Event> {
  $$EventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.events.userId, db.users.cloudDBSyncId));

  $$UsersTableProcessedTableManager get userId {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.cloudDBSyncId($_item.userId));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TimeslotsTable _timeslotIdTable(_$AppDatabase db) => db.timeslots
      .createAlias($_aliasNameGenerator(db.events.timeslotId, db.timeslots.id));

  $$TimeslotsTableProcessedTableManager get timeslotId {
    final manager = $$TimeslotsTableTableManager($_db, $_db.timeslots)
        .filter((f) => f.id($_item.timeslotId));
    final item = $_typedResult.readTableOrNull(_timeslotIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$EventsTableFilterComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eventName => $composableBuilder(
      column: $table.eventName, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimeslotsTableFilterComposer get timeslotId {
    final $$TimeslotsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timeslotId,
        referencedTable: $db.timeslots,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimeslotsTableFilterComposer(
              $db: $db,
              $table: $db.timeslots,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EventsTableOrderingComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eventName => $composableBuilder(
      column: $table.eventName, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimeslotsTableOrderingComposer get timeslotId {
    final $$TimeslotsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timeslotId,
        referencedTable: $db.timeslots,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimeslotsTableOrderingComposer(
              $db: $db,
              $table: $db.timeslots,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get eventName =>
      $composableBuilder(column: $table.eventName, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.cloudDBSyncId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimeslotsTableAnnotationComposer get timeslotId {
    final $$TimeslotsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timeslotId,
        referencedTable: $db.timeslots,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimeslotsTableAnnotationComposer(
              $db: $db,
              $table: $db.timeslots,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EventsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EventsTable,
    Event,
    $$EventsTableFilterComposer,
    $$EventsTableOrderingComposer,
    $$EventsTableAnnotationComposer,
    $$EventsTableCreateCompanionBuilder,
    $$EventsTableUpdateCompanionBuilder,
    (Event, $$EventsTableReferences),
    Event,
    PrefetchHooks Function({bool userId, bool timeslotId})> {
  $$EventsTableTableManager(_$AppDatabase db, $EventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<int> timeslotId = const Value.absent(),
            Value<String> eventName = const Value.absent(),
          }) =>
              EventsCompanion(
            id: id,
            userId: userId,
            timeslotId: timeslotId,
            eventName: eventName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String userId,
            required int timeslotId,
            required String eventName,
          }) =>
              EventsCompanion.insert(
            id: id,
            userId: userId,
            timeslotId: timeslotId,
            eventName: eventName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$EventsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({userId = false, timeslotId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable: $$EventsTableReferences._userIdTable(db),
                    referencedColumn:
                        $$EventsTableReferences._userIdTable(db).cloudDBSyncId,
                  ) as T;
                }
                if (timeslotId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.timeslotId,
                    referencedTable:
                        $$EventsTableReferences._timeslotIdTable(db),
                    referencedColumn:
                        $$EventsTableReferences._timeslotIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$EventsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EventsTable,
    Event,
    $$EventsTableFilterComposer,
    $$EventsTableOrderingComposer,
    $$EventsTableAnnotationComposer,
    $$EventsTableCreateCompanionBuilder,
    $$EventsTableUpdateCompanionBuilder,
    (Event, $$EventsTableReferences),
    Event,
    PrefetchHooks Function({bool userId, bool timeslotId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$GradeScalesTableTableManager get gradeScales =>
      $$GradeScalesTableTableManager(_db, _db.gradeScales);
  $$GradedComponentsTableTableManager get gradedComponents =>
      $$GradedComponentsTableTableManager(_db, _db.gradedComponents);
  $$TimeslotsTableTableManager get timeslots =>
      $$TimeslotsTableTableManager(_db, _db.timeslots);
  $$CoursesTableTableManager get courses =>
      $$CoursesTableTableManager(_db, _db.courses);
  $$AssessmentsTableTableManager get assessments =>
      $$AssessmentsTableTableManager(_db, _db.assessments);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db, _db.events);
}
