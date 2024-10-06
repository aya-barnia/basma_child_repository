
class ChatModel{

  var receiverId;
  var senderId;
  String? messageChild;
  String? messageAdmin;

  ChatModel(
      this.receiverId,
      this.senderId,
      this.messageChild,
      this.messageAdmin
      );

  Future<Map<String,dynamic>> chatModelTojson () async {

    return {

      'sender_id':senderId,
      'receiver_id':receiverId,
      'message_child' : messageChild,
      'message_admin':messageAdmin,

    };
  }



  ChatModel.fromJson(Map<String, dynamic> json){

    receiverId = json['receiver_id'];
    senderId = json['sender_id'];
    messageAdmin = json['message_admin'];
    messageChild = json['message_child'];


  }







}