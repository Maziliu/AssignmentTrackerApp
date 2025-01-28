// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id, username];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int id;
  final String username;
  const UserTableData({required this.id, required this.username});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      username: Value(username),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
    };
  }

  UserTableData copyWith({int? id, String? username}) => UserTableData(
        id: id ?? this.id,
        username: username ?? this.username,
      );
  UserTableData copyWithCompanion(UserTableCompanion data) {
    return UserTableData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('username: $username')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.username == this.username);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> id;
  final Value<String> username;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    required String username,
  }) : username = Value(username);
  static Insertable<UserTableData> custom({
    Expression<int>? id,
    Expression<String>? username,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
    });
  }

  UserTableCompanion copyWith({Value<int>? id, Value<String>? username}) {
    return UserTableCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('username: $username')
          ..write(')'))
        .toString();
  }
}

class $GradeScaleTableTable extends GradeScaleTable
    with TableInfo<$GradeScaleTableTable, GradeScaleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GradeScaleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _thresholdsJsonMeta =
      const VerificationMeta('thresholdsJson');
  @override
  late final GeneratedColumn<String> thresholdsJson = GeneratedColumn<String>(
      'thresholds_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, thresholdsJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grade_scale_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<GradeScaleTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
  GradeScaleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GradeScaleTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      thresholdsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}thresholds_json'])!,
    );
  }

  @override
  $GradeScaleTableTable createAlias(String alias) {
    return $GradeScaleTableTable(attachedDatabase, alias);
  }
}

class GradeScaleTableData extends DataClass
    implements Insertable<GradeScaleTableData> {
  final int id;
  final String thresholdsJson;
  const GradeScaleTableData({required this.id, required this.thresholdsJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['thresholds_json'] = Variable<String>(thresholdsJson);
    return map;
  }

  GradeScaleTableCompanion toCompanion(bool nullToAbsent) {
    return GradeScaleTableCompanion(
      id: Value(id),
      thresholdsJson: Value(thresholdsJson),
    );
  }

  factory GradeScaleTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GradeScaleTableData(
      id: serializer.fromJson<int>(json['id']),
      thresholdsJson: serializer.fromJson<String>(json['thresholdsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'thresholdsJson': serializer.toJson<String>(thresholdsJson),
    };
  }

  GradeScaleTableData copyWith({int? id, String? thresholdsJson}) =>
      GradeScaleTableData(
        id: id ?? this.id,
        thresholdsJson: thresholdsJson ?? this.thresholdsJson,
      );
  GradeScaleTableData copyWithCompanion(GradeScaleTableCompanion data) {
    return GradeScaleTableData(
      id: data.id.present ? data.id.value : this.id,
      thresholdsJson: data.thresholdsJson.present
          ? data.thresholdsJson.value
          : this.thresholdsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GradeScaleTableData(')
          ..write('id: $id, ')
          ..write('thresholdsJson: $thresholdsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, thresholdsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GradeScaleTableData &&
          other.id == this.id &&
          other.thresholdsJson == this.thresholdsJson);
}

class GradeScaleTableCompanion extends UpdateCompanion<GradeScaleTableData> {
  final Value<int> id;
  final Value<String> thresholdsJson;
  const GradeScaleTableCompanion({
    this.id = const Value.absent(),
    this.thresholdsJson = const Value.absent(),
  });
  GradeScaleTableCompanion.insert({
    this.id = const Value.absent(),
    required String thresholdsJson,
  }) : thresholdsJson = Value(thresholdsJson);
  static Insertable<GradeScaleTableData> custom({
    Expression<int>? id,
    Expression<String>? thresholdsJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (thresholdsJson != null) 'thresholds_json': thresholdsJson,
    });
  }

  GradeScaleTableCompanion copyWith(
      {Value<int>? id, Value<String>? thresholdsJson}) {
    return GradeScaleTableCompanion(
      id: id ?? this.id,
      thresholdsJson: thresholdsJson ?? this.thresholdsJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (thresholdsJson.present) {
      map['thresholds_json'] = Variable<String>(thresholdsJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GradeScaleTableCompanion(')
          ..write('id: $id, ')
          ..write('thresholdsJson: $thresholdsJson')
          ..write(')'))
        .toString();
  }
}

class $GradedComponentTableTable extends GradedComponentTable
    with TableInfo<$GradedComponentTableTable, GradedComponentTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GradedComponentTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
      [id, weightDecimal, gradePercentage, gradeLetter];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'graded_component_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<GradedComponentTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
  GradedComponentTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GradedComponentTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      weightDecimal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight_decimal'])!,
      gradePercentage: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}grade_percentage'])!,
      gradeLetter: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}grade_letter'])!,
    );
  }

  @override
  $GradedComponentTableTable createAlias(String alias) {
    return $GradedComponentTableTable(attachedDatabase, alias);
  }
}

class GradedComponentTableData extends DataClass
    implements Insertable<GradedComponentTableData> {
  final int id;
  final double weightDecimal;
  final double gradePercentage;
  final String gradeLetter;
  const GradedComponentTableData(
      {required this.id,
      required this.weightDecimal,
      required this.gradePercentage,
      required this.gradeLetter});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['weight_decimal'] = Variable<double>(weightDecimal);
    map['grade_percentage'] = Variable<double>(gradePercentage);
    map['grade_letter'] = Variable<String>(gradeLetter);
    return map;
  }

  GradedComponentTableCompanion toCompanion(bool nullToAbsent) {
    return GradedComponentTableCompanion(
      id: Value(id),
      weightDecimal: Value(weightDecimal),
      gradePercentage: Value(gradePercentage),
      gradeLetter: Value(gradeLetter),
    );
  }

  factory GradedComponentTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GradedComponentTableData(
      id: serializer.fromJson<int>(json['id']),
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
      'weightDecimal': serializer.toJson<double>(weightDecimal),
      'gradePercentage': serializer.toJson<double>(gradePercentage),
      'gradeLetter': serializer.toJson<String>(gradeLetter),
    };
  }

  GradedComponentTableData copyWith(
          {int? id,
          double? weightDecimal,
          double? gradePercentage,
          String? gradeLetter}) =>
      GradedComponentTableData(
        id: id ?? this.id,
        weightDecimal: weightDecimal ?? this.weightDecimal,
        gradePercentage: gradePercentage ?? this.gradePercentage,
        gradeLetter: gradeLetter ?? this.gradeLetter,
      );
  GradedComponentTableData copyWithCompanion(
      GradedComponentTableCompanion data) {
    return GradedComponentTableData(
      id: data.id.present ? data.id.value : this.id,
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
    return (StringBuffer('GradedComponentTableData(')
          ..write('id: $id, ')
          ..write('weightDecimal: $weightDecimal, ')
          ..write('gradePercentage: $gradePercentage, ')
          ..write('gradeLetter: $gradeLetter')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, weightDecimal, gradePercentage, gradeLetter);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GradedComponentTableData &&
          other.id == this.id &&
          other.weightDecimal == this.weightDecimal &&
          other.gradePercentage == this.gradePercentage &&
          other.gradeLetter == this.gradeLetter);
}

class GradedComponentTableCompanion
    extends UpdateCompanion<GradedComponentTableData> {
  final Value<int> id;
  final Value<double> weightDecimal;
  final Value<double> gradePercentage;
  final Value<String> gradeLetter;
  const GradedComponentTableCompanion({
    this.id = const Value.absent(),
    this.weightDecimal = const Value.absent(),
    this.gradePercentage = const Value.absent(),
    this.gradeLetter = const Value.absent(),
  });
  GradedComponentTableCompanion.insert({
    this.id = const Value.absent(),
    required double weightDecimal,
    required double gradePercentage,
    required String gradeLetter,
  })  : weightDecimal = Value(weightDecimal),
        gradePercentage = Value(gradePercentage),
        gradeLetter = Value(gradeLetter);
  static Insertable<GradedComponentTableData> custom({
    Expression<int>? id,
    Expression<double>? weightDecimal,
    Expression<double>? gradePercentage,
    Expression<String>? gradeLetter,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weightDecimal != null) 'weight_decimal': weightDecimal,
      if (gradePercentage != null) 'grade_percentage': gradePercentage,
      if (gradeLetter != null) 'grade_letter': gradeLetter,
    });
  }

  GradedComponentTableCompanion copyWith(
      {Value<int>? id,
      Value<double>? weightDecimal,
      Value<double>? gradePercentage,
      Value<String>? gradeLetter}) {
    return GradedComponentTableCompanion(
      id: id ?? this.id,
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
    return (StringBuffer('GradedComponentTableCompanion(')
          ..write('id: $id, ')
          ..write('weightDecimal: $weightDecimal, ')
          ..write('gradePercentage: $gradePercentage, ')
          ..write('gradeLetter: $gradeLetter')
          ..write(')'))
        .toString();
  }
}

