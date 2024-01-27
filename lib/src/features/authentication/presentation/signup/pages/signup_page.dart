import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/models/content_permission_types.dart';
import 'package:job_box/src/core/common/widgets/app_button.dart';
import 'package:job_box/src/core/common/widgets/app_textform_field.dart';
import 'package:job_box/src/core/common/widgets/jobbox_app_bar.dart';
import 'package:job_box/src/core/common/widgets/profile_pic_widget.dart';
import 'package:job_box/src/core/constants/strings.dart';
import 'package:job_box/src/core/theme/app_theme.dart';
import 'package:job_box/src/core/theme/text_theme.dart';
import 'package:job_box/src/core/validators/form_validators.dart';
import 'package:job_box/src/features/dashboard_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _registerForm = GlobalKey();
  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: JobBoxAppBar(
            title: Strings.signUp,
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                    key: _registerForm,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        ProfilePicWidget(
                          profilePicUrl: "",
                          permission: ContentPermissionTypes.edit,
                          onProfilePicAdded: (file) {
                            // Upload to server
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        AppTextFormField(
                          label: Strings.name,
                          hint: Strings.nameHint,
                          textEditingController: _nameController,
                          validator: (value) {
                            return FormValidators.isNullOrEmpty(value,
                                label: Strings.name);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppTextFormField(
                          label: Strings.email,
                          hint: Strings.emailHint,
                          textEditingController: _emailController,
                          validator: (value) {
                            return FormValidators.isValidEmail(value);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppTextFormField(
                          label: Strings.password,
                          hint: "••••••••",
                          textEditingController: _passwordController,
                          isObscure: !showPassword,
                          suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            child: showPassword
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined),
                          ),
                          validator: (value) {
                            return FormValidators.isValidPassword(value);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppTextFormField(
                          label: Strings.reTypePassword,
                          hint: "••••••••",
                          isObscure: !showConfirmPassword,
                          suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                showConfirmPassword = !showConfirmPassword;
                              });
                            },
                            child: showConfirmPassword
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined),
                          ),
                          textEditingController: _confirmPasswordController,
                          validator: (value) {
                            String? error =
                                FormValidators.isValidPassword(value);
                            if (error != null) {
                              return error;
                            }
                            if (value != _passwordController.text) {
                              return "Passwords should match";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: AppButton(
                              width: MediaQuery.of(context).size.width,
                              buttonText: Strings.createAccount,
                              onPressed: () {
                                if (!(_registerForm.currentState?.validate() ??
                                    false)) {
                                  return;
                                }
                                _signUpUser(context);
                              }),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () => _navigateToLogin(context),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: Strings.alreadyHaveAccount,
                                style: AppTextTheme.bodyStyle),
                            const TextSpan(text: "  "),
                            TextSpan(
                                text: Strings.login,
                                style: AppTextTheme.bodyStyle.copyWith(
                                  color: AppTheme.primaryColor,
                                ))
                          ])),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 200,
                      child: GestureDetector(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: Strings.termsAndConditionText,
                                  style: AppTextTheme.bodySmallStyle),
                              const TextSpan(text: "  "),
                              TextSpan(
                                  text: Strings.globalTermsOfUse,
                                  style: AppTextTheme.bodySmallStyle.copyWith(
                                    color: AppTheme.primaryColor,
                                  )),
                              const TextSpan(text: "  "),
                              TextSpan(
                                  text: Strings.globalAnd,
                                  style: AppTextTheme.bodySmallStyle),
                              const TextSpan(text: "  "),
                              TextSpan(
                                  text: Strings.globalPrivacyPolicy,
                                  style: AppTextTheme.bodySmallStyle.copyWith(
                                    color: AppTheme.primaryColor,
                                  )),
                            ])),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _signUpUser(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const DashboardPage()));
  }

  _navigateToLogin(BuildContext context) {
    Navigator.pop(context);
  }
}
