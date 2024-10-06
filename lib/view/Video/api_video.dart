
import 'package:basma_child/helper/constant.dart';
import 'package:basma_child/view/Login/login_api.dart';
import 'package:dio/dio.dart';


class ApiVideo{

  Dio dio = Dio(
      BaseOptions(

          baseUrl: baseUrl,
          connectTimeout:  const Duration(seconds: 50),
          receiveTimeout:  const Duration(seconds: 50)

      )
  );

   LoginApi api = LoginApi();

  Future<dynamic> orderExplanations(data) async
  {
    try{
      print("first 1 in api title");
      print(data);
      String? token = await  api.getTokenPref();
      print(token);
      FormData formData = FormData.fromMap(data);
      Response response = await dio.post('api/education/orderExplanations',
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':'Bearer $token'
            }
        ),
        data: formData,

      );
      print(" second 2");

      if(response.statusCode == 201) {
        print('**********************************************');
        print('success order   ${response.data}' );
        print("here in response state code >_< video order");
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

  Future<List<dynamic>> orderExplanationsByTitle(titleId) async
  {
    try{
      print("first 1 in api orderExplanationsByTitle");
      print(titleId);
      String? token = await  api.getTokenPref();
      print(token);
      Response response = await dio.get('api/education/getExplanationsByTitle/$titleId',
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
        print('success order   ${response.data['data']}' );
        print("here in response state code >_< video order");
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