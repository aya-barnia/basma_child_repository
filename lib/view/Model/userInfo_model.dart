
class UserInfo{

  var id;
  String? name;
  String? image;

  UserInfo(
      this.id,
      this.name
      );

  UserInfo.fromJson(Map<String, dynamic> json){

    id = json['id'];
    name = json['name'];
    image = json['child_info']['image'];


  }



}