class $CourseTableTable extends CourseTable
    with TableInfo<$CourseTableTable, CourseTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseTableTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES user_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _gradedScaleIdMeta =
      const VerificationMeta('gradedScaleId');
  @override
  late final GeneratedColumn<int> gradedScaleId = GeneratedColumn<int>(
      'graded_scale_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES grade_scale_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _gradedComponentIdMeta =
      const VerificationMeta('gradedComponentId');
  @override
  late final GeneratedColumn<int> gradedComponentId = GeneratedColumn<int>(
      'graded_component_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES graded_component_table (id) ON DELETE CASCADE'));
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
        gradedScaleId,
        gradedComponentId,
        courseName,
        courseCode,
        scheduleBitMask
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_table';
  @override
  VerificationContext validateIntegrity(Insertable<CourseTableData> instance,
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
    if (data.containsKey('graded_scale_id')) {
      context.handle(
          _gradedScaleIdMeta,
          gradedScaleId.isAcceptableOrUnknown(
              data['graded_scale_id']!, _gradedScaleIdMeta));
    } else if (isInserting) {
      context.missing(_gradedScaleIdMeta);
    }
    if (data.containsKey('graded_component_id')) {
      context.handle(
          _gradedComponentIdMeta,
          gradedComponentId.isAcceptableOrUnknown(
              data['graded_component_id']!, _gradedComponentIdMeta));
    } else if (isInserting) {
      context.missing(_gradedComponentIdMeta);
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
  CourseTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      gradedScaleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}graded_scale_id'])!,
      gradedComponentId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}graded_component_id'])!,
      courseName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_name'])!,
      courseCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course_code'])!,
      scheduleBitMask: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}schedule_bit_mask'])!,
    );
  }

  @override
  $CourseTableTable createAlias(String alias) {
    return $CourseTableTable(attachedDatabase, alias);
  }
}

class CourseTableData extends DataClass implements Insertable<CourseTableData> {
  final int id;
  final int userId;
  final int gradedScaleId;
  final int gradedComponentId;
  final String courseName;
  final String courseCode;
  final int scheduleBitMask;
  const CourseTableData(
      {required this.id,
      required this.userId,
      required this.gradedScaleId,
      required this.gradedComponentId,
      required this.courseName,
      required this.courseCode,
      required this.scheduleBitMask});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['graded_scale_id'] = Variable<int>(gradedScaleId);
    map['graded_component_id'] = Variable<int>(gradedComponentId);
    map['course_name'] = Variable<String>(courseName);
    map['course_code'] = Variable<String>(courseCode);
    map['schedule_bit_mask'] = Variable<int>(scheduleBitMask);
    return map;
  }

  CourseTableCompanion toCompanion(bool nullToAbsent) {
    return CourseTableCompanion(
      id: Value(id),
      userId: Value(userId),
      gradedScaleId: Value(gradedScaleId),
      gradedComponentId: Value(gradedComponentId),
      courseName: Value(courseName),
      courseCode: Value(courseCode),
      scheduleBitMask: Value(scheduleBitMask),
    );
  }

  factory CourseTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseTableData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      gradedScaleId: serializer.fromJson<int>(json['gradedScaleId']),
      gradedComponentId: serializer.fromJson<int>(json['gradedComponentId']),
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
      'userId': serializer.toJson<int>(userId),
      'gradedScaleId': serializer.toJson<int>(gradedScaleId),
      'gradedComponentId': serializer.toJson<int>(gradedComponentId),
      'courseName': serializer.toJson<String>(courseName),
      'courseCode': serializer.toJson<String>(courseCode),
      'scheduleBitMask': serializer.toJson<int>(scheduleBitMask),
    };
  }

  CourseTableData copyWith(
          {int? id,
          int? userId,
          int? gradedScaleId,
          int? gradedComponentId,
          String? courseName,
          String? courseCode,
          int? scheduleBitMask}) =>
      CourseTableData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        gradedScaleId: gradedScaleId ?? this.gradedScaleId,
        gradedComponentId: gradedComponentId ?? this.gradedComponentId,
        courseName: courseName ?? this.courseName,
        courseCode: courseCode ?? this.courseCode,
        scheduleBitMask: scheduleBitMask ?? this.scheduleBitMask,
      );
  CourseTableData copyWithCompanion(CourseTableCompanion data) {
    return CourseTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      gradedScaleId: data.gradedScaleId.present
          ? data.gradedScaleId.value
          : this.gradedScaleId,
      gradedComponentId: data.gradedComponentId.present
          ? data.gradedComponentId.value
          : this.gradedComponentId,
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
    return (StringBuffer('CourseTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('gradedScaleId: $gradedScaleId, ')
          ..write('gradedComponentId: $gradedComponentId, ')
          ..write('courseName: $courseName, ')
          ..write('courseCode: $courseCode, ')
          ..write('scheduleBitMask: $scheduleBitMask')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, gradedScaleId, gradedComponentId,
      courseName, courseCode, scheduleBitMask);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.gradedScaleId == this.gradedScaleId &&
          other.gradedComponentId == this.gradedComponentId &&
          other.courseName == this.courseName &&
          other.courseCode == this.courseCode &&
          other.scheduleBitMask == this.scheduleBitMask);
}

class CourseTableCompanion extends UpdateCompanion<CourseTableData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> gradedScaleId;
  final Value<int> gradedComponentId;
  final Value<String> courseName;
  final Value<String> courseCode;
  final Value<int> scheduleBitMask;
  const CourseTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.gradedScaleId = const Value.absent(),
    this.gradedComponentId = const Value.absent(),
    this.courseName = const Value.absent(),
    this.courseCode = const Value.absent(),
    this.scheduleBitMask = const Value.absent(),
  });
  CourseTableCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int gradedScaleId,
    required int gradedComponentId,
    required String courseName,
    required String courseCode,
    required int scheduleBitMask,
  })  : userId = Value(userId),
        gradedScaleId = Value(gradedScaleId),
        gradedComponentId = Value(gradedComponentId),
        courseName = Value(courseName),
        courseCode = Value(courseCode),
        scheduleBitMask = Value(scheduleBitMask);
  static Insertable<CourseTableData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? gradedScaleId,
    Expression<int>? gradedComponentId,
    Expression<String>? courseName,
    Expression<String>? courseCode,
    Expression<int>? scheduleBitMask,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (gradedScaleId != null) 'graded_scale_id': gradedScaleId,
      if (gradedComponentId != null) 'graded_component_id': gradedComponentId,
      if (courseName != null) 'course_name': courseName,
      if (courseCode != null) 'course_code': courseCode,
      if (scheduleBitMask != null) 'schedule_bit_mask': scheduleBitMask,
    });
  }

  CourseTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int>? gradedScaleId,
      Value<int>? gradedComponentId,
      Value<String>? courseName,
      Value<String>? courseCode,
      Value<int>? scheduleBitMask}) {
    return CourseTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      gradedScaleId: gradedScaleId ?? this.gradedScaleId,
      gradedComponentId: gradedComponentId ?? this.gradedComponentId,
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
      map['user_id'] = Variable<int>(userId.value);
    }
    if (gradedScaleId.present) {
      map['graded_scale_id'] = Variable<int>(gradedScaleId.value);
    }
    if (gradedComponentId.present) {
      map['graded_component_id'] = Variable<int>(gradedComponentId.value);
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
    return (StringBuffer('CourseTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('gradedScaleId: $gradedScaleId, ')
          ..write('gradedComponentId: $gradedComponentId, ')
          ..write('courseName: $courseName, ')
          ..write('courseCode: $courseCode, ')
          ..write('scheduleBitMask: $scheduleBitMask')
          ..write(')'))
        .toString();
  }
}

