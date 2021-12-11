import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/core/const/app_color.dart';

import 'package:note_app/view/mainnotepageview/widget/bottom_sheat.dart';
import '../../global/app_bar.dart';
import 'widget/folder_card.dart';

class MainNotePageView extends StatelessWidget with ShowBottomSheet {
  MainNotePageView({Key? key}) : super(key: key);
  final mainNotePageViewController = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Note", [
        IconButton(
          onPressed: () {
            customBottomSheet(Get.find<NoteController>().noteFolderName, "Save",
                () {
              Get.find<NoteController>().addNotefolder();
            });
          },
          icon: const Icon(
            Icons.create_new_folder_rounded,
            color: AppColor.iconcolor,
            size: 30,
          ),
        )
      ]),
      body: Obx(() => FolderCardList(
            folderModel: mainNotePageViewController.folderList,
          )),
    );
  }
}
