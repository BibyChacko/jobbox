// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobModel _$JobModelFromJson(Map<String, dynamic> json) {
  return _JobModel.fromJson(json);
}

/// @nodoc
mixin _$JobModel {
  String get jobRole => throw _privateConstructorUsedError;
  String get jobDescription => throw _privateConstructorUsedError;
  String get requirements => throw _privateConstructorUsedError;
  CompanyModel get companyModel => throw _privateConstructorUsedError;
  DateTime get jobPostedOn => throw _privateConstructorUsedError;
  SalaryModel get salaryModel => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobModelCopyWith<JobModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobModelCopyWith<$Res> {
  factory $JobModelCopyWith(JobModel value, $Res Function(JobModel) then) =
      _$JobModelCopyWithImpl<$Res, JobModel>;
  @useResult
  $Res call(
      {String jobRole,
      String jobDescription,
      String requirements,
      CompanyModel companyModel,
      DateTime jobPostedOn,
      SalaryModel salaryModel,
      String location});

  $CompanyModelCopyWith<$Res> get companyModel;
  $SalaryModelCopyWith<$Res> get salaryModel;
}

/// @nodoc
class _$JobModelCopyWithImpl<$Res, $Val extends JobModel>
    implements $JobModelCopyWith<$Res> {
  _$JobModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobRole = null,
    Object? jobDescription = null,
    Object? requirements = null,
    Object? companyModel = null,
    Object? jobPostedOn = null,
    Object? salaryModel = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      jobRole: null == jobRole
          ? _value.jobRole
          : jobRole // ignore: cast_nullable_to_non_nullable
              as String,
      jobDescription: null == jobDescription
          ? _value.jobDescription
          : jobDescription // ignore: cast_nullable_to_non_nullable
              as String,
      requirements: null == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as String,
      companyModel: null == companyModel
          ? _value.companyModel
          : companyModel // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      jobPostedOn: null == jobPostedOn
          ? _value.jobPostedOn
          : jobPostedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      salaryModel: null == salaryModel
          ? _value.salaryModel
          : salaryModel // ignore: cast_nullable_to_non_nullable
              as SalaryModel,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompanyModelCopyWith<$Res> get companyModel {
    return $CompanyModelCopyWith<$Res>(_value.companyModel, (value) {
      return _then(_value.copyWith(companyModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalaryModelCopyWith<$Res> get salaryModel {
    return $SalaryModelCopyWith<$Res>(_value.salaryModel, (value) {
      return _then(_value.copyWith(salaryModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JobModelImplCopyWith<$Res>
    implements $JobModelCopyWith<$Res> {
  factory _$$JobModelImplCopyWith(
          _$JobModelImpl value, $Res Function(_$JobModelImpl) then) =
      __$$JobModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String jobRole,
      String jobDescription,
      String requirements,
      CompanyModel companyModel,
      DateTime jobPostedOn,
      SalaryModel salaryModel,
      String location});

  @override
  $CompanyModelCopyWith<$Res> get companyModel;
  @override
  $SalaryModelCopyWith<$Res> get salaryModel;
}

/// @nodoc
class __$$JobModelImplCopyWithImpl<$Res>
    extends _$JobModelCopyWithImpl<$Res, _$JobModelImpl>
    implements _$$JobModelImplCopyWith<$Res> {
  __$$JobModelImplCopyWithImpl(
      _$JobModelImpl _value, $Res Function(_$JobModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobRole = null,
    Object? jobDescription = null,
    Object? requirements = null,
    Object? companyModel = null,
    Object? jobPostedOn = null,
    Object? salaryModel = null,
    Object? location = null,
  }) {
    return _then(_$JobModelImpl(
      jobRole: null == jobRole
          ? _value.jobRole
          : jobRole // ignore: cast_nullable_to_non_nullable
              as String,
      jobDescription: null == jobDescription
          ? _value.jobDescription
          : jobDescription // ignore: cast_nullable_to_non_nullable
              as String,
      requirements: null == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as String,
      companyModel: null == companyModel
          ? _value.companyModel
          : companyModel // ignore: cast_nullable_to_non_nullable
              as CompanyModel,
      jobPostedOn: null == jobPostedOn
          ? _value.jobPostedOn
          : jobPostedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      salaryModel: null == salaryModel
          ? _value.salaryModel
          : salaryModel // ignore: cast_nullable_to_non_nullable
              as SalaryModel,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobModelImpl implements _JobModel {
  const _$JobModelImpl(
      {required this.jobRole,
      required this.jobDescription,
      required this.requirements,
      required this.companyModel,
      required this.jobPostedOn,
      required this.salaryModel,
      required this.location});

  factory _$JobModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobModelImplFromJson(json);

  @override
  final String jobRole;
  @override
  final String jobDescription;
  @override
  final String requirements;
  @override
  final CompanyModel companyModel;
  @override
  final DateTime jobPostedOn;
  @override
  final SalaryModel salaryModel;
  @override
  final String location;

  @override
  String toString() {
    return 'JobModel(jobRole: $jobRole, jobDescription: $jobDescription, requirements: $requirements, companyModel: $companyModel, jobPostedOn: $jobPostedOn, salaryModel: $salaryModel, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobModelImpl &&
            (identical(other.jobRole, jobRole) || other.jobRole == jobRole) &&
            (identical(other.jobDescription, jobDescription) ||
                other.jobDescription == jobDescription) &&
            (identical(other.requirements, requirements) ||
                other.requirements == requirements) &&
            (identical(other.companyModel, companyModel) ||
                other.companyModel == companyModel) &&
            (identical(other.jobPostedOn, jobPostedOn) ||
                other.jobPostedOn == jobPostedOn) &&
            (identical(other.salaryModel, salaryModel) ||
                other.salaryModel == salaryModel) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, jobRole, jobDescription,
      requirements, companyModel, jobPostedOn, salaryModel, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobModelImplCopyWith<_$JobModelImpl> get copyWith =>
      __$$JobModelImplCopyWithImpl<_$JobModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobModelImplToJson(
      this,
    );
  }
}

abstract class _JobModel implements JobModel {
  const factory _JobModel(
      {required final String jobRole,
      required final String jobDescription,
      required final String requirements,
      required final CompanyModel companyModel,
      required final DateTime jobPostedOn,
      required final SalaryModel salaryModel,
      required final String location}) = _$JobModelImpl;

  factory _JobModel.fromJson(Map<String, dynamic> json) =
      _$JobModelImpl.fromJson;

  @override
  String get jobRole;
  @override
  String get jobDescription;
  @override
  String get requirements;
  @override
  CompanyModel get companyModel;
  @override
  DateTime get jobPostedOn;
  @override
  SalaryModel get salaryModel;
  @override
  String get location;
  @override
  @JsonKey(ignore: true)
  _$$JobModelImplCopyWith<_$JobModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
