import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/widgets/app_button.dart';
import 'package:job_box/src/core/theme/text_theme.dart';
import 'package:job_box/src/features/authentication/data/models/user_model.dart';
import 'package:job_box/src/features/jobs/presentation/job_application_process/widgets/review_information_view.dart';

import '../../../../core/constants/strings.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Text(
                  Strings.yourProfile,
                  style: AppTextTheme.fancyTextStyle,
                ),
                const Icon(
                  Icons.person,
                  size: 28,
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            ReviewInformationView(
                userModel: userModel,
                navigateToStep: (index) => _editDetails(context, index)),
            const SizedBox(height: 20,),
            Center(
              child: AppButton(
                  buttonText: Strings.logOut,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  _editDetails(BuildContext context, int index) {}
}

const UserModel userModel = UserModel(
    name: "Adrian Severin",
    email: "adrianseverin@gmail.com",
    mobileNo: "+6594717281",
    profilePicUrl: "");
