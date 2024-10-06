

import 'dart:io';

import 'package:dio/dio.dart';

import '../../helper/constant.dart';


//String baseUrl = '192.168.0.104:8000';

class VideoModel{


  var id ;
  String? title;
  String? state;
  var video;


  VideoModel({

    this.id,

    this.title,
    this.state,
    this.video,


  });





  VideoModel.fromJson(Map<String, dynamic> json){

    id          = json['id'];
    title       = json['title'];
    state       = json['state'];
    video       = json['video'];


  }
}
