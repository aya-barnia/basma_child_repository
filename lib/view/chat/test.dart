// //
// // import 'package:child_basma/view/chat/cubit.dart';
// // import 'package:child_basma/view/chat/state.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// //
// // import '../../pusher_service.dart';
// //
// // class ChatScreen extends StatefulWidget {
// //   //final PusherService pusherService;
// //
// //   //ChatScreen({required this.pusherService});
// //
// //   @override
// //   _ChatScreenState createState() => _ChatScreenState();
// // }
// //
// // class _ChatScreenState extends State<ChatScreen> {
// //   final TextEditingController _controller = TextEditingController();
// //
// //   // void _sendMessage() {
// //   //   final message = _controller.text;
// //   //   if (message.isNotEmpty) {
// //   //     widget.pusherService.sendMessage(message);
// //   //     _controller.clear();
// //   //   }
// //   // }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (BuildContext context)=> ChatCubit(),
// //       child: BlocConsumer<ChatCubit, ChatState>(
// //         listener: (BuildContext context , state){},
// //         builder: (BuildContext context , state){
// //          return Scaffold(
// //           appBar: AppBar(title: Text('Chat')),
// //           body: Column(
// //             children: [
// //               Expanded(
// //                 child: ListView.builder(
// //                   itemCount: 0, // Replace with your message count
// //                   itemBuilder: (context, index) {
// //                     return ListTile(title: Text('Message here')); // Replace with your message
// //                   },
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Row(
// //                   children: [
// //                     Expanded(
// //                       child: TextField(
// //                         controller: _controller,
// //                         decoration: InputDecoration(labelText: 'Enter message'),
// //                       ),
// //                     ),
// //                     IconButton(
// //                       icon: Icon(Icons.send),
// //                       onPressed:() {
// //                         ChatCubit.get(context).sendChat(1, _controller);
// //                        }
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         );}
// //       ),
// //     );
// //   }
// // }
// //

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:laravel_flutter_pusher_plus/laravel_flutter_pusher_plus.dart';
// //
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Chat',
// //       home: ChatScreen(),
// //     );
// //   }
// // }
// //
// // class ChatScreen extends StatefulWidget {
// //   @override
// //   _ChatScreenState createState() => _ChatScreenState();
// // }
// //
// // class _ChatScreenState extends State<ChatScreen> {
// //   final TextEditingController _controller = TextEditingController();
// //   final List<String> _messages = [];
// //   late PusherClient _pusher;
// //   late Channel _channel;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _initPusher();
// //   }
// //
// //   Future<void> _initPusher() async {
// //     _pusher = PusherClient(
// //       'a1d40d932b2bd22d28ea',
// //       PusherOptions(cluster: 'eu', host: ''),
// //       lazyConnect: false,
// //     );
// //
// //     _pusher.connect();
// //
// //     _channel = _pusher.subscribe('chat-channel');
// //
// //     _channel.bind('NewMessage', (PusherEvent event) {
// //       final data = jsonDecode(event.data);
// //       setState(() {
// //         _messages.add(data['message']);
// //       });
// //     });
// //   }
// //
// //   void _sendMessage() async {
// //     if (_controller.text.isNotEmpty) {
// //       final response = await http.post(
// //         Uri.parse('http://localhost:3000/send-message'),
// //         headers: {"Content-Type": "application/json"},
// //         body: jsonEncode({"message": _controller.text}),
// //       );
// //
// //       if (response.statusCode == 200) {
// //         print('Message sent successfully');
// //         _controller.clear(); // Clear the input field after sending
// //       } else {
// //         print('Failed to send message');
// //       }
// //     }
// //   }
// //
// //   @override
// //   void dispose() {
// //     _pusher.disconnect();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Chat')),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: _messages.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: Text(_messages[index]),
// //                 );
// //               },
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: TextField(
// //                     controller: _controller,
// //                     decoration: InputDecoration(hintText: 'Enter your message'),
// //                   ),
// //                 ),
// //                 IconButton(
// //                   icon: Icon(Icons.send),
// //                   onPressed: _sendMessage,
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:basma_child/view/chat/cubit.dart';
// import 'package:basma_child/view/chat/model.dart';
// import 'package:basma_child/view/chat/state.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import '../../pusher_service.dart';

// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final PusherService pusherService = PusherService();

//   @override
//   void initState() {
//     ChatCubit.get(context).getAllChat(1);
//     super.initState();
//     pusherService.initPusher();

//     // pusherService.pusher.
//     // pusherService.pusher.bind('new_message', (event) {
//     //   final newMessage = event.data['message'];
//     //   Provider.of<ChatProvider>(context, listen: false).addMessage(newMessage);
//     // });
//   }

//   List<ChatModel> chat =[];

//   @override
//   Widget build(BuildContext context) {
//     //final chatProvider = Provider.of<ChatProvider>(context);

//     return BlocConsumer<ChatCubit , ChatState>(
//       listener: (BuildContext context , state){
//     if( state is GetAllChatState){
//       print('object 000 in listener GetAllChatState');}
//       },
//       builder: (BuildContext context , state) {
//         if(state is LoadingChatStateState){
//           return Scaffold(body: Center(child: Text('Loading')),);
//         }
//         if( state is GetAllChatState){
//           print('object 000');
//           this.chat = state.cal;
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Flutter Pusher Chat'),
//             ),
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: chat.length,
//                     itemBuilder: (context, index) =>
//                     Column(

//                       children: [
//                         chat[index].messageChild.toString().isNotEmpty && chat[index].messageAdmin.toString() =='null' ?
//                         ListTile(
//                           title: Text(chat[index].messageChild.toString()),
//                         )
//                             :
//                         ListTile(
//                           title: Text(chat[index].messageAdmin.toString()),
//                         )
//                       ],
//                     )

//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: <Widget>[
//                       Expanded(
//                         child: TextField(
//                           controller: _controller,
//                           decoration: InputDecoration(
//                               labelText: 'Send a message'),
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.send),
//                         onPressed: () {
//                           ChatCubit.get(context).sendChat(1, _controller.text);
//                           // final message = _controller.text.trim();
//                           // if (message.isNotEmpty) {
//                           //   chatProvider.sendMessage(message);
//                           //   _controller.clear();
//                           // }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//         return Scaffold();

