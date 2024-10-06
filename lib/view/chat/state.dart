
import 'package:basma_child/view/chat/model.dart';

abstract class ChatState{}

class InitialStatee extends ChatState{}

class LoadingChatStateState  extends ChatState{}

class GetAllChatState extends ChatState{

  List<ChatModel> cal =[];

  GetAllChatState( this.cal);


}


class SendSuccess extends ChatState{

 // String message;

  SendSuccess();


}

class GetAllChatStateError extends ChatState{

  String message;

  GetAllChatStateError({required this.message});


}



