class TitleSub{


var id;
String? name;

TitleSub(
  this.id,
  this.name
);

Future<Map<String,dynamic>> titleModelTojson () async {

return {

'id':id,
'title':name,

};
}



TitleSub.fromJson(Map<String, dynamic> json){

  id = json['id'];
  name = json['title'];
    
}
}

