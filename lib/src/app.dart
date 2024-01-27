import 'package:flutter/material.dart';
import 'package:job_box/src/core/constants/strings.dart';
import 'package:job_box/src/core/theme/app_theme.dart';
import 'package:job_box/src/core/theme/text_theme.dart';
import 'package:job_box/src/features/authentication/presentation/login/pages/login_page.dart';

class JobBoxApp extends StatelessWidget {
  const JobBoxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppTheme.primaryColor,
          primarySwatch: Colors.orange,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
              .copyWith(background: AppTheme.backgroundColor,),
        textTheme: TextTheme(
          bodyMedium: AppTextTheme.bodyStyle,

        ),
        buttonTheme: const ButtonThemeData(
            minWidth: 160,
            buttonColor: AppTheme.primaryColor
        )
      ),
      home: const LoginPage(),
    );
  }
}
