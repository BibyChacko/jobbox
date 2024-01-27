import 'package:flutter/material.dart';
import 'package:job_box/src/core/constants/app_dimensions.dart';
import 'package:job_box/src/core/theme/app_theme.dart';
import 'package:job_box/src/core/theme/text_theme.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    required this.label,
    required this.textEditingController,
    this.hint,
    this.isObscure = false,
    this.suffix,
    required this.validator,
  }) : super(key: key);

  final String label;
  final String? hint;
  final TextEditingController textEditingController;
  final bool isObscure;
  final Widget? suffix;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextTheme.bodyStyle,
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
            controller: textEditingController,
            validator: validator,
            decoration: InputDecoration(
                suffix: suffix,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                hintStyle: AppTextTheme.bodyLightStyle
                    .copyWith(color: AppTheme.textColorSecondary, fontSize: 14),
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppTheme.textColorPrimary),
                    borderRadius: BorderRadius.circular(appBorderRadius)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppTheme.textColorPrimary),
                    borderRadius: BorderRadius.circular(appBorderRadius)),
                hintText: hint,
                hintMaxLines: 2,
                floatingLabelBehavior: FloatingLabelBehavior.never),
            obscureText: isObscure),
      ],
    );
  }
}