class $AssessmentTableTable extends AssessmentTable
    with TableInfo<$AssessmentTableTable, AssessmentTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssessmentTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<int> courseId = GeneratedColumn<int>(
      'course_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES course_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _gradedComponentIdMeta =
      const VerificationMeta('gradedComponentId');
  @override
  late final GeneratedColumn<int> gradedComponentId = GeneratedColumn<int>(
      'graded_component_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES graded_component_table (id) ON DELETE CASCADE'));
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
          .withConverter<AssessmentType>($AssessmentTableTable.$convertertype);
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
  List<GeneratedColumn> get $columns =>
      [id, courseId, gradedComponentId, assessmentName, type, isComplete];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assessment_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AssessmentTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
  AssessmentTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssessmentTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}course_id'])!,
      gradedComponentId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}graded_component_id'])!,
      assessmentName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}assessment_name'])!,
      type: $AssessmentTableTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      isComplete: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_complete'])!,
    );
  }

  @override
  $AssessmentTableTable createAlias(String alias) {
    return $AssessmentTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AssessmentType, int, int> $convertertype =
      const EnumIndexConverter<AssessmentType>(AssessmentType.values);
}

class AssessmentTableData extends DataClass
    implements Insertable<AssessmentTableData> {
  final int id;
  final int courseId;
  final int gradedComponentId;
  final String assessmentName;
  final AssessmentType type;
  final bool isComplete;
  const AssessmentTableData(
      {required this.id,
      required this.courseId,
      required this.gradedComponentId,
      required this.assessmentName,
      required this.type,
      required this.isComplete});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['course_id'] = Variable<int>(courseId);
    map['graded_component_id'] = Variable<int>(gradedComponentId);
    map['assessment_name'] = Variable<String>(assessmentName);
    {
      map['type'] =
          Variable<int>($AssessmentTableTable.$convertertype.toSql(type));
    }
    map['is_complete'] = Variable<bool>(isComplete);
    return map;
  }

  AssessmentTableCompanion toCompanion(bool nullToAbsent) {
    return AssessmentTableCompanion(
      id: Value(id),
      courseId: Value(courseId),
      gradedComponentId: Value(gradedComponentId),
      assessmentName: Value(assessmentName),
      type: Value(type),
      isComplete: Value(isComplete),
    );
  }

  factory AssessmentTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssessmentTableData(
      id: serializer.fromJson<int>(json['id']),
      courseId: serializer.fromJson<int>(json['courseId']),
      gradedComponentId: serializer.fromJson<int>(json['gradedComponentId']),
      assessmentName: serializer.fromJson<String>(json['assessmentName']),
      type: $AssessmentTableTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      isComplete: serializer.fromJson<bool>(json['isComplete']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'courseId': serializer.toJson<int>(courseId),
      'gradedComponentId': serializer.toJson<int>(gradedComponentId),
      'assessmentName': serializer.toJson<String>(assessmentName),
      'type': serializer
          .toJson<int>($AssessmentTableTable.$convertertype.toJson(type)),
      'isComplete': serializer.toJson<bool>(isComplete),
    };
  }

  AssessmentTableData copyWith(
          {int? id,
          int? courseId,
          int? gradedComponentId,
          String? assessmentName,
          AssessmentType? type,
          bool? isComplete}) =>
      AssessmentTableData(
        id: id ?? this.id,
        courseId: courseId ?? this.courseId,
        gradedComponentId: gradedComponentId ?? this.gradedComponentId,
        assessmentName: assessmentName ?? this.assessmentName,
        type: type ?? this.type,
        isComplete: isComplete ?? this.isComplete,
      );
  AssessmentTableData copyWithCompanion(AssessmentTableCompanion data) {
    return AssessmentTableData(
      id: data.id.present ? data.id.value : this.id,
      courseId: data.courseId.present ? data.courseId.value : this.courseId,
      gradedComponentId: data.gradedComponentId.present
          ? data.gradedComponentId.value
          : this.gradedComponentId,
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
    return (StringBuffer('AssessmentTableData(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('gradedComponentId: $gradedComponentId, ')
          ..write('assessmentName: $assessmentName, ')
          ..write('type: $type, ')
          ..write('isComplete: $isComplete')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, courseId, gradedComponentId, assessmentName, type, isComplete);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssessmentTableData &&
          other.id == this.id &&
          other.courseId == this.courseId &&
          other.gradedComponentId == this.gradedComponentId &&
          other.assessmentName == this.assessmentName &&
          other.type == this.type &&
          other.isComplete == this.isComplete);
}

class AssessmentTableCompanion extends UpdateCompanion<AssessmentTableData> {
  final Value<int> id;
  final Value<int> courseId;
  final Value<int> gradedComponentId;
  final Value<String> assessmentName;
  final Value<AssessmentType> type;
  final Value<bool> isComplete;
  const AssessmentTableCompanion({
    this.id = const Value.absent(),
    this.courseId = const Value.absent(),
    this.gradedComponentId = const Value.absent(),
    this.assessmentName = const Value.absent(),
    this.type = const Value.absent(),
    this.isComplete = const Value.absent(),
  });
  AssessmentTableCompanion.insert({
    this.id = const Value.absent(),
    required int courseId,
    required int gradedComponentId,
    required String assessmentName,
    required AssessmentType type,
    required bool isComplete,
  })  : courseId = Value(courseId),
        gradedComponentId = Value(gradedComponentId),
        assessmentName = Value(assessmentName),
        type = Value(type),
        isComplete = Value(isComplete);
  static Insertable<AssessmentTableData> custom({
    Expression<int>? id,
    Expression<int>? courseId,
    Expression<int>? gradedComponentId,
    Expression<String>? assessmentName,
    Expression<int>? type,
    Expression<bool>? isComplete,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (courseId != null) 'course_id': courseId,
      if (gradedComponentId != null) 'graded_component_id': gradedComponentId,
      if (assessmentName != null) 'assessment_name': assessmentName,
      if (type != null) 'type': type,
      if (isComplete != null) 'is_complete': isComplete,
    });
  }

  AssessmentTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? courseId,
      Value<int>? gradedComponentId,
      Value<String>? assessmentName,
      Value<AssessmentType>? type,
      Value<bool>? isComplete}) {
    return AssessmentTableCompanion(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      gradedComponentId: gradedComponentId ?? this.gradedComponentId,
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
    if (courseId.present) {
      map['course_id'] = Variable<int>(courseId.value);
    }
    if (gradedComponentId.present) {
      map['graded_component_id'] = Variable<int>(gradedComponentId.value);
    }
    if (assessmentName.present) {
      map['assessment_name'] = Variable<String>(assessmentName.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($AssessmentTableTable.$convertertype.toSql(type.value));
    }
    if (isComplete.present) {
      map['is_complete'] = Variable<bool>(isComplete.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentTableCompanion(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('gradedComponentId: $gradedComponentId, ')
          ..write('assessmentName: $assessmentName, ')
          ..write('type: $type, ')
          ..write('isComplete: $isComplete')
          ..write(')'))
        .toString();
  }
}

class $EventTableTable extends EventTable
    with TableInfo<$EventTableTable, EventTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _eventNameMeta =
      const VerificationMeta('eventName');
  @override
  late final GeneratedColumn<String> eventName = GeneratedColumn<String>(
      'event_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, eventName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_table';
  @override
  VerificationContext validateIntegrity(Insertable<EventTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
  EventTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      eventName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event_name'])!,
    );
  }

  @override
  $EventTableTable createAlias(String alias) {
    return $EventTableTable(attachedDatabase, alias);
  }
}

class EventTableData extends DataClass implements Insertable<EventTableData> {
  final int id;
  final String eventName;
  const EventTableData({required this.id, required this.eventName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_name'] = Variable<String>(eventName);
    return map;
  }

  EventTableCompanion toCompanion(bool nullToAbsent) {
    return EventTableCompanion(
      id: Value(id),
      eventName: Value(eventName),
    );
  }

  factory EventTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventTableData(
      id: serializer.fromJson<int>(json['id']),
      eventName: serializer.fromJson<String>(json['eventName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventName': serializer.toJson<String>(eventName),
    };
  }

  EventTableData copyWith({int? id, String? eventName}) => EventTableData(
        id: id ?? this.id,
        eventName: eventName ?? this.eventName,
      );
  EventTableData copyWithCompanion(EventTableCompanion data) {
    return EventTableData(
      id: data.id.present ? data.id.value : this.id,
      eventName: data.eventName.present ? data.eventName.value : this.eventName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventTableData(')
          ..write('id: $id, ')
          ..write('eventName: $eventName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, eventName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventTableData &&
          other.id == this.id &&
          other.eventName == this.eventName);
}

class EventTableCompanion extends UpdateCompanion<EventTableData> {
  final Value<int> id;
  final Value<String> eventName;
  const EventTableCompanion({
    this.id = const Value.absent(),
    this.eventName = const Value.absent(),
  });
  EventTableCompanion.insert({
    this.id = const Value.absent(),
    required String eventName,
  }) : eventName = Value(eventName);
  static Insertable<EventTableData> custom({
    Expression<int>? id,
    Expression<String>? eventName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventName != null) 'event_name': eventName,
    });
  }

  EventTableCompanion copyWith({Value<int>? id, Value<String>? eventName}) {
    return EventTableCompanion(
      id: id ?? this.id,
      eventName: eventName ?? this.eventName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventName.present) {
      map['event_name'] = Variable<String>(eventName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventTableCompanion(')
          ..write('id: $id, ')
          ..write('eventName: $eventName')
          ..write(')'))
        .toString();
  }
}

class $TimeslotTableTable extends TimeslotTable
    with TableInfo<$TimeslotTableTable, TimeslotTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimeslotTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _referenceIdMeta =
      const VerificationMeta('referenceId');
  @override
  late final GeneratedColumn<int> referenceId = GeneratedColumn<int>(
      'reference_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<TimeSlotType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<TimeSlotType>($TimeslotTableTable.$convertertype);
  static const VerificationMeta _endingDayMeta =
      const VerificationMeta('endingDay');
  @override
  late final GeneratedColumnWithTypeConverter<DaysOfTheWeek, int> endingDay =
      GeneratedColumn<int>('ending_day', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<DaysOfTheWeek>(
              $TimeslotTableTable.$converterendingDay);
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
      [id, referenceId, type, endingDay, startDate, endDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timeslot_table';
  @override
  VerificationContext validateIntegrity(Insertable<TimeslotTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('reference_id')) {
      context.handle(
          _referenceIdMeta,
          referenceId.isAcceptableOrUnknown(
              data['reference_id']!, _referenceIdMeta));
    } else if (isInserting) {
      context.missing(_referenceIdMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
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
  TimeslotTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimeslotTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      referenceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reference_id'])!,
      type: $TimeslotTableTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      endingDay: $TimeslotTableTable.$converterendingDay.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}ending_day'])!),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
    );
  }

  @override
  $TimeslotTableTable createAlias(String alias) {
    return $TimeslotTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TimeSlotType, int, int> $convertertype =
      const EnumIndexConverter<TimeSlotType>(TimeSlotType.values);
  static JsonTypeConverter2<DaysOfTheWeek, int, int> $converterendingDay =
      const EnumIndexConverter<DaysOfTheWeek>(DaysOfTheWeek.values);
}

class TimeslotTableData extends DataClass
    implements Insertable<TimeslotTableData> {
  final int id;
  final int referenceId;
  final TimeSlotType type;
  final DaysOfTheWeek endingDay;
  final DateTime? startDate;
  final DateTime endDate;
  const TimeslotTableData(
      {required this.id,
      required this.referenceId,
      required this.type,
      required this.endingDay,
      this.startDate,
      required this.endDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['reference_id'] = Variable<int>(referenceId);
    {
      map['type'] =
          Variable<int>($TimeslotTableTable.$convertertype.toSql(type));
    }
    {
      map['ending_day'] = Variable<int>(
          $TimeslotTableTable.$converterendingDay.toSql(endingDay));
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    map['end_date'] = Variable<DateTime>(endDate);
    return map;
  }

  TimeslotTableCompanion toCompanion(bool nullToAbsent) {
    return TimeslotTableCompanion(
      id: Value(id),
      referenceId: Value(referenceId),
      type: Value(type),
      endingDay: Value(endingDay),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: Value(endDate),
    );
  }

  factory TimeslotTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimeslotTableData(
      id: serializer.fromJson<int>(json['id']),
      referenceId: serializer.fromJson<int>(json['referenceId']),
      type: $TimeslotTableTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      endingDay: $TimeslotTableTable.$converterendingDay
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
      'referenceId': serializer.toJson<int>(referenceId),
      'type': serializer
          .toJson<int>($TimeslotTableTable.$convertertype.toJson(type)),
      'endingDay': serializer.toJson<int>(
          $TimeslotTableTable.$converterendingDay.toJson(endingDay)),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
    };
  }

  TimeslotTableData copyWith(
          {int? id,
          int? referenceId,
          TimeSlotType? type,
          DaysOfTheWeek? endingDay,
          Value<DateTime?> startDate = const Value.absent(),
          DateTime? endDate}) =>
      TimeslotTableData(
        id: id ?? this.id,
        referenceId: referenceId ?? this.referenceId,
        type: type ?? this.type,
        endingDay: endingDay ?? this.endingDay,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate ?? this.endDate,
      );
  TimeslotTableData copyWithCompanion(TimeslotTableCompanion data) {
    return TimeslotTableData(
      id: data.id.present ? data.id.value : this.id,
      referenceId:
          data.referenceId.present ? data.referenceId.value : this.referenceId,
      type: data.type.present ? data.type.value : this.type,
      endingDay: data.endingDay.present ? data.endingDay.value : this.endingDay,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimeslotTableData(')
          ..write('id: $id, ')
          ..write('referenceId: $referenceId, ')
          ..write('type: $type, ')
          ..write('endingDay: $endingDay, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, referenceId, type, endingDay, startDate, endDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimeslotTableData &&
          other.id == this.id &&
          other.referenceId == this.referenceId &&
          other.type == this.type &&
          other.endingDay == this.endingDay &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class TimeslotTableCompanion extends UpdateCompanion<TimeslotTableData> {
  final Value<int> id;
  final Value<int> referenceId;
  final Value<TimeSlotType> type;
  final Value<DaysOfTheWeek> endingDay;
  final Value<DateTime?> startDate;
  final Value<DateTime> endDate;
  const TimeslotTableCompanion({
    this.id = const Value.absent(),
    this.referenceId = const Value.absent(),
    this.type = const Value.absent(),
    this.endingDay = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  TimeslotTableCompanion.insert({
    this.id = const Value.absent(),
    required int referenceId,
    required TimeSlotType type,
    required DaysOfTheWeek endingDay,
    this.startDate = const Value.absent(),
    required DateTime endDate,
  })  : referenceId = Value(referenceId),
        type = Value(type),
        endingDay = Value(endingDay),
        endDate = Value(endDate);
  static Insertable<TimeslotTableData> custom({
    Expression<int>? id,
    Expression<int>? referenceId,
    Expression<int>? type,
    Expression<int>? endingDay,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (referenceId != null) 'reference_id': referenceId,
      if (type != null) 'type': type,
      if (endingDay != null) 'ending_day': endingDay,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  TimeslotTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? referenceId,
      Value<TimeSlotType>? type,
      Value<DaysOfTheWeek>? endingDay,
      Value<DateTime?>? startDate,
      Value<DateTime>? endDate}) {
    return TimeslotTableCompanion(
      id: id ?? this.id,
      referenceId: referenceId ?? this.referenceId,
      type: type ?? this.type,
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
    if (referenceId.present) {
      map['reference_id'] = Variable<int>(referenceId.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($TimeslotTableTable.$convertertype.toSql(type.value));
    }
    if (endingDay.present) {
      map['ending_day'] = Variable<int>(
          $TimeslotTableTable.$converterendingDay.toSql(endingDay.value));
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
    return (StringBuffer('TimeslotTableCompanion(')
          ..write('id: $id, ')
          ..write('referenceId: $referenceId, ')
          ..write('type: $type, ')
          ..write('endingDay: $endingDay, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $GradeScaleTableTable gradeScaleTable =
      $GradeScaleTableTable(this);
  late final $GradedComponentTableTable gradedComponentTable =
      $GradedComponentTableTable(this);
  late final $CourseTableTable courseTable = $CourseTableTable(this);
  late final $AssessmentTableTable assessmentTable =
      $AssessmentTableTable(this);
  late final $EventTableTable eventTable = $EventTableTable(this);
  late final $TimeslotTableTable timeslotTable = $TimeslotTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userTable,
        gradeScaleTable,
        gradedComponentTable,
        courseTable,
        assessmentTable,
        eventTable,
        timeslotTable
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('user_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('course_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('grade_scale_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('course_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('graded_component_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('course_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('course_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('assessment_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('graded_component_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('assessment_table', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$UserTableTableCreateCompanionBuilder = UserTableCompanion Function({
  Value<int> id,
  required String username,
});
typedef $$UserTableTableUpdateCompanionBuilder = UserTableCompanion Function({
  Value<int> id,
  Value<String> username,
});

final class $$UserTableTableReferences
    extends BaseReferences<_$AppDatabase, $UserTableTable, UserTableData> {
  $$UserTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CourseTableTable, List<CourseTableData>>
      _courseTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.courseTable,
              aliasName:
                  $_aliasNameGenerator(db.userTable.id, db.courseTable.userId));

  $$CourseTableTableProcessedTableManager get courseTableRefs {
    final manager = $$CourseTableTableTableManager($_db, $_db.courseTable)
        .filter((f) => f.userId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_courseTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UserTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  Expression<bool> courseTableRefs(
      Expression<bool> Function($$CourseTableTableFilterComposer f) f) {
    final $$CourseTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.courseTable,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CourseTableTableFilterComposer(
              $db: $db,
              $table: $db.courseTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UserTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));
}

class $$UserTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  Expression<T> courseTableRefs<T extends Object>(
      Expression<T> Function($$CourseTableTableAnnotationComposer a) f) {
    final $$CourseTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.courseTable,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CourseTableTableAnnotationComposer(
              $db: $db,
              $table: $db.courseTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UserTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserTableTable,
    UserTableData,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (UserTableData, $$UserTableTableReferences),
    UserTableData,
    PrefetchHooks Function({bool courseTableRefs})> {
  $$UserTableTableTableManager(_$AppDatabase db, $UserTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> username = const Value.absent(),
          }) =>
              UserTableCompanion(
            id: id,
            username: username,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String username,
          }) =>
              UserTableCompanion.insert(
            id: id,
            username: username,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UserTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({courseTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (courseTableRefs) db.courseTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (courseTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$UserTableTableReferences
                            ._courseTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UserTableTableReferences(db, table, p0)
                                .courseTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UserTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserTableTable,
    UserTableData,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (UserTableData, $$UserTableTableReferences),
    UserTableData,
    PrefetchHooks Function({bool courseTableRefs})>;
typedef $$GradeScaleTableTableCreateCompanionBuilder = GradeScaleTableCompanion
    Function({
  Value<int> id,
  required String thresholdsJson,
});
typedef $$GradeScaleTableTableUpdateCompanionBuilder = GradeScaleTableCompanion
    Function({
  Value<int> id,
  Value<String> thresholdsJson,
});

final class $$GradeScaleTableTableReferences extends BaseReferences<
    _$AppDatabase, $GradeScaleTableTable, GradeScaleTableData> {
  $$GradeScaleTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CourseTableTable, List<CourseTableData>>
      _courseTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.courseTable,
              aliasName: $_aliasNameGenerator(
                  db.gradeScaleTable.id, db.courseTable.gradedScaleId));

  $$CourseTableTableProcessedTableManager get courseTableRefs {
    final manager = $$CourseTableTableTableManager($_db, $_db.courseTable)
        .filter((f) => f.gradedScaleId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_courseTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GradeScaleTableTableFilterComposer
    extends Composer<_$AppDatabase, $GradeScaleTableTable> {
  $$GradeScaleTableTableFilterComposer({
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

  Expression<bool> courseTableRefs(
      Expression<bool> Function($$CourseTableTableFilterComposer f) f) {
    final $$CourseTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.courseTable,
        getReferencedColumn: (t) => t.gradedScaleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CourseTableTableFilterComposer(
              $db: $db,
              $table: $db.courseTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GradeScaleTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GradeScaleTableTable> {
  $$GradeScaleTableTableOrderingComposer({
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
}

class $$GradeScaleTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GradeScaleTableTable> {
  $$GradeScaleTableTableAnnotationComposer({
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

  Expression<T> courseTableRefs<T extends Object>(
      Expression<T> Function($$CourseTableTableAnnotationComposer a) f) {
    final $$CourseTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.courseTable,
        getReferencedColumn: (t) => t.gradedScaleId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CourseTableTableAnnotationComposer(
              $db: $db,
              $table: $db.courseTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GradeScaleTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GradeScaleTableTable,
    GradeScaleTableData,
    $$GradeScaleTableTableFilterComposer,
    $$GradeScaleTableTableOrderingComposer,
    $$GradeScaleTableTableAnnotationComposer,
    $$GradeScaleTableTableCreateCompanionBuilder,
    $$GradeScaleTableTableUpdateCompanionBuilder,
    (GradeScaleTableData, $$GradeScaleTableTableReferences),
    GradeScaleTableData,
    PrefetchHooks Function({bool courseTableRefs})> {
  $$GradeScaleTableTableTableManager(
      _$AppDatabase db, $GradeScaleTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GradeScaleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GradeScaleTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GradeScaleTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> thresholdsJson = const Value.absent(),
          }) =>
              GradeScaleTableCompanion(
            id: id,
            thresholdsJson: thresholdsJson,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String thresholdsJson,
          }) =>
              GradeScaleTableCompanion.insert(
            id: id,
            thresholdsJson: thresholdsJson,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GradeScaleTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({courseTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (courseTableRefs) db.courseTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (courseTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$GradeScaleTableTableReferences
                            ._courseTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GradeScaleTableTableReferences(db, table, p0)
                                .courseTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.gradedScaleId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GradeScaleTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GradeScaleTableTable,
    GradeScaleTableData,
    $$GradeScaleTableTableFilterComposer,
    $$GradeScaleTableTableOrderingComposer,
    $$GradeScaleTableTableAnnotationComposer,
    $$GradeScaleTableTableCreateCompanionBuilder,
    $$GradeScaleTableTableUpdateCompanionBuilder,
    (GradeScaleTableData, $$GradeScaleTableTableReferences),
    GradeScaleTableData,
    PrefetchHooks Function({bool courseTableRefs})>;
typedef $$GradedComponentTableTableCreateCompanionBuilder
    = GradedComponentTableCompanion Function({
  Value<int> id,
  required double weightDecimal,
  required double gradePercentage,
  required String gradeLetter,
});
typedef $$GradedComponentTableTableUpdateCompanionBuilder
    = GradedComponentTableCompanion Function({
  Value<int> id,
  Value<double> weightDecimal,
  Value<double> gradePercentage,
  Value<String> gradeLetter,
});

final class $$GradedComponentTableTableReferences extends BaseReferences<
    _$AppDatabase, $GradedComponentTableTable, GradedComponentTableData> {
  $$GradedComponentTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CourseTableTable, List<CourseTableData>>
      _courseTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.courseTable,
          aliasName: $_aliasNameGenerator(
              db.gradedComponentTable.id, db.courseTable.gradedComponentId));

  $$CourseTableTableProcessedTableManager get courseTableRefs {
    final manager = $$CourseTableTableTableManager($_db, $_db.courseTable)
        .filter((f) => f.gradedComponentId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_courseTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AssessmentTableTable, List<AssessmentTableData>>
      _assessmentTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.assessmentTable,
              aliasName: $_aliasNameGenerator(db.gradedComponentTable.id,
                  db.assessmentTable.gradedComponentId));

  $$AssessmentTableTableProcessedTableManager get assessmentTableRefs {
    final manager =
        $$AssessmentTableTableTableManager($_db, $_db.assessmentTable)
            .filter((f) => f.gradedComponentId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_assessmentTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GradedComponentTableTableFilterComposer
    extends Composer<_$AppDatabase, $GradedComponentTableTable> {
  $$GradedComponentTableTableFilterComposer({
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

  Expression<bool> courseTableRefs(
      Expression<bool> Function($$CourseTableTableFilterComposer f) f) {
    final $$CourseTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.courseTable,
        getReferencedColumn: (t) => t.gradedComponentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CourseTableTableFilterComposer(
              $db: $db,
              $table: $db.courseTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> assessmentTableRefs(
      Expression<bool> Function($$AssessmentTableTableFilterComposer f) f) {
    final $$AssessmentTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assessmentTable,
        getReferencedColumn: (t) => t.gradedComponentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssessmentTableTableFilterComposer(
              $db: $db,
              $table: $db.assessmentTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GradedComponentTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GradedComponentTableTable> {
  $$GradedComponentTableTableOrderingComposer({
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
}

class $$GradedComponentTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GradedComponentTableTable> {
  $$GradedComponentTableTableAnnotationComposer({
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

  Expression<T> courseTableRefs<T extends Object>(
      Expression<T> Function($$CourseTableTableAnnotationComposer a) f) {
    final $$CourseTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.courseTable,
        getReferencedColumn: (t) => t.gradedComponentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CourseTableTableAnnotationComposer(
              $db: $db,
              $table: $db.courseTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> assessmentTableRefs<T extends Object>(
      Expression<T> Function($$AssessmentTableTableAnnotationComposer a) f) {
    final $$AssessmentTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assessmentTable,
        getReferencedColumn: (t) => t.gradedComponentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssessmentTableTableAnnotationComposer(
              $db: $db,
              $table: $db.assessmentTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GradedComponentTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GradedComponentTableTable,
    GradedComponentTableData,
    $$GradedComponentTableTableFilterComposer,
    $$GradedComponentTableTableOrderingComposer,
    $$GradedComponentTableTableAnnotationComposer,
    $$GradedComponentTableTableCreateCompanionBuilder,
    $$GradedComponentTableTableUpdateCompanionBuilder,
    (GradedComponentTableData, $$GradedComponentTableTableReferences),
    GradedComponentTableData,
    PrefetchHooks Function({bool courseTableRefs, bool assessmentTableRefs})> {
  $$GradedComponentTableTableTableManager(
      _$AppDatabase db, $GradedComponentTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GradedComponentTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GradedComponentTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GradedComponentTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> weightDecimal = const Value.absent(),
            Value<double> gradePercentage = const Value.absent(),
            Value<String> gradeLetter = const Value.absent(),
          }) =>
              GradedComponentTableCompanion(
            id: id,
            weightDecimal: weightDecimal,
            gradePercentage: gradePercentage,
            gradeLetter: gradeLetter,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double weightDecimal,
            required double gradePercentage,
            required String gradeLetter,
          }) =>
              GradedComponentTableCompanion.insert(
            id: id,
            weightDecimal: weightDecimal,
            gradePercentage: gradePercentage,
            gradeLetter: gradeLetter,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GradedComponentTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {courseTableRefs = false, assessmentTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (courseTableRefs) db.courseTable,
                if (assessmentTableRefs) db.assessmentTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (courseTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$GradedComponentTableTableReferences
                            ._courseTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GradedComponentTableTableReferences(db, table, p0)
                                .courseTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.gradedComponentId == item.id),
                        typedResults: items),
                  if (assessmentTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$GradedComponentTableTableReferences
                            ._assessmentTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GradedComponentTableTableReferences(db, table, p0)
                                .assessmentTableRefs,
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

typedef $$GradedComponentTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $GradedComponentTableTable,
        GradedComponentTableData,
        $$GradedComponentTableTableFilterComposer,
        $$GradedComponentTableTableOrderingComposer,
        $$GradedComponentTableTableAnnotationComposer,
        $$GradedComponentTableTableCreateCompanionBuilder,
        $$GradedComponentTableTableUpdateCompanionBuilder,
        (GradedComponentTableData, $$GradedComponentTableTableReferences),
        GradedComponentTableData,
        PrefetchHooks Function(
            {bool courseTableRefs, bool assessmentTableRefs})>;
typedef $$CourseTableTableCreateCompanionBuilder = CourseTableCompanion
    Function({
  Value<int> id,
  required int userId,
  required int gradedScaleId,
  required int gradedComponentId,
  required String courseName,
  required String courseCode,
  required int scheduleBitMask,
});
typedef $$CourseTableTableUpdateCompanionBuilder = CourseTableCompanion
    Function({
  Value<int> id,
  Value<int> userId,
  Value<int> gradedScaleId,
  Value<int> gradedComponentId,
  Value<String> courseName,
  Value<String> courseCode,
  Value<int> scheduleBitMask,
});

final class $$CourseTableTableReferences
    extends BaseReferences<_$AppDatabase, $CourseTableTable, CourseTableData> {
  $$CourseTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserTableTable _userIdTable(_$AppDatabase db) =>
      db.userTable.createAlias(
          $_aliasNameGenerator(db.courseTable.userId, db.userTable.id));

  $$UserTableTableProcessedTableManager get userId {
    final manager = $$UserTableTableTableManager($_db, $_db.userTable)
        .filter((f) => f.id($_item.userId));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GradeScaleTableTable _gradedScaleIdTable(_$AppDatabase db) =>
      db.gradeScaleTable.createAlias($_aliasNameGenerator(
          db.courseTable.gradedScaleId, db.gradeScaleTable.id));

  $$GradeScaleTableTableProcessedTableManager get gradedScaleId {
    final manager =
        $$GradeScaleTableTableTableManager($_db, $_db.gradeScaleTable)
            .filter((f) => f.id($_item.gradedScaleId));
    final item = $_typedResult.readTableOrNull(_gradedScaleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GradedComponentTableTable _gradedComponentIdTable(_$AppDatabase db) =>
      db.gradedComponentTable.createAlias($_aliasNameGenerator(
          db.courseTable.gradedComponentId, db.gradedComponentTable.id));

  $$GradedComponentTableTableProcessedTableManager get gradedComponentId {
    final manager =
        $$GradedComponentTableTableTableManager($_db, $_db.gradedComponentTable)
            .filter((f) => f.id($_item.gradedComponentId));
    final item = $_typedResult.readTableOrNull(_gradedComponentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$AssessmentTableTable, List<AssessmentTableData>>
      _assessmentTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.assessmentTable,
              aliasName: $_aliasNameGenerator(
                  db.courseTable.id, db.assessmentTable.courseId));

  $$AssessmentTableTableProcessedTableManager get assessmentTableRefs {
    final manager =
        $$AssessmentTableTableTableManager($_db, $_db.assessmentTable)
            .filter((f) => f.courseId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_assessmentTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CourseTableTableFilterComposer
    extends Composer<_$AppDatabase, $CourseTableTable> {
  $$CourseTableTableFilterComposer({
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

  $$UserTableTableFilterComposer get userId {
    final $$UserTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableFilterComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradeScaleTableTableFilterComposer get gradedScaleId {
    final $$GradeScaleTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradedScaleId,
        referencedTable: $db.gradeScaleTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradeScaleTableTableFilterComposer(
              $db: $db,
              $table: $db.gradeScaleTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradedComponentTableTableFilterComposer get gradedComponentId {
    final $$GradedComponentTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradedComponentId,
        referencedTable: $db.gradedComponentTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradedComponentTableTableFilterComposer(
              $db: $db,
              $table: $db.gradedComponentTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> assessmentTableRefs(
      Expression<bool> Function($$AssessmentTableTableFilterComposer f) f) {
    final $$AssessmentTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assessmentTable,
        getReferencedColumn: (t) => t.courseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssessmentTableTableFilterComposer(
              $db: $db,
              $table: $db.assessmentTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CourseTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CourseTableTable> {
  $$CourseTableTableOrderingComposer({
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

  $$UserTableTableOrderingComposer get userId {
    final $$UserTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableOrderingComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradeScaleTableTableOrderingComposer get gradedScaleId {
    final $$GradeScaleTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradedScaleId,
        referencedTable: $db.gradeScaleTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradeScaleTableTableOrderingComposer(
              $db: $db,
              $table: $db.gradeScaleTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradedComponentTableTableOrderingComposer get gradedComponentId {
    final $$GradedComponentTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.gradedComponentId,
            referencedTable: $db.gradedComponentTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$GradedComponentTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.gradedComponentTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$CourseTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CourseTableTable> {
  $$CourseTableTableAnnotationComposer({
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

  $$UserTableTableAnnotationComposer get userId {
    final $$UserTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableAnnotationComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradeScaleTableTableAnnotationComposer get gradedScaleId {
    final $$GradeScaleTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradedScaleId,
        referencedTable: $db.gradeScaleTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradeScaleTableTableAnnotationComposer(
              $db: $db,
              $table: $db.gradeScaleTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradedComponentTableTableAnnotationComposer get gradedComponentId {
    final $$GradedComponentTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.gradedComponentId,
            referencedTable: $db.gradedComponentTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$GradedComponentTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.gradedComponentTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> assessmentTableRefs<T extends Object>(
      Expression<T> Function($$AssessmentTableTableAnnotationComposer a) f) {
    final $$AssessmentTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.assessmentTable,
        getReferencedColumn: (t) => t.courseId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AssessmentTableTableAnnotationComposer(
              $db: $db,
              $table: $db.assessmentTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CourseTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CourseTableTable,
    CourseTableData,
    $$CourseTableTableFilterComposer,
    $$CourseTableTableOrderingComposer,
    $$CourseTableTableAnnotationComposer,
    $$CourseTableTableCreateCompanionBuilder,
    $$CourseTableTableUpdateCompanionBuilder,
    (CourseTableData, $$CourseTableTableReferences),
    CourseTableData,
    PrefetchHooks Function(
        {bool userId,
        bool gradedScaleId,
        bool gradedComponentId,
        bool assessmentTableRefs})> {
  $$CourseTableTableTableManager(_$AppDatabase db, $CourseTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CourseTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CourseTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<int> gradedScaleId = const Value.absent(),
            Value<int> gradedComponentId = const Value.absent(),
            Value<String> courseName = const Value.absent(),
            Value<String> courseCode = const Value.absent(),
            Value<int> scheduleBitMask = const Value.absent(),
          }) =>
              CourseTableCompanion(
            id: id,
            userId: userId,
            gradedScaleId: gradedScaleId,
            gradedComponentId: gradedComponentId,
            courseName: courseName,
            courseCode: courseCode,
            scheduleBitMask: scheduleBitMask,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required int gradedScaleId,
            required int gradedComponentId,
            required String courseName,
            required String courseCode,
            required int scheduleBitMask,
          }) =>
              CourseTableCompanion.insert(
            id: id,
            userId: userId,
            gradedScaleId: gradedScaleId,
            gradedComponentId: gradedComponentId,
            courseName: courseName,
            courseCode: courseCode,
            scheduleBitMask: scheduleBitMask,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CourseTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {userId = false,
              gradedScaleId = false,
              gradedComponentId = false,
              assessmentTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (assessmentTableRefs) db.assessmentTable
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
                        $$CourseTableTableReferences._userIdTable(db),
                    referencedColumn:
                        $$CourseTableTableReferences._userIdTable(db).id,
                  ) as T;
                }
                if (gradedScaleId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.gradedScaleId,
                    referencedTable:
                        $$CourseTableTableReferences._gradedScaleIdTable(db),
                    referencedColumn:
                        $$CourseTableTableReferences._gradedScaleIdTable(db).id,
                  ) as T;
                }
                if (gradedComponentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.gradedComponentId,
                    referencedTable: $$CourseTableTableReferences
                        ._gradedComponentIdTable(db),
                    referencedColumn: $$CourseTableTableReferences
                        ._gradedComponentIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (assessmentTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CourseTableTableReferences
                            ._assessmentTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CourseTableTableReferences(db, table, p0)
                                .assessmentTableRefs,
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

typedef $$CourseTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CourseTableTable,
    CourseTableData,
    $$CourseTableTableFilterComposer,
    $$CourseTableTableOrderingComposer,
    $$CourseTableTableAnnotationComposer,
    $$CourseTableTableCreateCompanionBuilder,
    $$CourseTableTableUpdateCompanionBuilder,
    (CourseTableData, $$CourseTableTableReferences),
    CourseTableData,
    PrefetchHooks Function(
        {bool userId,
        bool gradedScaleId,
        bool gradedComponentId,
        bool assessmentTableRefs})>;
typedef $$AssessmentTableTableCreateCompanionBuilder = AssessmentTableCompanion
    Function({
  Value<int> id,
  required int courseId,
  required int gradedComponentId,
  required String assessmentName,
  required AssessmentType type,
  required bool isComplete,
});
typedef $$AssessmentTableTableUpdateCompanionBuilder = AssessmentTableCompanion
    Function({
  Value<int> id,
  Value<int> courseId,
  Value<int> gradedComponentId,
  Value<String> assessmentName,
  Value<AssessmentType> type,
  Value<bool> isComplete,
});

final class $$AssessmentTableTableReferences extends BaseReferences<
    _$AppDatabase, $AssessmentTableTable, AssessmentTableData> {
  $$AssessmentTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CourseTableTable _courseIdTable(_$AppDatabase db) =>
      db.courseTable.createAlias(
          $_aliasNameGenerator(db.assessmentTable.courseId, db.courseTable.id));

  $$CourseTableTableProcessedTableManager get courseId {
    final manager = $$CourseTableTableTableManager($_db, $_db.courseTable)
        .filter((f) => f.id($_item.courseId));
    final item = $_typedResult.readTableOrNull(_courseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GradedComponentTableTable _gradedComponentIdTable(_$AppDatabase db) =>
      db.gradedComponentTable.createAlias($_aliasNameGenerator(
          db.assessmentTable.gradedComponentId, db.gradedComponentTable.id));

  $$GradedComponentTableTableProcessedTableManager get gradedComponentId {
    final manager =
        $$GradedComponentTableTableTableManager($_db, $_db.gradedComponentTable)
            .filter((f) => f.id($_item.gradedComponentId));
    final item = $_typedResult.readTableOrNull(_gradedComponentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AssessmentTableTableFilterComposer
    extends Composer<_$AppDatabase, $AssessmentTableTable> {
  $$AssessmentTableTableFilterComposer({
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

  $$CourseTableTableFilterComposer get courseId {
    final $$CourseTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.courseId,
        referencedTable: $db.courseTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CourseTableTableFilterComposer(
              $db: $db,
              $table: $db.courseTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradedComponentTableTableFilterComposer get gradedComponentId {
    final $$GradedComponentTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gradedComponentId,
        referencedTable: $db.gradedComponentTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GradedComponentTableTableFilterComposer(
              $db: $db,
              $table: $db.gradedComponentTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AssessmentTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AssessmentTableTable> {
  $$AssessmentTableTableOrderingComposer({
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

  $$CourseTableTableOrderingComposer get courseId {
    final $$CourseTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.courseId,
        referencedTable: $db.courseTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CourseTableTableOrderingComposer(
              $db: $db,
              $table: $db.courseTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradedComponentTableTableOrderingComposer get gradedComponentId {
    final $$GradedComponentTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.gradedComponentId,
            referencedTable: $db.gradedComponentTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$GradedComponentTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.gradedComponentTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$AssessmentTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssessmentTableTable> {
  $$AssessmentTableTableAnnotationComposer({
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

  $$CourseTableTableAnnotationComposer get courseId {
    final $$CourseTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.courseId,
        referencedTable: $db.courseTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CourseTableTableAnnotationComposer(
              $db: $db,
              $table: $db.courseTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GradedComponentTableTableAnnotationComposer get gradedComponentId {
    final $$GradedComponentTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.gradedComponentId,
            referencedTable: $db.gradedComponentTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$GradedComponentTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.gradedComponentTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$AssessmentTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AssessmentTableTable,
    AssessmentTableData,
    $$AssessmentTableTableFilterComposer,
    $$AssessmentTableTableOrderingComposer,
    $$AssessmentTableTableAnnotationComposer,
    $$AssessmentTableTableCreateCompanionBuilder,
    $$AssessmentTableTableUpdateCompanionBuilder,
    (AssessmentTableData, $$AssessmentTableTableReferences),
    AssessmentTableData,
    PrefetchHooks Function({bool courseId, bool gradedComponentId})> {
  $$AssessmentTableTableTableManager(
      _$AppDatabase db, $AssessmentTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssessmentTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssessmentTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssessmentTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> courseId = const Value.absent(),
            Value<int> gradedComponentId = const Value.absent(),
            Value<String> assessmentName = const Value.absent(),
            Value<AssessmentType> type = const Value.absent(),
            Value<bool> isComplete = const Value.absent(),
          }) =>
              AssessmentTableCompanion(
            id: id,
            courseId: courseId,
            gradedComponentId: gradedComponentId,
            assessmentName: assessmentName,
            type: type,
            isComplete: isComplete,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int courseId,
            required int gradedComponentId,
            required String assessmentName,
            required AssessmentType type,
            required bool isComplete,
          }) =>
              AssessmentTableCompanion.insert(
            id: id,
            courseId: courseId,
            gradedComponentId: gradedComponentId,
            assessmentName: assessmentName,
            type: type,
            isComplete: isComplete,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AssessmentTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {courseId = false, gradedComponentId = false}) {
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
                if (courseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.courseId,
                    referencedTable:
                        $$AssessmentTableTableReferences._courseIdTable(db),
                    referencedColumn:
                        $$AssessmentTableTableReferences._courseIdTable(db).id,
                  ) as T;
                }
                if (gradedComponentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.gradedComponentId,
                    referencedTable: $$AssessmentTableTableReferences
                        ._gradedComponentIdTable(db),
                    referencedColumn: $$AssessmentTableTableReferences
                        ._gradedComponentIdTable(db)
                        .id,
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

typedef $$AssessmentTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AssessmentTableTable,
    AssessmentTableData,
    $$AssessmentTableTableFilterComposer,
    $$AssessmentTableTableOrderingComposer,
    $$AssessmentTableTableAnnotationComposer,
    $$AssessmentTableTableCreateCompanionBuilder,
    $$AssessmentTableTableUpdateCompanionBuilder,
    (AssessmentTableData, $$AssessmentTableTableReferences),
    AssessmentTableData,
    PrefetchHooks Function({bool courseId, bool gradedComponentId})>;
typedef $$EventTableTableCreateCompanionBuilder = EventTableCompanion Function({
  Value<int> id,
  required String eventName,
});
typedef $$EventTableTableUpdateCompanionBuilder = EventTableCompanion Function({
  Value<int> id,
  Value<String> eventName,
});

class $$EventTableTableFilterComposer
    extends Composer<_$AppDatabase, $EventTableTable> {
  $$EventTableTableFilterComposer({
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
}

class $$EventTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EventTableTable> {
  $$EventTableTableOrderingComposer({
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
}

class $$EventTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventTableTable> {
  $$EventTableTableAnnotationComposer({
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
}

class $$EventTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EventTableTable,
    EventTableData,
    $$EventTableTableFilterComposer,
    $$EventTableTableOrderingComposer,
    $$EventTableTableAnnotationComposer,
    $$EventTableTableCreateCompanionBuilder,
    $$EventTableTableUpdateCompanionBuilder,
    (
      EventTableData,
      BaseReferences<_$AppDatabase, $EventTableTable, EventTableData>
    ),
    EventTableData,
    PrefetchHooks Function()> {
  $$EventTableTableTableManager(_$AppDatabase db, $EventTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> eventName = const Value.absent(),
          }) =>
              EventTableCompanion(
            id: id,
            eventName: eventName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String eventName,
          }) =>
              EventTableCompanion.insert(
            id: id,
            eventName: eventName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EventTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EventTableTable,
    EventTableData,
    $$EventTableTableFilterComposer,
    $$EventTableTableOrderingComposer,
    $$EventTableTableAnnotationComposer,
    $$EventTableTableCreateCompanionBuilder,
    $$EventTableTableUpdateCompanionBuilder,
    (
      EventTableData,
      BaseReferences<_$AppDatabase, $EventTableTable, EventTableData>
    ),
    EventTableData,
    PrefetchHooks Function()>;
typedef $$TimeslotTableTableCreateCompanionBuilder = TimeslotTableCompanion
    Function({
  Value<int> id,
  required int referenceId,
  required TimeSlotType type,
  required DaysOfTheWeek endingDay,
  Value<DateTime?> startDate,
  required DateTime endDate,
});
typedef $$TimeslotTableTableUpdateCompanionBuilder = TimeslotTableCompanion
    Function({
  Value<int> id,
  Value<int> referenceId,
  Value<TimeSlotType> type,
  Value<DaysOfTheWeek> endingDay,
  Value<DateTime?> startDate,
  Value<DateTime> endDate,
});

class $$TimeslotTableTableFilterComposer
    extends Composer<_$AppDatabase, $TimeslotTableTable> {
  $$TimeslotTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get referenceId => $composableBuilder(
      column: $table.referenceId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<TimeSlotType, TimeSlotType, int> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<DaysOfTheWeek, DaysOfTheWeek, int>
      get endingDay => $composableBuilder(
          column: $table.endingDay,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));
}

class $$TimeslotTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TimeslotTableTable> {
  $$TimeslotTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get referenceId => $composableBuilder(
      column: $table.referenceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endingDay => $composableBuilder(
      column: $table.endingDay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));
}

class $$TimeslotTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimeslotTableTable> {
  $$TimeslotTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get referenceId => $composableBuilder(
      column: $table.referenceId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TimeSlotType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DaysOfTheWeek, int> get endingDay =>
      $composableBuilder(column: $table.endingDay, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);
}

class $$TimeslotTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TimeslotTableTable,
    TimeslotTableData,
    $$TimeslotTableTableFilterComposer,
    $$TimeslotTableTableOrderingComposer,
    $$TimeslotTableTableAnnotationComposer,
    $$TimeslotTableTableCreateCompanionBuilder,
    $$TimeslotTableTableUpdateCompanionBuilder,
    (
      TimeslotTableData,
      BaseReferences<_$AppDatabase, $TimeslotTableTable, TimeslotTableData>
    ),
    TimeslotTableData,
    PrefetchHooks Function()> {
  $$TimeslotTableTableTableManager(_$AppDatabase db, $TimeslotTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimeslotTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimeslotTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimeslotTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> referenceId = const Value.absent(),
            Value<TimeSlotType> type = const Value.absent(),
            Value<DaysOfTheWeek> endingDay = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
          }) =>
              TimeslotTableCompanion(
            id: id,
            referenceId: referenceId,
            type: type,
            endingDay: endingDay,
            startDate: startDate,
            endDate: endDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int referenceId,
            required TimeSlotType type,
            required DaysOfTheWeek endingDay,
            Value<DateTime?> startDate = const Value.absent(),
            required DateTime endDate,
          }) =>
              TimeslotTableCompanion.insert(
            id: id,
            referenceId: referenceId,
            type: type,
            endingDay: endingDay,
            startDate: startDate,
            endDate: endDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TimeslotTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TimeslotTableTable,
    TimeslotTableData,
    $$TimeslotTableTableFilterComposer,
    $$TimeslotTableTableOrderingComposer,
    $$TimeslotTableTableAnnotationComposer,
    $$TimeslotTableTableCreateCompanionBuilder,
    $$TimeslotTableTableUpdateCompanionBuilder,
    (
      TimeslotTableData,
      BaseReferences<_$AppDatabase, $TimeslotTableTable, TimeslotTableData>
    ),
    TimeslotTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);
  $$GradeScaleTableTableTableManager get gradeScaleTable =>
      $$GradeScaleTableTableTableManager(_db, _db.gradeScaleTable);
  $$GradedComponentTableTableTableManager get gradedComponentTable =>
      $$GradedComponentTableTableTableManager(_db, _db.gradedComponentTable);
  $$CourseTableTableTableManager get courseTable =>
      $$CourseTableTableTableManager(_db, _db.courseTable);
  $$AssessmentTableTableTableManager get assessmentTable =>
      $$AssessmentTableTableTableManager(_db, _db.assessmentTable);
  $$EventTableTableTableManager get eventTable =>
      $$EventTableTableTableManager(_db, _db.eventTable);
  $$TimeslotTableTableTableManager get timeslotTable =>
      $$TimeslotTableTableTableManager(_db, _db.timeslotTable);
}
