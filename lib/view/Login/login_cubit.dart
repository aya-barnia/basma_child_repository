import 'package:basma_child/view/Login/login_api.dart';
import 'package:basma_child/view/Login/login_model.dart';
import 'package:basma_child/view/Login/login_state.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{


  LoginCubit():super(LoginInitial());

  static LoginCubit get(context)=>BlocProvider.of(context);

  LoginApi api =LoginApi();


  login(ModelLogin model)async{

   print('here bloc');
    emit(LoginLoading());
    print("hi cubit");

    Map<String,dynamic>json=await model.logintojson();
    String response=await api.log(json);
    print('response');
        print(response);

    if (response.contains('child')) {


      emit(LoginLoaded(message: 'Success Login'));
      
    } else {
      emit(LoginLoadError(message: 'Faild Login'));
    }

  }

}