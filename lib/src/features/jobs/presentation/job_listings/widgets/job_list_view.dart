import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/models/content_permission_types.dart';
import 'package:job_box/src/core/constants/strings.dart';
import 'package:job_box/src/core/theme/text_theme.dart';
import 'package:job_box/src/features/jobs/data/models/job_model.dart';
import 'package:job_box/src/features/jobs/presentation/job_listings/widgets/job_list_tile.dart';

class JobListView extends StatelessWidget {
  final List<JobModel> jobs;
  final ContentPermissionTypes contentPermission;
  const JobListView(
      {Key? key,
      required this.jobs,
      this.contentPermission = ContentPermissionTypes.edit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return jobs.isNotEmpty
        ? ListView.separated(
            itemBuilder: (_, index) => JobListTile(
                jobModel: jobs[index], contentPermission: contentPermission),
            separatorBuilder: (_, __) => const SizedBox(
                  height: 8,
                ),
            itemCount: jobs.length)
        :  Center(child: Column(
      mainAxisSize: MainAxisSize.min,
          children: [
            const Text(Strings.noJobsFound,),
            Text(Strings.clearFilters,style: AppTextTheme.heading5.copyWith(fontSize: 9),)
          ],
        ));
  }
}
