class ModelLogin{

  late String user_name;
  late String password;
  Future<Map<String,dynamic>>logintojson()async {
    print("jsonn ");
    return {
      'user_name': user_name,
      'password': password,


    };
  }


}
