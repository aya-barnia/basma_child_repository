import 'package:another_flushbar/flushbar.dart';
import 'package:basma_child/helper/constant.dart';
import 'package:basma_child/view/Classes/classes_view.dart';
import 'package:basma_child/view/Video/Video_model.dart';
import 'package:basma_child/view/Video/video_cubit.dart';
import 'package:basma_child/view/Video/video_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Video.dart';

class VideosView extends StatefulWidget {
  var subId;
  var titleId;

  VideosView(subIdArg, titleArg) {
    subId = subIdArg;
    titleId = titleArg;
  }

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  TextEditingController text = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // VideoCubit.get(context).orderExplanationsByTitle(widget.titleId);
    BlocProvider.of<VideoCubit>(context)
        .orderExplanationsByTitle(widget.titleId);
  }

  List<VideoModel> dd = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoCubit, VideoState>(
        listener: (BuildContext context, Object state) {
      if (state is OrderSuccess) {
        Navigator.pop(context);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (BuildContext context) => VideoCubit(),
                    child: VideosView(widget.subId, widget.titleId))));
        Flushbar(
          duration: Duration(seconds: 3),
          message: ' تم إرسال طلب الشرح',
          backgroundColor: green,
        ).show(context);
      }
    }, builder: (BuildContext context, Object state) {
      if (state is LoadingState) {
        return Scaffold(

          // body: Text('Loading'),
          body: Center(child: Image(image: AssetImage('assets/images/green_heart.gif')),),
        );
      }
      if (state is VideoSuccess) {
        this.dd = state.vid;
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
            leading: const Image(image: AssetImage('assets/images/basma.png')),
            backgroundColor: green2,
            title: Center(
              child: Text(
                'مدرسة بسمة',
                style: TextStyle(
                  color: yellow,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: TsClip2(),
                    child: Container(
                      color: green2,
                      height: 200,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 40),
                      Text(
                        'هيا لنتعلم معاً',
                        style: TextStyle(
                          color: yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Expanded(
                        child: Image.asset('assets/images/pencel.gif'),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: dd.length, //videos.length,
                  itemBuilder: (context, index) {
                    // return ListTile(
                    //   title: Text(dd[index].title.toString()),
                    //   onTap: () {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(
                    //             builder: (BuildContext context) => VideoPlayerScreen(publicId: dd[index].video)//VideoScreen()
                    //         )
                    //     );

                    //     // Implement action when video is tapped
                    //   },
                    // );
                    /////////////////
                    ///////////////////////////////////////
                    ////
                    //
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        leading: Icon(
                          Icons.video_library,
                          color: Purple, // استخدام لون مناسب للأيقونة
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: yellow, // استخدام لون مناسب للأيقونة
                        ),
                        title: Text(
                          dd[index].title.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black, // استخدام لون مناسب للنص
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  VideoPlayerScreen(
                                publicId: dd[index].video,
                              ),
                            ),
                          );
                      
                        },
                        tileColor: Colors.grey.shade100, // لون خلفية الـ ListTile
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // حواف دائرية
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, // تعديل الحشوة الداخلية
                          vertical: 8.0,
                        ),
                        selectedTileColor:
                            Colors.grey.shade200, // لون الخلفية عند التحديد
                        selected: false, // يمكنك تعديل هذا بناءً على الحالة
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: green,
            label: const Text('طلب شرح'),
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext _) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: AlertDialog(
                      backgroundColor: Colors.grey.shade100,
                      title: Text(
                        'طلب شرح',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: green2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Row(
                              children: [
                                const Text(
                                  'هل تريد شرحاً إضافياً؟',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                    child: Image.asset(
                                        'assets/images/question.gif')),
                              ],
                            ),
                            const SizedBox(height: 15.0),
                            TextField(
                              maxLines: 3,
                              controller: text,
                              decoration: InputDecoration(
                                hintText: 'اكتب ملاحظاتك هنا...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(green),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                          ),
                          onPressed: () {
                            VideoCubit.get(context).orderExplanations(
                                widget.subId, widget.titleId, text.text);

                            // Implement action when 'إرسال' is pressed (e.g., handle notes)
                            // Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text(
                            'إرسال',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      }
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
            leading: const Image(image: AssetImage('assets/images/basma.png')),
            backgroundColor: green2,
            title: Center(
              child: Text(
                'مدرسة بسمة',
                style: TextStyle(
                  color: yellow,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        body: Center(child: Text('!! لا يوجد دروس مرفوعة , بإمكانك أن تطلب شرحاً',
        style: TextStyle(color: green,fontWeight: FontWeight.bold),)),
           floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: green,
            label: const Text('طلب شرح'),
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext _) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: AlertDialog(
                      backgroundColor: Colors.grey.shade100,
                      title: Text(
                        'طلب شرح',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: green2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Row(
                              children: [
                                const Text(
                                  'هل تريد شرحاً إضافياً؟',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                    child: Image.asset(
                                        'assets/images/question.gif')),
                              ],
                            ),
                            const SizedBox(height: 15.0),
                            TextField(
                              maxLines: 3,
                              controller: text,
                              decoration: InputDecoration(
                                hintText: 'اكتب ملاحظاتك هنا...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(green),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                          ),
                          onPressed: () {
                            VideoCubit.get(context).orderExplanations(
                                widget.subId, widget.titleId, text.text);

                            // Implement action when 'إرسال' is pressed (e.g., handle notes)
                            // Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text(
                            'إرسال',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
      );
    });
  }
}
