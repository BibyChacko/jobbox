import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/widgets/app_image.dart';
import 'package:job_box/src/core/constants/assets.dart';
import 'package:job_box/src/core/theme/app_theme.dart';
import 'package:job_box/src/core/theme/text_theme.dart';
import 'package:job_box/src/features/authentication/presentation/signup/pages/signup_page.dart';
import 'package:job_box/src/features/dashboard_page.dart';
import '../../../../../core/constants/strings.dart';
import '../widgets/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              AppImage.assets(AppAssets.appLogo, height: 100, width: 180),
              const SizedBox(
                height: 40,
              ),
              LoginFormWidget(
                onLogin: (email, password) {
                  _onLogin(context, email, password);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () => _navigateToSignUp(context),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: Strings.newUserText, style: AppTextTheme.bodyStyle),
                  const TextSpan(text: "  "),
                  TextSpan(
                      text: Strings.signUp,
                      style: AppTextTheme.bodyStyle.copyWith(
                        color: AppTheme.primaryColor,
                      ))
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToSignUp(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const SignUpPage()));
  }

  _onLogin(BuildContext context, String email, String password) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const DashboardPage()));
  }
}
