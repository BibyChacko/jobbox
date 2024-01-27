import 'package:flutter/material.dart';
import 'package:job_box/src/core/theme/text_theme.dart';

class AddDocumentHeaderView extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onDocumentAddAction;

  const AddDocumentHeaderView({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onDocumentAddAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: AppTextTheme.heading4,
      ),
      subtitle: Text(
        subTitle,
        style: AppTextTheme.bodySmallStyle,
      ),
      trailing: IconButton(
          onPressed: () {
            onDocumentAddAction();
          },
          icon: const Icon(
            Icons.add,
            size: 32,
          )),
    );
  }
}
