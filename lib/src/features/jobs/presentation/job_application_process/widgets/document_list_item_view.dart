import 'package:flutter/material.dart';
import 'package:job_box/src/core/common/models/document_model.dart';
import 'package:job_box/src/core/constants/app_dimensions.dart';
import 'package:job_box/src/core/theme/app_theme.dart';
import 'package:job_box/src/core/theme/text_theme.dart';

import '../../../../../core/helpers/date_formatter.dart';

class DocumentListItemView extends StatelessWidget {
  final DocumentModel documentModel;
  final bool isSelected;
  final Function onSelected;
  final bool readOnly;
  final EdgeInsets? padding;

  const DocumentListItemView({
    Key? key,
    required this.documentModel,
    required this.isSelected,
    required this.onSelected,
    this.readOnly = false,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
        contentPadding: padding,
        tileColor: readOnly ? null : AppTheme.tertiaryColor,
        selectedTileColor: readOnly ? null : AppTheme.primaryColor,
        child: ListTile(
          selected: readOnly ? false : isSelected,
          tileColor: readOnly ? null : AppTheme.tertiaryColor,
          selectedColor: readOnly ? null : AppTheme.primaryColor,
          enabled: !readOnly,
          onTap: () {
            onSelected();
          },
          shape: readOnly
              ? null
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(appBorderRadius),
                  side: const BorderSide(color: AppTheme.primaryColor)),
          leading: Icon(
            Icons.upload_file_rounded,
            color: getItemsColor(),
          ),
          title: Text(
            documentModel.fileName,
            style: AppTextTheme.title.copyWith(
              color: getItemsColor(),
            ),
          ),
          subtitle: Text(
            DateFormatter.formatDate(documentModel.uploadDate,
                pattern: "dd/MM/yy"),
            style: AppTextTheme.bodySmallStyle.copyWith(
              color: getItemsColor(),
            ),
          ),
        ));
  }

  getItemsColor() {
    if (readOnly) {
      return AppTheme.textColorPrimary;
    }
    return isSelected ? Colors.white : AppTheme.primaryColor;
  }
}