//       }
//     );
//   }
// }

//
// import 'package:child_basma/view/chat/cubit.dart';
// import 'package:child_basma/view/chat/state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../pusher_service.dart';
//
// class ChatScreen extends StatefulWidget {
//   //final PusherService pusherService;
//
//   //ChatScreen({required this.pusherService});
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//
//   // void _sendMessage() {
//   //   final message = _controller.text;
//   //   if (message.isNotEmpty) {
//   //     widget.pusherService.sendMessage(message);
//   //     _controller.clear();
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context)=> ChatCubit(),
//       child: BlocConsumer<ChatCubit, ChatState>(
//         listener: (BuildContext context , state){},
//         builder: (BuildContext context , state){
//          return Scaffold(
//           appBar: AppBar(title: Text('Chat')),
//           body: Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: 0, // Replace with your message count
//                   itemBuilder: (context, index) {
//                     return ListTile(title: Text('Message here')); // Replace with your message
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: _controller,
//                         decoration: InputDecoration(labelText: 'Enter message'),
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.send),
//                       onPressed:() {
//                         ChatCubit.get(context).sendChat(1, _controller);
//                        }
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );}
//       ),
//     );
//   }
// }
//

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:laravel_flutter_pusher_plus/laravel_flutter_pusher_plus.dart';
//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Chat',
//       home: ChatScreen(),
//     );
//   }
// }
//
// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<String> _messages = [];
//   late PusherClient _pusher;
//   late Channel _channel;
//
//   @override
//   void initState() {
//     super.initState();
//     _initPusher();
//   }
//
//   Future<void> _initPusher() async {
//     _pusher = PusherClient(
//       'a1d40d932b2bd22d28ea',
//       PusherOptions(cluster: 'eu', host: ''),
//       lazyConnect: false,
//     );
//
//     _pusher.connect();
//
//     _channel = _pusher.subscribe('chat-channel');
//
//     _channel.bind('NewMessage', (PusherEvent event) {
//       final data = jsonDecode(event.data);
//       setState(() {
//         _messages.add(data['message']);
//       });
//     });
//   }
//
//   void _sendMessage() async {
//     if (_controller.text.isNotEmpty) {
//       final response = await http.post(
//         Uri.parse('http://localhost:3000/send-message'),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({"message": _controller.text}),
//       );
//
//       if (response.statusCode == 200) {
//         print('Message sent successfully');
//         _controller.clear(); // Clear the input field after sending
//       } else {
//         print('Failed to send message');
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     _pusher.disconnect();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Chat')),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_messages[index]),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(hintText: 'Enter your message'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

///////////////////////////////هااااااااااااااااااااااااااد

// import 'package:basma_child/helper/constant.dart';
// import 'package:basma_child/view/chat/cubit.dart';
// import 'package:basma_child/view/chat/model.dart';
// import 'package:basma_child/view/chat/state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import '../../pusher_service.dart';

// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final PusherService pusherService = PusherService();

//   @override
//   void initState() {
//     ChatCubit.get(context).getAllChat(1);
//     super.initState();
//     pusherService.initPusher();

