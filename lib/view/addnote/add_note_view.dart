import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/core/const/app_color.dart';
import 'package:note_app/global/app_bar.dart';
import 'package:note_app/global/snackbar.dart';

import 'package:note_app/view/addnote/widget/no_image_widget.dart';
import 'package:note_app/view/addnote/widget/select_color_widget.dart';

import 'widget/custom_textfield.dart';

class AddNoteView extends StatelessWidget with ErrorSnackbar {
  AddNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(
        () => FloatingActionButton.extended(
            backgroundColor: AppColor.iconcolor,
            onPressed: () {
              if (Get.find<NoteController>().fabText.value == "Save") {
                Get.find<NoteController>().createNote();
                Get.find<NoteController>().getNoteList();
                erorSnackBar("Note Created", "Succes !");
              } else {
                Get.find<NoteController>().updateNote();
                Get.find<NoteController>().getNoteList();
                erorSnackBar("Note Updated", "Succes !");
              }
            },
            label: Row(
              children: [
                const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(Get.find<NoteController>().fabText.value)
              ],
            )),
      ),
      appBar: customAppBar("", []),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                hintText: "Title",
                controller: Get.find<NoteController>().title,
                fontsize: 39,
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                hintText: "Write note here !",
                controller: Get.find<NoteController>().noteText,
                fontsize: 20,
              ),
            ),
            flex: 3,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.find<NoteController>().selectImage();
                },
                child: Container(
                  width: Get.width,
                  color: Colors.black,
                  child: Obx(() =>
                      Get.find<NoteController>().selectedImage.value.path == ""
                          ? const NoImageWidget()
                          : Image.file(
                              File(Get.find<NoteController>()
                                  .selectedImage
                                  .value
                                  .path),
                              width: 100,
                              height: 100,
                            )),
                ),
              ),
            ),
            flex: 5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: SelectColor()),
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }
}
