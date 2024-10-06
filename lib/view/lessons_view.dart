import 'package:basma_child/helper/constant.dart';
import 'package:basma_child/view/Classes/classes_view.dart';
import 'package:basma_child/view/Classes/title_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Video/video_cubit.dart';
import 'Video/videos_view.dart';

class LessonsView extends StatefulWidget {
  var subId;
  List<TitleSub> titlee = [];

  LessonsView(subIdArg, titleArg) {
    subId = subIdArg;
    titlee = titleArg;
  }

  @override
  State<LessonsView> createState() => _LessonsViewState();
}

class _LessonsViewState extends State<LessonsView> {
  @override
  Widget build(BuildContext context) {
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
              itemCount: widget.titlee.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      widget.titlee;

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => BlocProvider(
                                  create: (BuildContext context) =>
                                      VideoCubit(),
                                  child: VideosView(
                                      widget.subId, widget.titlee[index].id))));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListTile(
                          tileColor: Colors.grey.shade100, // لون خلفية الـ ListTile
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // حواف دائرية
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: yellow,
                          ),
                          title: Text(
                            widget.titlee[index].name.toString(),
                            style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Purple),
                          ),
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
