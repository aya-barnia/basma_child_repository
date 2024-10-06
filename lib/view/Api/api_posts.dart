


// import 'package:child_basma/view/Model/model_posts.dart';
// import 'package:dio/dio.dart';

// class ApiPosts{

// Dio dio = Dio(
//   BaseOptions(
    
//     baseUrl: 'http://192.168.1.114:8000/api/',
//     connectTimeout:  const Duration(seconds: 50),
//     receiveTimeout:  const Duration(seconds: 50)
    
//     )
//   );


//   //Future<List<dynamic>> addPost(Map<String,dynamic> post) async {

//   Future<List<dynamic>> addPost(Map<String,dynamic> post) async {

//     print('here first add post api');
//     print(post.toString());
//     try{
//       String? token = '14|ck0vbA05Kspofaz0aayOkMdF9vtVyXRTpl6yzt12a4f4656b';
//      //print(token);
//      FormData formData = FormData.fromMap(post);
//      Response response = await dio.post('posts',
//       options: Options(
//        headers: {
//          'Accept':'application/json',
//          'Authorization':'Bearer $token'
//        }
//       ),
//      data: formData,
//      );
//      if(response.statusCode == 200){
//       print('add success');
//       return response.data['data'];
//      }
//         else{
//           print('i am in else');
//           return [];
//             }
//          }
//          catch(e){
//           print('in catch ${e.toString()}');

//     }
//     return [];
//   }




//   Future<List<dynamic>> getPosts() async
//   {
//     try{
//       print("first 1");
//       String? token = '14|ck0vbA05Kspofaz0aayOkMdF9vtVyXRTpl6yzt12a4f4656b';
//      // print(token);
//       Response response = await dio.get('posts',
//           options: Options(headers: {
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $token'
//           })
//       );
//       print(" second 2");
//       if(response.statusCode == 200) {
//         print("here in response state code >_<");
//         return response.data['data'];
//       }
//       else {
//         print("get 4 ");
//         return [];
//       }
//     }on DioError catch(e){
//       if(e.response!=null)
//         print(e.response);
//       else
//         print(e.message);
//       print("get5");
//       return [];
//     }
//   }


//   Future<List<dynamic>> getMyPosts() async
//   {
//     try{
//       print("first 1");
//       String? token = '14|ck0vbA05Kspofaz0aayOkMdF9vtVyXRTpl6yzt12a4f4656b';
//      // print(token);
//       Response response = await dio.get('posts/user/get_user_posts',
//           options: Options(headers: {
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $token'
//           })
//       );
//       print(" second 2");
//       if(response.statusCode == 200) {
//         print("here in response state code >_< 60");
//         return response.data['data'];
//       }
//       else {
//         print("get 4 ");
//         return [];
//       }
//     }on DioError catch(e){
//       if(e.response!=null)
//         print(e.response);
//       else
//         print(e.message);
//       print("get5");
//       return [];
//     }
//   }




//    Future<RESPONCE2> getPostCategory(Map<String,dynamic> post) async {

//     print('here first add post api');
//     print(post.toString());
//     try{
//       String? token = '15|hWyyOslZyT3tGAGjS9qP257EjXfTPFUOIhinx7dpe196d418';
//      //print(token);
//      FormData formData = FormData.fromMap(post);
//      Response response = await dio.post('posts/post/filter',
//       options: Options(
//        headers: {
//          'Accept':'application/json',
//          'Authorization':'Bearer $token'
//        }
//       ),
//      data: formData,
//      );
//      if(response.statusCode == 200){
//       print('add success');
//       print(response.data['data']);
//       return RESPONCE2(status: true, message: response.data['data']) ;
//      }
//         else{
//           print('i am in else');
//           return RESPONCE2(status: false, message: response.data['data']) ;
//             }
//          }
//          catch(e){
//           print('in catch ${e.toString()}');

//     }
//     return RESPONCE2(status: false, message: []);
//   }

// Future<List<dynamic>> getClassess() async
//   {
//     try{
//       print("first 1 in api classes");
//       //String? token = '14|ck0vbA05Kspofaz0aayOkMdF9vtVyXRTpl6yzt12a4f4656b';
//      // print(token);
//       Response response = await dio.get('/api/education/getAllClassroom',
       
//       );
//       print(" second 2");
//       if(response.statusCode == 200) {
//         print("here in response state code >_< classes");
//         return response.data['data'];
//       }
//       else {
//         print("get 4 ");
//         return [];
//       }
//     }on DioError catch(e){
//       if(e.response!=null)
//         print(e.response);
//       else
//         print(e.message);
//       print("get5");
//       return [];
//     }
//   }





// }


// class RESPONCE {

// late bool status;
// late String message;

// RESPONCE({required this.status ,required this.message});


// }


// class RESPONCE2 {

// late bool status;
// List<PostsModel> message;

// RESPONCE2({required this.status ,required this.message});


// }