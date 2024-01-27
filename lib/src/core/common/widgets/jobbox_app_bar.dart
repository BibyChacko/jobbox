import 'package:flutter/material.dart';
import 'package:job_box/src/core/theme/text_theme.dart';

class JobBoxAppBar extends StatelessWidget {
  final AppbarLeadingType leadingType;
  final String? title;
  final PreferredSizeWidget? bottom;
  final VoidCallback? action;

  const JobBoxAppBar({
    Key? key,
    this.leadingType = AppbarLeadingType.back,
    this.title,
    this.bottom,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          if(action != null){
            action!();
            return;
          }
          Navigator.pop(context);

        },
        icon: leadingType.getIcon(
          context,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      titleTextStyle: AppTextTheme.fancyTextStyle,
      title: title != null ? Text(title!) : null,
      bottom: bottom,
    );
  }
}

enum AppbarLeadingType { back, close, none }

extension AppbarLeadingTypeIcon on AppbarLeadingType {
  getIcon(BuildContext context, {VoidCallback? action}) {
    switch (this) {
      case AppbarLeadingType.back:
        return const Icon(Icons.arrow_back_ios_new_rounded);
      case AppbarLeadingType.close:
        return const Icon(Icons.close_rounded);
      case AppbarLeadingType.none:
        return null;
    }
  }
}
