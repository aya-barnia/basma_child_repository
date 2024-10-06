


import 'package:basma_child/view/Login/login_api.dart';
import 'package:basma_child/view/Posts/model_posts.dart';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/constant.dart';

class ApiPosts{

Dio dio = Dio(
  BaseOptions(

    baseUrl: baseUrl,
    connectTimeout:  const Duration(seconds: 50),
    receiveTimeout:  const Duration(seconds: 50)

    )
  );

LoginApi api = LoginApi();

  //Future<List<dynamic>> addPost(Map<String,dynamic> post) async {

  Future<List<dynamic>> addPost(Map<String,dynamic> post) async {

    print('here first add post api');
    print(post.toString());
    try{
      //String? token = '9|RzKRTTvbvaysRWEKOsu6mB32zh10wuDVQo7vUKoCa7a12e1f';
      String? token = await api.getTokenPref() ;
      print(' token hereee $token');
     FormData formData = FormData.fromMap(post);
     Response response = await dio.post('api/posts',
      options: Options(
       headers: {
         'Accept':'application/json',
         'Authorization':'Bearer $token'
       }
      ),
     data: formData,
     );
     if(response.statusCode == 200){
      print('add success posts');
      return response.data['data'];
     }
        else{
          print('i am in else');
          return [];
            }
         }
         catch(e){
          print('in catch ${e.toString()}');

    }
    return [];
  }




  Future<List<dynamic>> getPosts(numberPage) async
  {
    try{
      print("first 1");
      //String? token = '9|RzKRTTvbvaysRWEKOsu6mB32zh10wuDVQo7vUKoCa7a12e1f';
      String? token = await api.getTokenPref() ;
      print(' token hereee $token');
      //'api/posts/all?page=$numberPage',
      Response response = await dio.get('api/posts?page=$numberPage',
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          })
      );
      print(" second 2");
      if(response.statusCode == 200) {
        print("here in response state code >_<");
        return response.data['data'];
      }
      else {
        print("get 4 ");
        return [];
      }
    }on DioError catch(e){
      if(e.response!=null)
        print(e.response);
      else
        print(e.message);
      print("get5");
      return [];
    }
  }


  Future<List<dynamic>> getMyPosts() async
  {
    try{
      print("first 1");
      //String? token = '9|RzKRTTvbvaysRWEKOsu6mB32zh10wuDVQo7vUKoCa7a12e1f';
      String? token = await api.getTokenPref() ;
      print(' token hereee $token');
      Response response = await dio.get('api/posts/user/get_user_posts',
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          })
      );
      print(" second 2");
      if(response.statusCode == 200) {
        print("here in response state code >_< 60");
        print(response.data['data']);
        return response.data['data'];
      }
      else {
        print("get 4 ");
        return [];
      }
    }on DioError catch(e){
      if(e.response!=null)
        print(e.response);
      else
        print(e.message);
      print("get5");
      return [];
    }
  }




  Future<List<dynamic>> getPostCategory(cat) async {

    print('here first add post api');
    print(cat.toString());
    try{
      //String? token = '9|RzKRTTvbvaysRWEKOsu6mB32zh10wuDVQo7vUKoCa7a12e1f';
      String? token = await api.getTokenPref() ;
      print(' token hereee $token');
     // FormData formData = FormData.fromMap(post);
     Response response = await dio.get('api/posts/post/filter?post_category=$cat',
      options: Options(
       headers: {
         'Accept':'application/json',
         'Authorization':'Bearer $token'
       }
      ),
     );
     if(response.statusCode == 200){
      print('add success');
      print(response.data['data']);
      return response.data['data'];//RESPONCE2(status: true, message: response.data['data']) ;
     }
        else{
          print('i am in else');
          return [];//RESPONCE2(status: false, message: response.data['data']) ;
            }
         }
         catch(e){
          print('in catch ${e.toString()}');

    }
    return [];//RESPONCE2(status: false, message: []);
  }



Future<dynamic> addLike(postId) async{

  print('here addLike api');
  print(postId.toString());
  try{
    String? token = await api.getTokenPref() ;
    print(' token hereee $token');
    Response response = await dio.post('api/posts/like/$postId',
      options: Options(
          headers: {
            'Accept':'application/json',
            'Authorization':'Bearer $token'
          }
      ),
    );
    if(response.statusCode == 200){
      print('add like success');
      print('*******************************');

      print(response.data['message']);
      return response.data['message'];
    
    }
    else{
      print('i am in else');
      return response.data['message'];//RESPONSE(Success: false, message: response.data['message']);
    }
  }
  catch(e){
    print('in catch ${e.toString()}');

  }
  return 'error catch function';//RESPONSE(Success: false, message: 'n catch');
}

Future<dynamic> userInfo() async{

  print('here userInfo api');  
  try{
    String? token = await api.getTokenPref() ;
    print(' token hereee $token');


    String? id = await api.getUserIdPref() ;
        print(' id hereee $id');

    Response response = await dio.get('api/users/showUserInfo/$id',
      // options: Options(
      //     headers: {
      //       'Accept':'application/json',
      //       'Authorization':'Bearer $token'
      //     }
      // ),

    );
    if(response.statusCode == 200){

      print('userInfo success');
      print(response.data['data']['name']);
      print(response.data['data']['child_info']['image']);


      SharedPreferences prefsName = await SharedPreferences.getInstance();
     prefsName.setString("saveUserName", response.data['data']['name']);


      SharedPreferences prefsImage = await SharedPreferences.getInstance();
     prefsImage.setString("saveImageId", response.data['data']['child_info']['image']);


      return response.data['data'];
    }
    else{
      print('i am in else');
      return [];
    }
  }
  catch(e){
    print('in catch ${e.toString()}');

  }
  return [];
}



Future<RESPONSE> deleteMyPost(dynamic postId) async
{
  try{
    print("delete 1");
    print(postId);
    String? token = await api.getTokenPref();
    print(token);
    Response response = await dio.delete('api/posts/$postId',
        options: Options(headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        })
    );
    print("here should be 200");
    if(response.statusCode == 200) {
      print('is status code delete');
      print(response.data);
      print(response.data['message']);
      return RESPONSE(Success: true, message: response.data['message']);
    }
    else{
      return RESPONSE(Success: false, message: response.data['message']);
    }
  }on DioError catch(e){
    if(e.response!=null)
      print(e.response);
    else
      print(e.message);
    print("delete5");
    return RESPONSE(Success: false, message: 'error to send delete request');
  }
}


Future getUserNamePref () async {
  print("here user");
  SharedPreferences pf = await SharedPreferences.getInstance();

  String? user = pf.getString('saveName');
  print("saveUserName++ ${user}");
  return user;
}

Future getUserImagePref () async {
  print("here user");
  SharedPreferences pf = await SharedPreferences.getInstance();

  String? user = pf.getString('saveImage');
  print("saveImageId++ ${user!}");
  return user;
}


}






class RESPONCE2 {

late bool status;
List<PostsModel> message;

RESPONCE2({required this.status ,required this.message});


}