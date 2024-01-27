import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/widgets/app_textform_field.dart';
import 'package:job_box/src/core/theme/app_theme.dart';
import 'package:job_box/src/core/theme/text_theme.dart';
import 'package:job_box/src/core/validators/form_validators.dart';

import '../../../../../core/constants/strings.dart';

class EmploymentInformationView extends StatefulWidget {
  final Function(List<String>) onSkillsAdded;
  final GlobalKey<FormState> educationFormKey;
  final List<String> skills;

  const EmploymentInformationView({
    Key? key,
    required this.onSkillsAdded,
    required this.educationFormKey,
    required this.skills,
  }) : super(key: key);

  @override
  State<EmploymentInformationView> createState() =>
      _EmploymentInformationViewState();
}

class _EmploymentInformationViewState extends State<EmploymentInformationView> {
  bool isEducationAddedInResume = false;
  bool isWorkExperienceAddedInResume = false;

  final TextEditingController _nameOfSchoolController = TextEditingController();
  final TextEditingController _courseOfStudySchoolController =
      TextEditingController();
  final TextEditingController _yearOfGraduationController =
      TextEditingController();
  final TextEditingController _skillsFieldController = TextEditingController();

  List skills = [];

  @override
  void initState() {
    skills.addAll(widget.skills);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              Strings.education,
              style: AppTextTheme.heading4,
            ),
            subtitle: Text(
              Strings.includeInResume,
              style: AppTextTheme.bodySmallStyle,
            ),
            trailing: Switch(
                value: isEducationAddedInResume,
                onChanged: (value) {
                  setState(() {
                    isEducationAddedInResume = value;
                  });
                }),
          ),
          Form(
              key: widget.educationFormKey,
              child: Column(
                children: [
                  AppTextFormField(
                    label: Strings.nameOfSchool,
                    textEditingController: _nameOfSchoolController,
                    hint: Strings.schoolHint,
                    validator: (value) {
                      return FormValidators.isNullOrEmpty(value);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFormField(
                    label: Strings.courseOfStudyHint,
                    textEditingController: _courseOfStudySchoolController,
                    hint: Strings.courseOfStudyHint,
                    validator: (value) {
                      return FormValidators.isNullOrEmpty(value);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFormField(
                    label: Strings.yearGraduated,
                    textEditingController: _yearOfGraduationController,
                    hint: Strings.yearGraduatedHint,
                    validator: (value) {
                      return FormValidators.isNullOrEmpty(value);
                    },
                  ),
                ],
              )),
          const SizedBox(
            height: 24,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              Strings.workExperience,
              style: AppTextTheme.heading4,
            ),
            subtitle: Text(
              Strings.includeInResume,
              style: AppTextTheme.bodySmallStyle,
            ),
            trailing: Switch(
                value: isWorkExperienceAddedInResume,
                onChanged: (value) {
                  setState(() {
                    isWorkExperienceAddedInResume = value;
                  });
                }),
          ),
          Text(
            Strings.additionalSkills,
            style: AppTextTheme.heading4,
          ),
          AppTextFormField(
            label: "",
            textEditingController: _skillsFieldController,
            hint: "Enter skills",
            validator: (value) {
              return FormValidators.isNullOrEmpty(value);
            },
            suffix: GestureDetector(
                onTap: () {
                  String newSkill = _skillsFieldController.text.trim();
                  if(newSkill.isEmpty){
                    return;
                  }
                  FocusScope.of(context).unfocus();
                  _skillsFieldController.clear();
                  widget.onSkillsAdded([newSkill]);
                  setState(() {
                    skills.add(newSkill);
                  });
                },
                child: const Icon(
                  Icons.add,
                  color: AppTheme.primaryColor,
                )),
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: widget.skills
                .map((skill) => Chip(
                    backgroundColor: AppTheme.textColorSecondary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    side: const BorderSide(color: AppTheme.textColorSecondary),
                    label: Text(
                      skill,
                      style:
                          AppTextTheme.bodyStyle.copyWith(color: Colors.white),
                    )))
                .toList(),
          )
        ],
      ),
    );
  }
}
