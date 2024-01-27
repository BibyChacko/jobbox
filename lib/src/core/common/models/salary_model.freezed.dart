// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalaryModel _$SalaryModelFromJson(Map<String, dynamic> json) {
  return _SalaryModel.fromJson(json);
}

/// @nodoc
mixin _$SalaryModel {
  double get minSalary => throw _privateConstructorUsedError;
  double get maxSalary => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  bool? get negotiable => throw _privateConstructorUsedError;
  SalaryTerm? get salaryTerm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalaryModelCopyWith<SalaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryModelCopyWith<$Res> {
  factory $SalaryModelCopyWith(
          SalaryModel value, $Res Function(SalaryModel) then) =
      _$SalaryModelCopyWithImpl<$Res, SalaryModel>;
  @useResult
  $Res call(
      {double minSalary,
      double maxSalary,
      String? currency,
      bool? negotiable,
      SalaryTerm? salaryTerm});
}

/// @nodoc
class _$SalaryModelCopyWithImpl<$Res, $Val extends SalaryModel>
    implements $SalaryModelCopyWith<$Res> {
  _$SalaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minSalary = null,
    Object? maxSalary = null,
    Object? currency = freezed,
    Object? negotiable = freezed,
    Object? salaryTerm = freezed,
  }) {
    return _then(_value.copyWith(
      minSalary: null == minSalary
          ? _value.minSalary
          : minSalary // ignore: cast_nullable_to_non_nullable
              as double,
      maxSalary: null == maxSalary
          ? _value.maxSalary
          : maxSalary // ignore: cast_nullable_to_non_nullable
              as double,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      negotiable: freezed == negotiable
          ? _value.negotiable
          : negotiable // ignore: cast_nullable_to_non_nullable
              as bool?,
      salaryTerm: freezed == salaryTerm
          ? _value.salaryTerm
          : salaryTerm // ignore: cast_nullable_to_non_nullable
              as SalaryTerm?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalaryModelImplCopyWith<$Res>
    implements $SalaryModelCopyWith<$Res> {
  factory _$$SalaryModelImplCopyWith(
          _$SalaryModelImpl value, $Res Function(_$SalaryModelImpl) then) =
      __$$SalaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double minSalary,
      double maxSalary,
      String? currency,
      bool? negotiable,
      SalaryTerm? salaryTerm});
}

/// @nodoc
class __$$SalaryModelImplCopyWithImpl<$Res>
    extends _$SalaryModelCopyWithImpl<$Res, _$SalaryModelImpl>
    implements _$$SalaryModelImplCopyWith<$Res> {
  __$$SalaryModelImplCopyWithImpl(
      _$SalaryModelImpl _value, $Res Function(_$SalaryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minSalary = null,
    Object? maxSalary = null,
    Object? currency = freezed,
    Object? negotiable = freezed,
    Object? salaryTerm = freezed,
  }) {
    return _then(_$SalaryModelImpl(
      minSalary: null == minSalary
          ? _value.minSalary
          : minSalary // ignore: cast_nullable_to_non_nullable
              as double,
      maxSalary: null == maxSalary
          ? _value.maxSalary
          : maxSalary // ignore: cast_nullable_to_non_nullable
              as double,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      negotiable: freezed == negotiable
          ? _value.negotiable
          : negotiable // ignore: cast_nullable_to_non_nullable
              as bool?,
      salaryTerm: freezed == salaryTerm
          ? _value.salaryTerm
          : salaryTerm // ignore: cast_nullable_to_non_nullable
              as SalaryTerm?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalaryModelImpl implements _SalaryModel {
  const _$SalaryModelImpl(
      {required this.minSalary,
      required this.maxSalary,
      this.currency = "\$",
      this.negotiable = false,
      this.salaryTerm = SalaryTerm.month});

  factory _$SalaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalaryModelImplFromJson(json);

  @override
  final double minSalary;
  @override
  final double maxSalary;
  @override
  @JsonKey()
  final String? currency;
  @override
  @JsonKey()
  final bool? negotiable;
  @override
  @JsonKey()
  final SalaryTerm? salaryTerm;

  @override
  String toString() {
    return 'SalaryModel(minSalary: $minSalary, maxSalary: $maxSalary, currency: $currency, negotiable: $negotiable, salaryTerm: $salaryTerm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalaryModelImpl &&
            (identical(other.minSalary, minSalary) ||
                other.minSalary == minSalary) &&
            (identical(other.maxSalary, maxSalary) ||
                other.maxSalary == maxSalary) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.negotiable, negotiable) ||
                other.negotiable == negotiable) &&
            (identical(other.salaryTerm, salaryTerm) ||
                other.salaryTerm == salaryTerm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, minSalary, maxSalary, currency, negotiable, salaryTerm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalaryModelImplCopyWith<_$SalaryModelImpl> get copyWith =>
      __$$SalaryModelImplCopyWithImpl<_$SalaryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalaryModelImplToJson(
      this,
    );
  }
}

abstract class _SalaryModel implements SalaryModel {
  const factory _SalaryModel(
      {required final double minSalary,
      required final double maxSalary,
      final String? currency,
      final bool? negotiable,
      final SalaryTerm? salaryTerm}) = _$SalaryModelImpl;

  factory _SalaryModel.fromJson(Map<String, dynamic> json) =
      _$SalaryModelImpl.fromJson;

  @override
  double get minSalary;
  @override
  double get maxSalary;
  @override
  String? get currency;
  @override
  bool? get negotiable;
  @override
  SalaryTerm? get salaryTerm;
  @override
  @JsonKey(ignore: true)
  _$$SalaryModelImplCopyWith<_$SalaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
