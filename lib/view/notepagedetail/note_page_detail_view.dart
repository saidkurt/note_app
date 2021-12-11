import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/core/const/app_color.dart';
import 'package:note_app/global/app_bar.dart';
import 'package:note_app/view/notepagedetail/widget/no_nota_view.dart';
import 'widget/grid_view.dart';

class NotePageDetailView extends StatelessWidget {
  NotePageDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        Get.find<NoteController>().selectedFolderName.value,
        [
          IconButton(
            onPressed: () {
              Get.find<NoteController>().createNewNoteRoute();
              Get.find<NoteController>().fabText.value = "Save";
            },
            icon: const Icon(
              Icons.note_add_rounded,
              size: 30,
              color: AppColor.iconcolor,
            ),
          )
        ],
      ),
      body: Obx(
        () => Get.find<NoteController>().noteList.isEmpty
            ? const NoNoteView()
            : StaggeredGridViewNoteList(
                noteModelList: Get.find<NoteController>().noteList),
      ),
    );
  }
}
