import 'package:basma_child/helper/constant.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi{
//192.168.43.229
// aya 

Dio dio =  Dio(
  BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 50),
    receiveTimeout: const Duration(seconds: 50),
  ),
);

Future  log(Map<String,dynamic> datalogin)async{
  try{
    print(datalogin);
    FormData dataloginform =FormData.fromMap(datalogin);

    print ("datalogin ${datalogin}");

    Response response =await dio.post('api/user_register/child/login',
      data:dataloginform,
        
    );

    if(response.statusCode == 200){

    print("token ${response.data['token']}");
    print("account_type ${response.data['account_type']}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString("saveToken", response.data['token']);

     SharedPreferences prefsId = await SharedPreferences.getInstance();
     prefsId.setString("saveUserId", response.data['user_id'].toString());

    SharedPreferences prefsName = await SharedPreferences.getInstance();
    prefsName.setString("saveName", response.data['name'].toString());


    SharedPreferences prefsImage = await SharedPreferences.getInstance();
    prefsImage.setString("saveImage", response.data['image'].toString());


    return  response.data['account_type'];//RESPONSE(Success: 'true', message: response.data['account_type']);
    }
    else {
      print('2api');
    }
    return response.data['status'];//RESPONSE(Success: false, message: response.data['message']);

  }
  on DioException catch(e){
    print('ppp876');
    if(e.response != null)
      print(" here res ${e.response}");
    else
      print(" here ${e.toString()}");

    return  'error to send login request';

  }
}


Future<RESPONSE> logOut() async
{
  try {
    String? token = await getTokenPref();
    Response response = await dio.post('api/logout' ,
        options: Options(headers: {
          'Accept' : 'application/json',
          'Authorization':'Bearer $token'
        }));
    print("logout1");
    print(response.data);
    if(response.statusCode == 200){
      print("logout2");
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove("saveToken");
      return RESPONSE(Success: true, message: response.data['message']);
    } else {
      print("logout3");
      return RESPONSE(Success: false, message: response.data['message']);
    }
  } on DioError catch (e) {
    if(e.response!=null)
      print(e.response);
    else
    print("reg5");
    return RESPONSE(Success: false , message: 'error to send request');
  }
}


Future getTokenPref () async {
  print("here token");
  SharedPreferences pf = await SharedPreferences.getInstance();

  String? token = pf.getString('saveToken');
  print("token++ ${token!}");
  return token;
}

Future getUserIdPref () async {
  print("here user");
  SharedPreferences pf = await SharedPreferences.getInstance();

  String? user = pf.getString('saveUserId');
  print("saveUserId++ ${user!}");
  return user;
}


}





// String url = "http://192.168.1.1:37992/api/";
// String url = "http://127.0.0.1:8000/api/";
// String url = "http://127.0.0.1/api/";
//String url = "http://192.168.1.114:8000/api/";



class RESPONSE {

  late bool Success;

  late String message;

  RESPONSE({required this.Success, required this.message});

}