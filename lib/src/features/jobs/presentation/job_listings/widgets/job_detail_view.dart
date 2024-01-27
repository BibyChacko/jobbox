import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/models/content_permission_types.dart';
import 'package:job_box/src/core/common/widgets/app_button.dart';
import 'package:job_box/src/core/common/widgets/app_image.dart';
import 'package:job_box/src/core/theme/app_theme.dart';
import 'package:job_box/src/features/jobs/data/models/job_model.dart';
import 'package:job_box/src/features/jobs/presentation/job_application_process/pages/job_application_page.dart';

import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/theme/text_theme.dart';

class JobDetailView extends StatefulWidget {
  final JobModel job;
  final ContentPermissionTypes contentPermission;
  const JobDetailView(
      {Key? key,
      required this.job,
      this.contentPermission = ContentPermissionTypes.edit})
      : super(key: key);

  @override
  State<JobDetailView> createState() => _JobDetailViewState();
}

class _JobDetailViewState extends State<JobDetailView> {
  bool isJobBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [

                      const SizedBox(
                        height: 12,
                      ),
                      AppImage.network(widget.job.companyModel.companyLogo),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        widget.job.companyModel.companyName,
                        style: AppTextTheme.title
                            .copyWith(color: AppTheme.primaryColor),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.job.jobRole,
                        style: AppTextTheme.heading4,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.job.location,
                        style: AppTextTheme.bodyStyle
                            .copyWith(color: AppTheme.textColorSecondary),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.jobDescription,
                        style: AppTextTheme.heading5,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(widget.job.jobDescription),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        Strings.requirements,
                        style: AppTextTheme.heading5,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(widget.job
                          .requirements), //  TODO: Check if we can make requirement as a list of html document
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          if (widget.contentPermission == ContentPermissionTypes.edit)
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: AppButton(
                        buttonText: Strings.applyThisJob,
                        width: MediaQuery.of(context).size.width,
                        height: 44,
                        onPressed: () {
                          _applyForJob(context);
                        }),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.primary30TintColor,
                        borderRadius: BorderRadius.circular(appBorderRadius)),
                    padding: EdgeInsets.zero,
                    child: IconButton(
                        onPressed: () {
                          _bookmarkJob(context);
                        },
                        icon: Icon(
                          isJobBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_outline,
                          color: AppTheme.primaryColor,
                        )),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }

  _applyForJob(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => JobApplicationPage(job: widget.job, onJobApplied: (result ) {
          // Write any extra functionality if required
        },)));
  }

  _bookmarkJob(BuildContext context) {
    // TODO: Extend the functionality
    setState(() {
      isJobBookmarked = !isJobBookmarked;
    });
  }
}
