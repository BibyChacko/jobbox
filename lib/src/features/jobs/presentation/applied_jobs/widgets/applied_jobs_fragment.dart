import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/models/content_permission_types.dart';
import 'package:job_box/src/features/jobs/data/models/job_model.dart';
import 'package:job_box/src/features/jobs/presentation/job_listings/widgets/job_list_view.dart';

import '../../../../../core/common/models/company_model.dart';
import '../../../../../core/common/models/salary_model.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/theme/text_theme.dart';

class AppliedJobsFragment extends StatefulWidget {
  const AppliedJobsFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<AppliedJobsFragment> createState() => _AppliedJobsFragmentState();
}

class _AppliedJobsFragmentState extends State<AppliedJobsFragment> {
  List<JobModel> appliedJobs = [];

  @override
  void initState() {
    appliedJobs.add(JobModel(
        jobRole: "Senior Product Designer",
        jobDescription: Strings.sampleJD,
        requirements: Strings.sampleReq,
        companyModel: const CompanyModel(
            companyName: "SLACK",
            companyLogo:
                "https://assets.stickpng.com/images/5cb480cd5f1b6d3fbadece79.png"),
        jobPostedOn: DateTime(2024, 01, 20),
        salaryModel: const SalaryModel(minSalary: 6000, maxSalary: 8000),
        location: "East, Singapore"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24,),
          Row(
            children: [
              Text(Strings.yourAppliedJobs,style: AppTextTheme.fancyTextStyle,),
              const Icon(Icons.edit,size: 28,)
            ],
          ),
          const SizedBox(height: 60,),
          Expanded(
            child: JobListView(
              jobs: appliedJobs,
              contentPermission: ContentPermissionTypes.view,
            ),
          ),
        ],
      ),
    );
  }
}
