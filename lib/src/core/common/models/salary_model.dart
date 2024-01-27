import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_box/src/core/helpers/number_formatter.dart';

part 'salary_model.freezed.dart';
part 'salary_model.g.dart';

@freezed
class SalaryModel with _$SalaryModel {
  const factory SalaryModel({
    required double minSalary,
    required double maxSalary,
    @Default("\$") String? currency,
    @Default(false) bool? negotiable,
    @Default(SalaryTerm.month) SalaryTerm? salaryTerm,
  }) = _SalaryModel;
  factory SalaryModel.fromJson(Map<String, dynamic> json) =>
      _$SalaryModelFromJson(json);
}

extension SalaryModelStringExtension on SalaryModel {
  String getFormattedSalary() {
    return "$currency${NumberFormatter.formatNumber(minSalary)}-${NumberFormatter.formatNumber(maxSalary)}/${salaryTerm?.name}";
  }
}

enum SalaryTerm { month, year }
