import 'package:note_app/models/folder_model.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../models/note_model.dart';

abstract class IDbService {
  Future<Database> initializeDb();
  Future createDb(Database db, int newVersion);
  Future<List<FolderModel>> getfolderList();
  Future<List<NoteModel>> getNoteList(int id);
  Future createNote(NoteModel note);
  Future insertFolder(FolderModel folderName);
  Future updateNote(NoteModel model);
  Future deleteFolder(FolderModel folderName);
  Future deleteNote(NoteModel noteModel);
}
