

import 'dart:io';

import 'package:dio/dio.dart';

import '../../helper/constant.dart';


 //String baseUrl = '192.168.0.104:8000';

class PostsModel{


var id ;
var user_id;
var post_category_id;
String? state;
String? name;
String? text;
 File? imagePost ;
 String? imagePathPost;
 File? image_profile ;
 String? image_profile_path;
var likeCount;

var postCategory;


PostsModel({

  this.id,
  
   this.post_category_id,
   this.state,
   this.name,

   this.image_profile,
   this.text, 
   this.likeCount,
   this.imagePost,
   this.user_id,
  this.postCategory,


}
){
  this.imagePathPost;
  // this.image_profile_path;
}


Future<Map<String,dynamic>> allPostsTojson () async {

return {

//'id':id,
//'user_id':user_id,
//'name':name,
//'image_profile': await MultipartFile.fromFile(image_profile!.path),
//'post_category_id': post_category_id,
//'state':state,
'image': await MultipartFile.fromFile(imagePost!.path),
'text':text,
//'like_count':likeCount,


};}



PostsModel.fromJson(Map<String, dynamic> json){

  imagePathPost =json['image'];//baseUrl+json['image'].toString();//
  //imagePost = baseUrl+ json['image'];
  id         = json['id'];
  user_id    = json['user_id'];
  name       = json['name'];
  image_profile_path = json['image_profile'];
  post_category_id = json['post_category_id'];
  state     = json['state'];
  text      = json['text'];
  likeCount = json['like_count'];
  postCategory = json['post_category'];




}




}

class Filter{

String? catType;
 

 Filter({required this.catType});



 Future<Map<String,dynamic>> filtersTojson () async {

return {

'post_category':catType,

};
}



Filter.fromJson(Map<String, dynamic> json){

  catType = json['post_category'];



}


}

class UserInfo{

  var id ;
  String? name;
  File? imagePost ;
  String? imagePathPost;
  File? image_profile ;
  String? image_profile_path;
  var likeCount;

  var postCategory;


  UserInfo({

    this.id,
    this.name,
    this.image_profile,



  });





  UserInfo.fromJson(Map<String, dynamic> json){

    id         = json['id'];
    name       = json['name'];
    image_profile_path =json['image'].toString();


  }




}