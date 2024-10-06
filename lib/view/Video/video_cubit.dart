import 'package:basma_child/view/Login/login_api.dart';
import 'package:basma_child/view/Video/Video_model.dart';
import 'package:basma_child/view/Video/video_state.dart';
import 'package:bloc/bloc.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_video.dart';

class VideoCubit extends Cubit<VideoState>{


  VideoCubit():super(VideoInitial());

  static VideoCubit get(context)=>BlocProvider.of(context);

  ApiVideo apiVideo = ApiVideo();
  LoginApi loginApi = LoginApi();

  List<VideoModel> video = [];
  
  orderExplanations( subjectId , titleId , text )async{
    emit(LoadingState());

    print('hi ');
    String? id = await loginApi.getUserIdPref();
    print(subjectId);
    print(titleId);


    Map<String, dynamic> order = {

      if(id != "")
        'user_id' : id,
      if(subjectId != "")
        'subject_class_id' : subjectId,
      if(titleId != "")
        'title_id' : titleId,
      if(text != "")
        'note':  text,
    };

    var res = await apiVideo.orderExplanations(order);
    if(res.isNotEmpty){

      print(res.toString());

      emit(OrderSuccess());
    }
    else{
      emit(OrderError());
    }



  }

  orderExplanationsByTitle( titleId )async{
    emit(LoadingState());

    print('hi in  orderExplanationsByTitle');
    String? id = await loginApi.getUserIdPref();
    print(titleId);

    List<dynamic> res = await apiVideo.orderExplanationsByTitle(titleId);
    this.video = res.map((e) => VideoModel.fromJson(e)).toList();
    if(video.isNotEmpty){

      emit(VideoSuccess(video));
    }
    else{
      emit(VideoError());
    }



  }

}