

// import 'dart:io';

// import 'package:dio/dio.dart';

// class PostsModel{


// var id ;
// var user_id;
// var post_category_id;
// String? state;
// String? name;
// String? text;
//  File? imagePost ;
//  String? imagePathPost;
//  File? image_profile ;
//  String? image_profile_path;
// var likeCount;


// PostsModel({

//   this.id,
  
//    this.post_category_id,
//    this.state,
//    this.name,
//    this.imagePathPost,
//    this.image_profile,
//    this.text, 
//    this.likeCount,
//    this.imagePost,
//    this.user_id,


// });


// Future<Map<String,dynamic>> allPostsTojson () async {

// return {

// //'id':id,
// //'user_id':user_id,
// //'name':name,
// //'image_profile': await MultipartFile.fromFile(image_profile!.path),
// //'post_category_id': post_category_id,
// //'state':state,
// 'image': await MultipartFile.fromFile(imagePost!.path),
// 'text':text,
// //'like_count':likeCount,


// };}


// static String baseUrl = 'http://192.168.1.114:8000';

// PostsModel.fromJson(Map<String, dynamic> json){

//   imagePathPost = baseUrl + json['image'].toString();
//   id         = json['id'];
//   user_id    = json['user_id'];
//   name       = json['name'];
//   image_profile_path = baseUrl + json['image_profile'].toString();
//   post_category_id = json['post_category_id'];
//   state     = json['state'];
//   text      = json['text'];
//   likeCount = json['likeCount'];



// }




// }

// class Filter{

// String? catType;
 

//  Filter({required this.catType});



//  Future<Map<String,dynamic>> filtersTojson () async {

// return {

// 'post_category':catType,

// };
// }


// static String baseUrl = 'http://192.168.1.114:8000';

// Filter.fromJson(Map<String, dynamic> json){

//   catType = json['post_category'];



// }


// }