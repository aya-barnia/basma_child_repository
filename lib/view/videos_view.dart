
import 'package:basma_child/helper/constant.dart';
import 'package:basma_child/view/Classes/classes_view.dart';
import 'package:flutter/material.dart';





List<String> videos = [
  'assets/1.mp4',
  'assets/1.mp4',
  // Add more video paths as needed
];

class VideosView extends StatelessWidget {
  const VideosView({super.key});

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
        leading: Image(image: AssetImage('assets/images/basma.png')),
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
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Video ${index + 1}'),
                  onTap: () {
                    // Implement action when video is tapped
                  },
                );
              },
            ),
          ),
        ],
      ),


      
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, 

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: green,
        label: const Text('طلب شرح'),
        icon: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
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
                            Text(
                              'هل تريد شرحاً إضافياً؟',
                              style: TextStyle(
                                fontSize: 20.0,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                                child:
                                    Image.asset('assets/images/question.gif')),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        TextField(
                          maxLines: 3,
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
                      child: Text(
                        'إرسال',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(green),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      ),
                      onPressed: () {
                        // Implement action when 'إرسال' is pressed (e.g., handle notes)
                        Navigator.of(context).pop(); // Close the dialog
                      },
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
}