//     // pusherService.pusher.
//     // pusherService.pusher.bind('new_message', (event) {
//     //   final newMessage = event.data['message'];
//     //   Provider.of<ChatProvider>(context, listen: false).addMessage(newMessage);
//     // });
//   }

//   List<ChatModel> chat =[];

//   @override
//   Widget build(BuildContext context) {
//     // final chatProvider = Provider.of<ChatProvider>(context);

//     return BlocConsumer<ChatCubit , ChatState>(
//       listener: (BuildContext context , state){
//     if( state is GetAllChatState){
//       print('object 000 in listener GetAllChatState');}
//       },
//       builder: (BuildContext context , state) {
//         if(state is SendSuccess){
//           // return Scaffold(body: Center(child: Text('Loading')),);

//         }

//         if(state is LoadingChatStateState){
//           return Scaffold(body: Center(child: Text('Loading')),);
//         }
//         if( state is GetAllChatState){
//           print('object 000');
//           this.chat = state.cal;
//           return Scaffold(
//             appBar: AppBar(
//               title: Center(child: Text('تواصل معنا',style: TextStyle(color: Purple),)),
//                leading: Image(image: AssetImage('assets/images/basma.png')),
//               backgroundColor: yellow,
//             ),
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: chat.length,
//                     itemBuilder: (context, index) =>
//                     Column(

//                       children: [
//                         chat[index].messageChild.toString().isNotEmpty && chat[index].messageAdmin.toString() =='null' ?
//                         ListTile(
//                           title: Text(chat[index].messageChild.toString()),
//                         )
//                             :
//                         ListTile(
//                           title: Text(chat[index].messageAdmin.toString()),
//                         )
//                       ],
//                     )

//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Directionality(
//                     textDirection: TextDirection.rtl,
//                     child: Row(
//                       children: <Widget>[
//                         Expanded(
//                           child: TextField(

//                             controller: _controller,
//                             decoration: InputDecoration(
//                       hintText: '    اكتب رسالتك هنا ',
//                     ),
//                           ),
//                         ),
//                         IconButton(
//                          icon: Icon(Icons.send, color: green),
//                           onPressed: () {
//                             ChatCubit.get(context).sendChat(1, _controller.text);
//                             // final message = _controller.text.trim();
//                             // if (message.isNotEmpty) {
//                             //   chatProvider.sendMessage(message);
//                             //   _controller.clear();
//                             // }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//         return Scaffold();

//       }
//     );
//   }
// }

import 'package:basma_child/helper/constant.dart';
import 'package:basma_child/view/chat/cubit.dart';
import 'package:basma_child/view/chat/model.dart';
import 'package:basma_child/view/chat/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../pusher_service.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final PusherService pusherService = PusherService();

  @override
  void initState() {
    ChatCubit.get(context).getAllChat(1);
    super.initState();
    pusherService.initPusher();
  }

  List<ChatModel> chat = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (BuildContext context, state) {
        if (state is GetAllChatState) {
          print('object 000 in listener GetAllChatState');
        }
      },
      builder: (BuildContext context, state) {
        if (state is SendSuccess) {
          // return Scaffold(body: Center(child: Text('Loading')),);
              ChatCubit.get(context).getAllChat(1);


        }

        if (state is LoadingChatStateState) {
          return Scaffold(appBar: AppBar(
              title: Center(
                  child: Text('تواصل معنا', style: TextStyle(color: Purple))),
              leading: Image(image: AssetImage('assets/images/basma.png')),
              backgroundColor: yellow,
            ),body: Center(child: CircularProgressIndicator(color: yellow,)));
        }

        if (state is GetAllChatState) {
          this.chat = state.cal;
          return Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text('تواصل معنا', style: TextStyle(color: Purple))),
              leading: Image(image: AssetImage('assets/images/basma.png')),
              backgroundColor: yellow,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: chat.length,
                      itemBuilder: (context, index) => Row(
                        mainAxisAlignment:
                            chat[index].messageChild.toString().isNotEmpty &&
                                    chat[index].messageAdmin.toString() == 'null'
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                        children: [
                          if (chat[index].messageChild.toString().isNotEmpty &&
                              chat[index].messageAdmin.toString() == 'null')
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(16.0),
                                  color: yellow,
                                  child:
                                      Text(chat[index].messageChild.toString()),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          if (chat[index].messageAdmin.toString() != 'null')
                            Column(
                              children: [
                                Container(
                                  
                                  padding: EdgeInsets.all(16.0),
                                  color: green,
                                  child:
                                      Text(chat[index].messageAdmin.toString()),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: '    اكتب رسالتك هنا ',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.send, color: green),
                            onPressed: () {
                              ChatCubit.get(context)
                                  .sendChat(1, _controller.text);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold();
      },
    );
  }
}
