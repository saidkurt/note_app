import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/const/app_color.dart';
import 'package:note_app/core/theme/app_theme.dart';

class NoNoteView extends StatelessWidget {
  const NoNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.grey, size: 100),
          Text(
            "Please add note",
            style: AppTheme.darkThemeCopy.textTheme.bodyText1!
                .copyWith(fontSize: 40, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
