import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/models/result_type.dart';
import 'package:job_box/src/core/common/widgets/app_button.dart';
import 'package:job_box/src/core/common/widgets/jobbox_app_bar.dart';
import 'package:job_box/src/core/constants/strings.dart';
import 'package:job_box/src/core/helpers/dialog_helper.dart';
import 'package:job_box/src/core/theme/app_theme.dart';
import 'package:job_box/src/core/theme/text_theme.dart';
import 'package:job_box/src/features/authentication/data/models/user_model.dart';
import 'package:job_box/src/features/jobs/data/models/job_model.dart';
import '../widgets/employment_information_view.dart';
import '../widgets/review_information_view.dart';
import '../widgets/upload_documents_view.dart';

class JobApplicationPage extends StatefulWidget {
  final JobModel job;
  final Function(ResultType) onJobApplied;
  const JobApplicationPage(
      {Key? key, required this.job, required this.onJobApplied})
      : super(key: key);

  @override
  State<JobApplicationPage> createState() => _JobApplicationPageState();
}

const UserModel userModel = UserModel(
    name: "Adrian Severin",
    email: "adrianseverin@gmail.com",
    mobileNo: "+6594717281",
    profilePicUrl: "");

class _JobApplicationPageState extends State<JobApplicationPage> {
  final List<String> stepTitles = [
    Strings.uploadingDocuments,
    Strings.employmentInformation,
    Strings.reviewInformation
  ];

  List<Widget> stepFragments = [];

  int stepNo = 0;

  bool isLastStep() {
    return stepNo == stepFragments.length - 1;
  }

  final GlobalKey<FormState> _educationFormKey = GlobalKey();
  final List<String> skills = [];


  @override
  void initState() {
    stepFragments = [
      const UploadDocumentView(),
      EmploymentInformationView(
        onSkillsAdded: (skillSet) {
          skills.addAll(skillSet.toSet().toList());
        },
        educationFormKey: _educationFormKey, skills: skills,
      ),
      ReviewInformationView(
        userModel: userModel,
        navigateToStep: (step) {
          changeStepValue(step);
        },
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (result) {
        if (!result) {
          _abortApplicationDialog(context);
          return;
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: JobBoxAppBar(
            leadingType: AppbarLeadingType.close,
            action: () {
              _abortApplicationDialog(context);
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${Strings.applyTo} ${widget.job.companyModel.companyName}",
                      style: AppTextTheme.fancyTextStyle,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stepTitles[stepNo],
                          style: AppTextTheme.bodyLightStyle
                              .copyWith(color: AppTheme.primaryColor),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        LinearProgressIndicator(
                          value: (stepNo + 1) / (stepFragments.length),
                          backgroundColor: AppTheme.primary30TintColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height - 220,
                            child: stepFragments[stepNo])
                      ],
                    )
                  ],
                ),
                AppButton(
                    width: MediaQuery.of(context).size.width,
                    buttonText: isLastStep()
                        ? Strings.globalSubmit
                        : Strings.globalProceed,
                    onPressed: () {
                      isLastStep() ? _applyJob(context) : _proceedToNextStep();
                    }),
              ],
            ),
          ),
        )),
      ),
    );
  }

  _proceedToNextStep() {
    if ((stepNo + 1) == 2) {
      if (!(_educationFormKey.currentState?.validate() ?? false)) {
        return;
      }
      if (skills.isEmpty) {
        DialogHelper.showToast(Strings.skillSetMandatory);
        return;
      }
    }
    setState(() {
      stepNo += 1;
    });
  }

  _applyJob(BuildContext context) {
    widget.onJobApplied(ResultType.success); // TODO: Change hardcoded status
    Navigator.pop(context);
  }

  _abortApplicationDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (bContext) => AlertDialog(
              title: Center(
                child: Text(
                  Strings.exitJobApplying,
                  style: AppTextTheme.heading3,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    Strings.exitJobBody,
                    style: AppTextTheme.bodyLightStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppButton(
                          width: 80,
                          buttonText: Strings.globalCancel,
                          backgroundColor: Colors.white,
                          foregroundColor: AppTheme.primaryColor,
                          onPressed: () {
                            Navigator.pop(bContext);
                          }),
                      AppButton(
                          width: 80,
                          buttonText: Strings.globalQuit,
                          onPressed: () {
                            Navigator.pop(bContext);
                            Navigator.pop(context);
                          }),
                    ],
                  )
                ],
              ),
            ));
  }

  void changeStepValue(int step) {
    setState(() {
      stepNo = step;
    });
  }
}
