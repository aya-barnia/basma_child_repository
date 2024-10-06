

import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:basma_child/helper/constant.dart';
import 'package:basma_child/main.dart';
import 'package:basma_child/view/Posts/model_posts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'Posts/all_cubit.dart';
import 'Posts/all_state.dart';

class add_post_view extends StatefulWidget {
  @override
  _PostCreationScreenState createState() => _PostCreationScreenState();
}

class _PostCreationScreenState extends State<add_post_view> {
  TextEditingController _textEditingController = TextEditingController();

  File? _image;

  void _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  File? imagePost;

  Future<void> loadAssetImage() async {
    final byteData = await rootBundle.load('assets/images/page.png');
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/page.png');
    await tempFile.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
    setState(() {
      imagePost = tempFile;
    });
  }

  @override
  void initState() {
    super.initState();
    loadAssetImage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context )  => AllPostsCubit(),
      child: BlocConsumer<AllPostsCubit , AllPostsState>(
        listener: (BuildContext context , Object state){
          if(state is WaitAddPost2){
            Flushbar(
              duration: Duration(seconds: 3),
              backgroundColor: Purple,
              message: 'بانتظار قبول المنشور',
            ).show(context);
          }
          if(state is WaitAddPost){
            print('ooo'); 
            print('wait to accept');           
            Navigator.push(context,
            MaterialPageRoute(
              builder:(context)=>  MyHomePage()),
              );

            
          }
        },
        builder: (BuildContext context , Object state){
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.chat,
                  color: yellow,
                ),
              )
            ],
            title: Center(
              child: const Text(
                'شاركنا نشاطاتك ',
                style: TextStyle(
                  color: const Color.fromARGB(255, 232, 213, 128),
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            backgroundColor: Purple, // تغيير لون AppBar
            leading: Image(image: AssetImage('assets/images/basma.png')),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    controller: _textEditingController,
                    maxLines: 4,
                    textAlign: TextAlign.right, // تعيين النص في اليمين
                    decoration: InputDecoration(
                      hintText: '... بماذا تفكر',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true, // توجيه النص مع التلميح
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    color: const Color.fromARGB(255, 232, 230, 230),
                    child: _image == null
                        ? IconButton(
                            onPressed: _pickImage,
                            icon: Icon(Icons.add_a_photo, color: Purple2),
                          )
                        : Image.file(
                            _image!,
                            // fit: BoxFit.fitWidth,
                          ),
                    alignment: Alignment.center,
                  ),
                    SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                    //  Navigator.of(context).pushNamed('/posts_view');
                                       // Navigator.of(context).pushNamed('/main');
                      


    if (_textEditingController.text.isEmpty && _image == null) {
      // عرض رسالة خطأ باستخدام Flashbar
      Flushbar(
        message: 'يجب إدخال نص أو اختيار صورة على الأقل',
        duration: Duration(seconds: 3),
        backgroundColor: Purple,
      ).show(context);
      
    } 
  // ... باقي خصائص الزر








                      if(_image == null){
                        PostsModel postsModel  = PostsModel(
                          // user_id: ,
                          text: _textEditingController.text,
                          imagePost: imagePost,

                        );
                        AllPostsCubit.get(context).addPostsCubit(postsModel);

                      }else {
                        PostsModel postsModel  = PostsModel(
                          // user_id: ,
                          text: _textEditingController.text,
                          imagePost: _image,

                        );
                        AllPostsCubit.get(context).addPostsCubit(postsModel);

                      }
        

                    },
                    child: Text('نشر'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          yellow), // تحديد لون الخلفية
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Purple2), // تحديد لون النص
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(fontSize: 20), // تحديد حجم النص
                      ),
                    ),
                  ),
                
                  SizedBox(height: 20),
                  Image(image: AssetImage('assets/images/thinking2.gif')),
                ],
              ),
            ),
          ),
        );}
      ),
    );
  }
}






// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class AddPostView extends StatefulWidget {
//   @override
//   _AddPostViewState createState() => _AddPostViewState();
// }

// class _AddPostViewState extends State<AddPostView> {
//   TextEditingController _textEditingController = TextEditingController();
//   File? _image;

//   void _pickImage() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _image = File(image.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.chat,
//               color: Colors.yellow,
//             ),
//           )
//         ],
//         title: Center(
//           child: const Text(
//             'أهلاً بأطفالنا',
//             style: TextStyle(
//               color: Color.fromARGB(255, 230, 228, 228),
//               fontStyle: FontStyle.normal,
//             ),
//           ),
//         ),
//         backgroundColor: Colors.purple, // تغيير لون AppBar
//         leading: Image(image: AssetImage('assets/images/basma.png')),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               TextField(
//                 controller: _textEditingController,
//                 maxLines: 4,
//                 textAlign: TextAlign.right, // تعيين النص في اليمين
//                 decoration: InputDecoration(
//                   hintText: '... بماذا تفكر',
//                   border: OutlineInputBorder(),
//                   alignLabelWithHint: true, // توجيه النص مع التلميح
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 height: 200,
//                 color: const Color.fromARGB(255, 232, 230, 230),
//                 child: Stack(
//                   children: [
//                     if (_image != null)
//                       Positioned.fill(
//                         child: Image.file(
//                           _image!,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     IconButton(
//                       onPressed: _pickImage,
//                       icon: Icon(
//                         Icons.add_a_photo,
//                         color: Colors.purple,
//                       ),
//                     ),
//                   ],
//                 ),
//                 alignment: Alignment.center,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text('نشر'),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(
//                       Colors.yellow), // تحديد لون الخلفية
//                   foregroundColor: MaterialStateProperty.all<Color>(
//                       Colors.purple), // تحديد لون النص
//                   textStyle: MaterialStateProperty.all<TextStyle>(
//                     TextStyle(fontSize: 20), // تحديد حجم النص
//                   ),
//                 ),
//               ),
//               Image(image: AssetImage('assets/images/thinking2.gif')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }