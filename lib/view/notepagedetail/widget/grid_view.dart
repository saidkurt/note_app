import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/core/const/app_color.dart';
import 'package:note_app/core/theme/app_theme.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/view/addnote/add_note_view.dart';
import 'package:note_app/view/addnote/widget/no_image_widget.dart';

class StaggeredGridViewNoteList extends StatelessWidget {
  StaggeredGridViewNoteList({Key? key, required this.noteModelList})
      : super(key: key);
  List<NoteModel>? noteModelList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noteModelList!.length,
      itemBuilder: (context, index) => GestureDetector(
        onLongPress: () {
          Get.find<NoteController>().selectedNoteModel.value =
              noteModelList![index];
          Get.find<NoteController>().deleteNote();
        },
        onTap: () {
          Get.to(() => AddNoteView());
          Get.find<NoteController>()..fabText.value = "Update";
          Get.find<NoteController>().selectedNoteModel.value =
              noteModelList![index];
          Get.find<NoteController>().selectedImage.value =
              XFile(noteModelList![index].imagePath.toString());
          Get.find<NoteController>().title.text =
              noteModelList![index].title.toString();
          Get.find<NoteController>().noteText.text =
              noteModelList![index].text.toString();
          Get.find<NoteController>().selectedcolor.value =
              int.parse(noteModelList![index].important.toString());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.grey),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  noteModelList![index].title.toString(),
                  style: AppTheme.darkThemeCopy.textTheme.subtitle1!
                      .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  noteModelList![index].text.toString() + "...",
                  style: AppTheme.darkThemeCopy.textTheme.subtitle1!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Createdate :" + noteModelList![index].createDate.toString(),
                  style: AppTheme.darkThemeCopy.textTheme.subtitle1!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Last Update : " +
                      noteModelList![index].lastUpdate.toString(),
                  style: AppTheme.darkThemeCopy.textTheme.subtitle1!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  child: noteModelList![index].imagePath != ""
                      ? Image.file(
                          File(noteModelList![index].imagePath.toString()))
                      : const NoImageWidget(),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(noteModelList![index].important!.toInt())),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
