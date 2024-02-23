class PostModel{
  String? id;
  late String title;
  late String desc;
  String? createdTime;


  PostModel({this.id, required this.title, required this.desc, this.createdTime});

  PostModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    title = json["title"];
    desc = json["desc"];
    createdTime = json["createdTime"];
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "title":title,
      "desc":desc,
      "createdTime":createdTime,
    };
  }

}