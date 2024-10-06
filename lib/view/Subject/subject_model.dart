
class Subject{


var id;
String? name;

Subject(
  this.id,
  this.name
);

Future<Map<String,dynamic>> subjectModelTojson () async {

return {

'subject_id':id,
'subject':name,

};
}



Subject.fromJson(Map<String, dynamic> json){

  id = json['subject_id'];
  name = json['subject'];
    
}
}


