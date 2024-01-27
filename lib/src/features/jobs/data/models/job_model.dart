import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_box/src/core/common/models/company_model.dart';
import 'package:job_box/src/core/common/models/salary_model.dart';

part 'job_model.freezed.dart';

part 'job_model.g.dart';

@freezed
class JobModel with _$JobModel {
  const factory JobModel(
      {required String jobRole,
      required String jobDescription,
      required String requirements,
      required CompanyModel companyModel,
      required DateTime jobPostedOn,
      required SalaryModel salaryModel,
      required String location}) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
}
