// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalaryModelImpl _$$SalaryModelImplFromJson(Map<String, dynamic> json) =>
    _$SalaryModelImpl(
      minSalary: (json['minSalary'] as num).toDouble(),
      maxSalary: (json['maxSalary'] as num).toDouble(),
      currency: json['currency'] as String? ?? "\$",
      negotiable: json['negotiable'] as bool? ?? false,
      salaryTerm:
          $enumDecodeNullable(_$SalaryTermEnumMap, json['salaryTerm']) ??
              SalaryTerm.month,
    );

Map<String, dynamic> _$$SalaryModelImplToJson(_$SalaryModelImpl instance) =>
    <String, dynamic>{
      'minSalary': instance.minSalary,
      'maxSalary': instance.maxSalary,
      'currency': instance.currency,
      'negotiable': instance.negotiable,
      'salaryTerm': _$SalaryTermEnumMap[instance.salaryTerm],
    };

const _$SalaryTermEnumMap = {
  SalaryTerm.month: 'month',
  SalaryTerm.year: 'year',
};
