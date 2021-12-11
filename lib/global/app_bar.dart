import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

AppBar customAppBar(String title, List<Widget> action) {
  return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: AppTheme.darkThemeCopy.textTheme.bodyText1
            ?.copyWith(fontSize: 25, color: Colors.white),
      ),
      actions: action);
}
