import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:note_app/global/snackbar.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/models/note_model.dart';

import '../provider/db_service_provider.dart';

class NoteController extends GetxController with ErrorSnackbar {
  TextEditingController title = TextEditingController();
  TextEditingController noteText = TextEditingController();
  TextEditingController noteFolderName = TextEditingController();

  Rx<XFile> selectedImage = XFile("").obs;
  final RxList<FolderModel> _folderList = <FolderModel>[].obs;
  final RxList<NoteModel> _noteList = <NoteModel>[].obs;
  Rx<NoteModel> selectedNoteModel = NoteModel().obs;
  Rx<String> selectedFolderName = "".obs;
  Rx<int> selectedFolderId = 0.obs;
  Rx<int> selectedcolor = 0.obs;
  Rx<int> selectedHight = 30.obs;
  Rx<String> fabText = "Save".obs;

  List<FolderModel> get folderList => _folderList.value;
  List<NoteModel> get noteList => _noteList.value;

  Future selectImage() async {
    final ImagePicker _picker = ImagePicker();
    selectedImage.value = (await _picker.pickImage(
        source: ImageSource.gallery, maxHeight: 200, maxWidth: 200))!;
  }

  Future addNotefolder() async {
    print(noteFolderName.text);
    try {
      await NoteDbService.instance
          .insertFolder(FolderModel(folderName: noteFolderName.text));
      _folderList.value = await NoteDbService.instance.getfolderList();
    } catch (e) {
      erorSnackBar("Error !", "File already exist");
    }
    noteFolderName.clear();
  }

  Future getNoteList() async {
    _noteList.value =
        await NoteDbService.instance.getNoteList(selectedFolderId.value);
  }

  void createNewNoteRoute() {
    Get.toNamed("/addNoteView");
    noteText.text = "";
    title.text = "";
    selectedImage.value = XFile("");
  }

  Future createNote() async {
    NoteModel note = NoteModel();
    note.createDate = DateFormat("dd-MM-yyyy hh:ss").format(DateTime.now());
    note.folderID = selectedFolderId.value;
    note.lastUpdate = DateFormat("dd-MM-yyyy hh:ss").format(DateTime.now());
    note.title = title.text;
    note.text = noteText.text;
    note.imagePath = selectedImage.value.path;
    note.important = selectedcolor.value;
    await NoteDbService.instance.createNote(note);
  }

  Future deleteFolder(FolderModel folderModel) async {
    await NoteDbService.instance.deleteFolder(folderModel);
    _folderList.value = await NoteDbService.instance.getfolderList();
  }

  Future deleteNote() async {
    await NoteDbService.instance.deleteNote(selectedNoteModel.value);
    _noteList.value =
        await NoteDbService.instance.getNoteList(selectedFolderId.value);
  }

  Future updateNote() async {
    selectedNoteModel.value.lastUpdate =
        DateFormat("dd-MM-yyyy hh:ss").format(DateTime.now());
    selectedNoteModel.value.text = noteText.text;
    selectedNoteModel.value.title = title.text;
    selectedNoteModel.value.important = selectedcolor.value;
    selectedNoteModel.value.imagePath = selectedImage.value.path;
    await NoteDbService.instance.updateNote(selectedNoteModel.value);
  }

  @override
  void onInit() async {
    NoteDbService.instance.db;
    NoteDbService.instance.insertFolder(FolderModel(folderName: "Note"));
    _folderList.value = await NoteDbService.instance.getfolderList();
    super.onInit();
  }
}
