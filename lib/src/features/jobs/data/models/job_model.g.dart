// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobModelImpl _$$JobModelImplFromJson(Map<String, dynamic> json) =>
    _$JobModelImpl(
      jobRole: json['jobRole'] as String,
      jobDescription: json['jobDescription'] as String,
      requirements: json['requirements'] as String,
      companyModel:
          CompanyModel.fromJson(json['companyModel'] as Map<String, dynamic>),
      jobPostedOn: DateTime.parse(json['jobPostedOn'] as String),
      salaryModel:
          SalaryModel.fromJson(json['salaryModel'] as Map<String, dynamic>),
      location: json['location'] as String,
    );

Map<String, dynamic> _$$JobModelImplToJson(_$JobModelImpl instance) =>
    <String, dynamic>{
      'jobRole': instance.jobRole,
      'jobDescription': instance.jobDescription,
      'requirements': instance.requirements,
      'companyModel': instance.companyModel,
      'jobPostedOn': instance.jobPostedOn.toIso8601String(),
      'salaryModel': instance.salaryModel,
      'location': instance.location,
    };
