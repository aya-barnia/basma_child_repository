
class ClassModel{

var id;
String? name;

ClassModel(
  this.id,
  this.name
);

Future<Map<String,dynamic>> classModelTojson () async {

return {

'id':id,
'name':name,

};
}



ClassModel.fromJson(Map<String, dynamic> json){

  id = json['id'];
  name = json['name'];


}







}