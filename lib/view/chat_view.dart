// import 'package:flutter/material.dart';

// class ChatView extends StatefulWidget {
//   @override
//   _ChatViewState createState() => _ChatViewState();
// }

// class _ChatViewState extends State<ChatView> {
//   final List<ChatMessage> messages = [
//     // قائمة بالرسائل الموجودة مسبقًا
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('بسمة'),
//         leading: CircleAvatar(
//           backgroundImage: AssetImage('assets/images/basma.png')
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: messages.length,
//         itemBuilder: (context, index) {
//           return ChatMessage(
//             message: messages[index],
//            text: 'text',
//            isSentByMe : false,
//           );
//         },
//       ),
//       bottomSheet: Container(
//         color: Colors.white,
//         child: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'اكتب رسالتك هنا',
//                 ),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.send),
//               onPressed: () {
//                 // هنا يمكنك إضافة منطق لإرسال الرسالة
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   final ChatMessage message;
//   final String text;
//   final bool isSentByMe;


//   ChatMessage({required this.message,required this.text, this.isSentByMe = false});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       alignment: message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: message.isSentByMe ? Colors.blue : Colors.grey[300],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(message.text),
//       ),
//     );
//   }
// }
////////////////////////////////////////////////
///////////////////////هااااااااااااااااااااااااااااد
// import 'package:child_basma/helper/constant.dart';
// import 'package:child_basma/view/Classes/classes_view.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ChatView extends StatefulWidget {
//   @override
//   _ChatViewState createState() => _ChatViewState();
// }

// class _ChatViewState extends State<ChatView> {
//   final List<String> messages = [
//     "النص أشعر بالتعب اليوم. أتمنى أن أعود للعب قريباً.",

//   "النص لا تقلق، سنكون بجانبك في كل خطوة. لدينا نشاط ممتع لك الأسبوع القادم.",

//   "النص شكراً لكم على الهدية، أحببتها كثيراً!",
//  ];

//   void sendMessage(String text) {
//     // أضف منطق لإرسال الرسالة إلى الخادم أو قاعدة البيانات
//     setState(() {
//       messages.add(text);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: yellow,
//         title: Center(child: Text('تواصل معنا',style: TextStyle(fontWeight: FontWeight.bold,color:Purple2,fontSize:25),)),
//         leading: Image(image:  AssetImage('assets/images/basma.png'),color: Purple2,)
        
      
        
//       ),
//       body: ListView.builder(
//         itemCount: messages.length,
//         itemBuilder: (context, index) {
//           final String text = messages[index];
//           final bool isSentByMe = index % 2 == 0; // مثال لتحديد من أرسل الرسالة

//           return ChatMessage(
//             text: text,
//             isSentByMe: isSentByMe,
//           );
//         },
//       ),
//       bottomSheet: Container(
//         color: Colors.white,
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: Row(
//             children: [
               
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: '    اكتب رسالتك هنا ',
//                   ),
//                   onSubmitted: (text) => sendMessage(text),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.send,color: green,),
//                 // onPressed: () => sendMessage(TextField.controller?.text ?? ''),
//                 onPressed: (){},
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   final String text;
//   final bool isSentByMe;

//   ChatMessage({required this.text, this.isSentByMe = false});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           // color: isSentByMe ? yellow : Colors.grey[300],
//              color: isSentByMe ? yellow : green,

//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(text),
//       ),
//     );
//   }
// }

/////////////////////////////////////

import 'package:basma_child/helper/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final List<String> messages = [
    " أشعر بالتعب اليوم. أتمنى أن أعود للعب قريباً.",

    " لا تقلق، سنكون بجانبك في كل خطوة. لدينا نشاط ممتع لك الأسبوع القادم.",

    " شكراً لكم على الهدية، أحببتها كثيراً!",

    "كيف حالك اليوم , لا تنس موعد المستشفى يا بطل"
  ];

  final TextEditingController _textController = TextEditingController();

  void sendMessage() {
    setState(() {
      if (_textController.text.isNotEmpty) {
        messages.add(_textController.text);
        _textController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellow,
        title: Center(
            child: Text(
              'تواصل معنا',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Purple2,
                fontSize: 25,
              ),
            )),
        leading: Image(
          image: AssetImage('assets/images/basma.png'),
          color: Purple2,
        ),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final String text = messages[index];
          final bool isSentByMe = index % 2 == 0; // مثال لتحديد من أرسل الرسالة

          return ChatMessage(
            text: text,
            isSentByMe: isSentByMe,
          );
        },
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: '    اكتب رسالتك هنا ',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send, color: green),
                onPressed: sendMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSentByMe;

  ChatMessage({required this.text, this.isSentByMe = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSentByMe ? yellow : green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class Message {
//   final String text;
//   final String sender;

//   Message({required this.text, required this.sender});
// }

// class ChatView extends StatefulWidget {
//   @override
//   _ChatViewState createState() => _ChatViewState();
// }

// class _ChatViewState extends State<ChatView> {
//   final List<Message> messages = [
//     Message(text: "أشعر بالتعب اليوم، أتمنى أن أعود للعب قريباً.", sender: "child"),
//     Message(text: "لا تقلق، سنكون بجانبك في كل خطوة. لدينا نشاط ممتع لك الأسبوع القادم.", sender: "basma"),
//     Message(text: "شكراً لكم على الهدية، أحببتها كثيراً!", sender: "child"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('بسمة'),
//         leading: CircleAvatar(
//           backgroundImage: AssetImage('assets/images/basma.png'),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: messages.length,
//         itemBuilder: (context, index) {
//           final Message message = messages[index];
//           final bool isSentByMe = message.sender == "child"; // يمكنك تغيير "child" باسمك

//           return ChatMessage(
//             text: message.text,
//             isSentByMe: isSentByMe,
//           );
//         },
//       ),
//       bottomSheet: Container(
//         color: Colors.white,
//         child: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'اكتب رسالتك هنا',
//                 ),
//                 onSubmitted: (text) {
//                   // أضف منطق لإضافة رسالة جديدة إلى القائمة
//                   setState(() {
//                     messages.add(Message(text: text, sender: "child")); // افترض أنك أنت من يرسل الرسالة
//                   });
//                 },
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.send),
//               onPressed: () {
//                 // استدعاء دالة إرسال الرسالة
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   final String text;
//   final bool isSentByMe;

//   ChatMessage({required this.text, required this.isSentByMe});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: isSentByMe ? Colors.blue : Colors.grey[300],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(text),
//       ),
//     );
//   }
// }