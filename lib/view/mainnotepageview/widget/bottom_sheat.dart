import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_theme.dart';

mixin ShowBottomSheet {
  customBottomSheet(TextEditingController controller, String buttonText,
      void Function() press) {
    Get.bottomSheet(
      Container(
        color: Colors.grey,
        height: Get.height / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.create_new_folder_outlined,
                    color: Colors.white,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)),
                  hintText: ("Write folder name here .. "),
                  hintStyle: AppTheme.darkThemeCopy.textTheme.subtitle1
                      ?.copyWith(color: Colors.white)),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: AppTheme.darkThemeCopy.elevatedButtonTheme.style,
              onPressed: press,
              child: Text(
                buttonText,
              ),
            )
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isDismissible: true,
    );
  }
}
