import 'package:flutter/material.dart';
import 'package:job_box/src/core/theme/app_theme.dart';
import 'package:job_box/src/core/theme/text_theme.dart';

class InfoContainerView extends StatelessWidget {
  final String title;
  final String value;
  const InfoContainerView({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextTheme.bodyStyle
              .copyWith(color: AppTheme.textColorSecondary),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(value,
            style: AppTextTheme.title.copyWith(fontWeight: FontWeight.w300)),
      ],
    );
  }
}
