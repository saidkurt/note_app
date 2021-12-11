import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:note_app/core/services/db_service_manager.dart';
import 'package:note_app/models/folder_model.dart';
import 'package:note_app/models/note_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NoteDbService extends IDbService {
  NoteDbService._privateConstructor();

  static final NoteDbService _instance = NoteDbService._privateConstructor();

  static NoteDbService get instance => _instance;

  final String _dbName = "Note";
  final String _folderTable = "folderTable";
  final String _foldername = "folderName";
  final String _folderID = "folderID";
  final String _noteTable = "noteTable";
  final String _text = "text";
  final String _title = "title";
  final String _createDate = "createDate";
  final String _lastUpdate = "lastUpdate";
  final String _important = "important";
  final String _imagePath = "imagePath";
  final String _noteId = "noteID";

  static Database? _db;
  Future<Database?> get db async {
    // ignore: prefer_conditional_assignment
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  @override
  Future<Database> initializeDb() async {
    Directory dir = await getApplicationSupportDirectory();
    String path = dir.path + _dbName;
    var dbNote = await openDatabase(path, version: 1, onCreate: createDb);
    return dbNote;
  }

  @override
  Future createDb(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE $_folderTable($_folderID INTEGER PRIMARY KEY AUTOINCREMENT,$_foldername TEXT NOT NULL UNIQUE)",
    );
    await db.execute(
      "CREATE TABLE $_noteTable($_noteId INTEGER PRIMARY KEY AUTOINCREMENT,folderID INTEGER,$_text TEXT,$_title TEXT,$_createDate TEXT,$_lastUpdate TEXT,$_important INTEGER,$_imagePath TEXT, FOREIGN KEY(folderID) REFERENCES $_folderTable(_$_folderID)) ",
    );
  }

  @override
  Future<List<FolderModel>> getfolderList() async {
    _db = await initializeDb();
    List<Map<String, dynamic>> folderMap =
        await _db!.rawQuery("SELECT * FROM $_folderTable");
    return folderMap.map((e) => FolderModel.fromJson(e)).toList();
  }

  @override
  Future<List<NoteModel>> getNoteList(int id) async {
    _db = await initializeDb();
    List<Map<String, dynamic>> folderMap =
        await _db!.rawQuery("SELECT * FROM $_noteTable WHERE folderID=$id");
    return folderMap.map((e) => NoteModel.fromJson(e)).toList();
  }

  @override
  Future createNote(NoteModel note) async {
    _db = await initializeDb();
    await _db!.insert(_noteTable, note.toJson());
  }

  @override
  Future insertFolder(FolderModel folderName) async {
    _db = await initializeDb();
    String foldername = jsonEncode(folderName.folderName);
    await _db!.rawInsert(
        "INSERT INTO $_folderTable($_foldername) VALUES ($foldername)");
  }

  @override
  Future updateNote(NoteModel model) async {
    _db = await initializeDb();

    return await _db!.update(_noteTable, model.toJson(),
        where: "noteId = ?", whereArgs: [model.noteID]);
  }

  @override
  Future deleteFolder(FolderModel folderName) async {
    _db = await initializeDb();
    String foldername = jsonEncode(folderName.folderName);
    await _db!
        .rawQuery("DELETE FROM $_folderTable WHERE $_foldername=$foldername;");
  }

  @override
  Future deleteNote(NoteModel noteModel) async {
    return await _db!.rawDelete(
        "DELETE FROM $_noteTable WHERE noteID=" + noteModel.noteID.toString());
  }
}
