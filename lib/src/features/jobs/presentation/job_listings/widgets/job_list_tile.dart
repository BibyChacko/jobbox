import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/models/content_permission_types.dart';
import 'package:job_box/src/core/common/models/salary_model.dart';
import 'package:job_box/src/core/helpers/date_formatter.dart';
import 'package:job_box/src/core/theme/app_theme.dart';
import 'package:job_box/src/core/theme/text_theme.dart';
import 'package:job_box/src/features/jobs/data/models/job_model.dart';
import 'package:job_box/src/features/jobs/presentation/job_listings/widgets/job_detail_view.dart';

class JobListTile extends StatelessWidget {
  final JobModel jobModel;

  final ContentPermissionTypes contentPermission;
  const JobListTile(
      {Key? key,
      required this.jobModel,
      this.contentPermission = ContentPermissionTypes.edit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showJobDetailModalSheet(context, jobModel);
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    jobModel.companyModel.companyName,
                    style: AppTextTheme.title
                        .copyWith(color: AppTheme.primaryColor),
                  ),
                  Text(DateFormatter.formatDate(jobModel.jobPostedOn))
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                jobModel.jobRole,
                style: AppTextTheme.heading4,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Icon(Icons.monetization_on_outlined),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    jobModel.salaryModel.getFormattedSalary(),
                    style: AppTextTheme.bodyStyle
                        .copyWith(color: AppTheme.textColorSecondary),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    jobModel.location,
                    style: AppTextTheme.bodyStyle
                        .copyWith(color: AppTheme.textColorSecondary),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showJobDetailModalSheet(BuildContext context, JobModel jobModel) {
    showModalBottomSheet(
        scrollControlDisabledMaxHeightRatio: 8/16,
        showDragHandle: true,
        enableDrag: true,
        context: context,
        builder: (context) {
          return JobDetailView(
              job: jobModel, contentPermission: contentPermission);
        });
  }
}
