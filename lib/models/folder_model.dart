class FolderModel {
  int? folderID;
  String? folderName;

  FolderModel({this.folderName});

  FolderModel.fromJson(Map<String, dynamic> json) {
    folderName = json['folderName'];
    folderID = json["folderID"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["folderID"] = folderID;
    data['foldername'] = folderName;
    return data;
  }
}
