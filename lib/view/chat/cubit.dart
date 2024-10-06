// import 'package:basma_child/view/chat/apiChat.dart';
// import 'package:basma_child/view/chat/model.dart';
// import 'package:basma_child/view/chat/state.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../Login/login_api.dart';

// class ChatCubit extends Cubit<ChatState>{

//   ChatCubit() :super(InitialStatee());


//   static ChatCubit get(context) => BlocProvider.of(context);


//   ApiChat apiChat = ApiChat();
//   List<ChatModel> chat =[];

//   LoginApi api = LoginApi();


//   sendChat(recevId , message) async{
//     print('first stap sendChat');
//     print(message);
//     emit(LoadingChatStateState());

//     String? id = await api.getUserIdPref() ;
//     print('here id $id');
//     Map<String, dynamic> editSend = {
//       // 'owner_id': userId,
//       if(id !="")
//         'sender_id': id,
//       if(id !="")
//         'receiver_id': recevId,
//       if(message !="")
//         'message': message,
//     };



//     final cc = await apiChat.sendMessage(recevId , editSend);
//     print('come back');
//     print(cc);

//     // this.chat = cc.map((e) => ClassModel.fromJson(e)).toList();
//     // print(chat);

//     if(cc.isNotEmpty){
//       print(' i am not empty');

//       emit(SendSuccess());
//       print('finish here');

//     }
//     else{

//       emit(GetAllChatStateError(message: 'error'));
//       print('finish here');


//     }


//   }

//   getAllChat(recevId) async{
//     print('first stap class');
//     emit(LoadingChatStateState());

//     final post = await apiChat.getMessage(recevId);
//     print('come back');

//     this.chat = post.map((e) => ChatModel.fromJson(e)).toList();
//     print(chat);

//     if(chat.isNotEmpty){
//       print(' i am not empty');
//       //print(chat.first);

//       emit(GetAllChatState(chat));
//       print('finish here');

//     }
//     else{

//       emit(GetAllChatStateError(message: 'error'));
//       print('finish here');


//     }


//   }


// }






import 'package:basma_child/view/chat/apiChat.dart';
import 'package:basma_child/view/chat/model.dart';
import 'package:basma_child/view/chat/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Login/login_api.dart';

class ChatCubit extends Cubit<ChatState>{

  ChatCubit() :super(InitialStatee());


  static ChatCubit get(context) => BlocProvider.of(context);


  ApiChat apiChat = ApiChat();
  List<ChatModel> chat =[];

  LoginApi api = LoginApi();


  sendChat(recevId , message) async{
    print('first stap sendChat');
    print(message);
    emit(LoadingChatStateState());

    String? id = await api.getUserIdPref() ;
    print('here id $id');
    Map<String, dynamic> editSend = {
      // 'owner_id': userId,
      if(id !="")
        'sender_id': id,
      if(id !="")
        'receiver_id': recevId,
      if(message !="")
        'message': message,
    };



    final cc = await apiChat.sendMessage(recevId , editSend);
    print('come back');
    print(cc);

    // this.chat = cc.map((e) => ClassModel.fromJson(e)).toList();
    // print(chat);

    if(cc.isNotEmpty){
      print(' i am not empty');

      emit(SendSuccess());
      print('finish here');

    }
    else{

      emit(GetAllChatStateError(message: 'error'));
      print('finish here');


    }


  }

  getAllChat(recevId) async{
    print('first stap class');
    emit(LoadingChatStateState());

    final post = await apiChat.getMessage(recevId);
    print('come back');

    this.chat = post.map((e) => ChatModel.fromJson(e)).toList();
    print(chat);

    if(chat.isNotEmpty){
      print(' i am not empty');
      //print(chat.first);

      emit(GetAllChatState(chat));
      print('finish here');

    }
    else{

      emit(GetAllChatStateError(message: 'error'));
      print('finish here');


    }


  }


}