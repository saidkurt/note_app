import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.fontsize,
    required this.controller,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  TextEditingController controller;
  double? fontsize;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration.collapsed(
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: AppTheme.darkThemeCopy.textTheme.bodyText1!
                .copyWith(color: Colors.grey)),
        textDirection: TextDirection.ltr,
        controller: controller,
        expands: true,
        maxLines: null,
        style: AppTheme.darkThemeCopy.textTheme.bodyText1!
            .copyWith(color: Colors.grey, fontSize: fontsize));
  }
}
