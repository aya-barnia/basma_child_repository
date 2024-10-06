

import 'package:basma_child/helper/constant.dart';
import 'package:basma_child/view/Login/login_api.dart';
import 'package:dio/dio.dart';


class ApiChat{

  Dio dio = Dio(
      BaseOptions(

          baseUrl: baseUrl,
          connectTimeout:  const Duration(seconds: 50),
          receiveTimeout:  const Duration(seconds: 50)

      )
  );

  LoginApi api = LoginApi();

  Future<dynamic> sendMessage(var recevId , var message) async
  {
    try{
      print("first 1 in api sendMessage");
      String? token = await  api.getTokenPref();
      String? id = await api.getUserIdPref() ;
      print(token);
      print('here in api chat');
      FormData formData = FormData.fromMap(message);
      print(formData);
      print(formData.toString());
      Response response = await dio.post('api/chat/send-message/${recevId}',
        data: formData,
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':'Bearer $token'
            }
        ),
      );
      print(" second 2");
      if(response.statusCode == 200) {
        print('response.data here');
        print(response.data['status']);
        print("here in response state code >_< ");
        return response.data;
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


  Future<List<dynamic>> getMessage(var recevId) async
  {
    try{
      print("first 1");
      String? token = await api.getTokenPref() ;
      //String? id = await api.getUserIdPref() ;
      print(' token hereee $token');
      Response response = await dio.get('api/chat/getMessagesWithData/$recevId',
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          })
      );
      print(" second 2");
      if(response.statusCode == 200) {
        print("here in response state code >_< get message");
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


}