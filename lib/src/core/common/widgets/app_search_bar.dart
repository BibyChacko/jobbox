import 'package:flutter/material.dart';
import 'package:job_box/src/core/constants/app_dimensions.dart';
import 'package:job_box/src/core/theme/app_theme.dart';
import 'package:job_box/src/core/theme/text_theme.dart';

class AppSearchBar extends StatelessWidget {
  final String hint;
  final Function(String) onInputChanged;
  const AppSearchBar({
    Key? key,
    required this.hint,
    required this.onInputChanged, required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged: onInputChanged,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        prefixIcon:
            const Icon(Icons.search_rounded, color: AppTheme.textColorPrimary),
        suffixIcon: textEditingController.text.isNotEmpty
            ? GestureDetector(
                onTap: () {
                  textEditingController.clear();
                  FocusScope.of(context).unfocus();
                },
                child: const Icon(Icons.clear,color: Colors.grey,))
            : null,
        hintText: hint,
        fillColor: const Color(0xFFEEA96D),
        filled: true,
        hintStyle: AppTextTheme.bodyStyle
            .copyWith(fontSize: 14, color: AppTheme.textColorPrimary),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(appBorderRadius),
            borderSide: const BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(appBorderRadius),
            borderSide: const BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
