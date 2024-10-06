

import 'package:basma_child/helper/constant.dart';
import 'package:basma_child/view/Login/login_api.dart';
import 'package:dio/dio.dart';


class ApiClasses{

Dio dio = Dio(
  BaseOptions(
    
    baseUrl: baseUrl,
    connectTimeout:  const Duration(seconds: 50),
    receiveTimeout:  const Duration(seconds: 50)
    
    )
  );

   LoginApi api = LoginApi();

  Future<List<dynamic>> getClassess() async
  {
    try{
      print("first 1 in api classes");
      String? token = await  api.getTokenPref();
     print(token);
      Response response = await dio.get('api/education/getAllClassroom',
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':'Bearer $token'
            }
        ),
      );
      print(" second 2");
      if(response.statusCode == 200) {
        print(response.data['data']);
        print("here in response state code >_< classes");
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


  Future<List<dynamic>> getSubject(classId) async
  {
    try{
      print("first 1 in api subject");
      print(classId);
      String? token = await  api.getTokenPref();
      print(token);
      Response response = await dio.get('api/education/getSubjectsForClassroom/$classId',
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':'Bearer $token'
            }
        ),
       
      );
      print(" second 2");

      if(response.statusCode == 200) {
        print('seccess   ${response.data}' );
        print(response.data['data']);
        print("here in response state code >_< subject");
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

  Future<List<dynamic>> getTitle(subId) async
  {
    try{
      print("first 1 in api title");
      print(subId);
      String? token = await  api.getTokenPref();
      print(token);
      Response response = await dio.get('api/education/getTitlesForSubjectClass/$subId',
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':'Bearer $token'
            }
        ),

       
      );
      print(" second 2");

      if(response.statusCode == 200) {
        print('**********************************************');
        print('seccess title   ${response.data}' );
        print(response.data['data']);
        print("here in response state code >_< title");
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