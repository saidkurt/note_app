class NoteModel {
  int? noteID;
  int? folderID;
  String? text;
  String? title;
  String? createDate;
  String? lastUpdate;
  String? imagePath;
  int? important;

  NoteModel(
      {this.noteID,
      this.folderID,
      this.title,
      this.text,
      this.createDate,
      this.lastUpdate,
      this.important,
      this.imagePath});

  NoteModel.fromJson(Map<String, dynamic> json) {
    noteID = json["noteID"];
    folderID = json['folderID'];
    text = json['text'];
    title = json["title"];
    createDate = json['createDate'];
    lastUpdate = json['lastUpdate'];
    imagePath = json["imagePath"];
    important = json['important'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["noteID"] = noteID;
    data['folderID'] = folderID;
    data['text'] = text;
    data["title"] = title;
    data['createDate'] = createDate;
    data['lastUpdate'] = lastUpdate;
    data["imagePath"] = imagePath;
    data['important'] = important;

    return data;
  }
}
