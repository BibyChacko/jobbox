import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/models/document_model.dart';
import 'package:job_box/src/core/common/widgets/info_container_view.dart';
import 'package:job_box/src/core/common/widgets/profile_pic_widget.dart';
import 'package:job_box/src/core/constants/strings.dart';
import 'package:job_box/src/core/theme/text_theme.dart';
import 'package:job_box/src/features/authentication/data/models/user_model.dart';
import 'package:job_box/src/features/jobs/presentation/job_application_process/widgets/document_list_item_view.dart';

import '../../../../../core/common/models/content_permission_types.dart';
import '../../../data/models/job_application_step_types.dart';

class ReviewInformationView extends StatelessWidget {
  final UserModel userModel;
  final Function(int) navigateToStep;
  const ReviewInformationView(
      {Key? key, required this.userModel, required this.navigateToStep})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Center(
              child: ProfilePicWidget(
            profilePicUrl: userModel.profilePicUrl,
            permission: ContentPermissionTypes.edit, onProfilePicAdded: (file ) {
              // Implement logic and upload to server
              },
          )),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.contactInfo,
                style: AppTextTheme.heading4,
              ),
              IconButton(
                  onPressed: () {
                    navigateToStep(JobApplication.employmentInformation.index);
                  },
                  icon: const Icon(Icons.edit)),
            ],
          ),
          InfoContainerView(title: Strings.fullName, value: userModel.name),
          const SizedBox(
            height: 8,
          ),
          InfoContainerView(title: Strings.email, value: userModel.email),
          const SizedBox(
            height: 8,
          ),
          InfoContainerView(
              title: Strings.mobileNumber, value: userModel.mobileNo),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.employmentInformation,
                style: AppTextTheme.heading4,
              ),
              IconButton(
                  onPressed: () {
                    navigateToStep(JobApplication.uploadDocument.index);
                  },
                  icon: const Icon(Icons.edit)),
            ],
          ),
          Text(
            Strings.resume,
            style: AppTextTheme.bodyLightStyle.copyWith(fontSize: 14),
          ),
          DocumentListItemView(
            documentModel: DocumentModel(
              fileName: 'My Cv.pdf',
              filePath: '',
              uploadDate: DateTime(2013, 12, 14),
              documentType: DocumentType.resume,
              fileLocation: FileLocation.network,
            ),
            isSelected: false,
            onSelected: () {},
            readOnly: true,
            padding: EdgeInsets.zero,
          ),
          Text(
            Strings.coverLetter,
            style: AppTextTheme.bodyLightStyle.copyWith(fontSize: 14),
          ),
          DocumentListItemView(
            documentModel: DocumentModel(
              fileName: 'My Cv.pdf',
              filePath: '',
              uploadDate: DateTime(2013, 12, 14),
              documentType: DocumentType.resume,
              fileLocation: FileLocation.network,
            ),
            isSelected: false,
            onSelected: () {},
            readOnly: true,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
