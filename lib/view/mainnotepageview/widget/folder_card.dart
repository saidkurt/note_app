import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/view/notepagedetail/note_page_detail_view.dart';

import '../../../core/const/app_color.dart';

class FolderCardList extends StatelessWidget {
  FolderCardList({
    required this.folderModel,
    Key? key,
  }) : super(key: key);
  List<FolderModel> folderModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: folderModel.length,
      itemBuilder: (context, index) => Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            IconButton(
              onPressed: () {
                index != 0
                    ? Get.find<NoteController>()
                        .deleteFolder(folderModel[index])
                    : null;
              },
              icon: const Icon(
                Icons.delete,
                color: AppColor.iconcolor,
                size: 20,
              ),
            )
          ],
        ),
        child: SizedBox(
          height: 70,
          width: Get.width,
          child: Card(
              child: ListTile(
                onTap: () {
                  Get.find<NoteController>().selectedFolderName.value =
                      folderModel[index].folderName!;
                  Get.find<NoteController>().selectedFolderId.value =
                      folderModel[index].folderID!;
                  Get.find<NoteController>().getNoteList();
                  Get.to(() => NotePageDetailView());
                },
                leading: const Icon(
                  Icons.folder_rounded,
                  color: AppColor.iconcolor,
                  size: 40,
                ),
                title: Text(folderModel[index].folderName.toString()),
              ),
              shadowColor: Colors.white,
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
        ),
      ),
    );
  }
}
