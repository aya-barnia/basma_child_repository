
import 'package:basma_child/helper/constant.dart';
import 'package:basma_child/view/Classes/classes_model.dart';
import 'package:basma_child/view/Classes/cubit_class.dart';
import 'package:basma_child/view/Classes/state_class.dart';
import 'package:basma_child/view/Subject/subjects_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


final List<Color> colors = [yellow, green, blue,Purple];

class ClassesView extends StatefulWidget {
  const ClassesView({super.key});

  @override
  State<ClassesView> createState() => _ClassesViewState();
}

class _ClassesViewState extends State<ClassesView> {


  List<ClassModel> classes =[];
  @override
  void initState() {

    super.initState();

    ClassesCubit.get(context).getAllClasses();

  }

  @override
  Widget build(BuildContext context) {




const gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2, // عدد الأعمدة في الشبكة
  mainAxisSpacing: 20.0, // المسافة بين العناصر في الاتجاه الرئيسي (عمودياً)
  crossAxisSpacing: 20.0, // المسافة بين العناصر في الاتجاه العرضي (أفقياً)
  childAspectRatio: 1, // نسبة العرض إلى الارتفاع لكل عنصر
);


    return BlocConsumer<ClassesCubit, ClassesState>(
      listener: (BuildContext context , state){
        if(state is GetAllSubject){

          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SubjectsView(state.cal)));
        }

      },
      builder: (BuildContext context , Object state){
        if(state is LoadingClassState){
          return Scaffold(
            // body: Center(child: Text('Loading'),),
            body: Center(
              child: Image(image: AssetImage('assets/images/green_heart.gif')),
            ),
          );
        }
        if(state is GetAllClasses){
          this.classes = state.cal;
      return Scaffold(
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
                  SizedBox(width:40 ,),
                  Text('هيا لنتعلم معاً',style: TextStyle(color: yellow,fontWeight: FontWeight.bold,fontSize: 30),),
                  Expanded(child: Image.asset('assets/images/pencel.gif')),

                ],
              ),

            ],
          ),

            Expanded(


            child :GridView.builder(
              gridDelegate: gridDelegate,
              itemCount: classes.length,
              itemBuilder: (BuildContext context, int index) {
            final currentClass = classes[index];
            // تحديد الصورة بناءً على الفهرس index
            final imageUrl = 'assets/images/${index + 1}.png';
                final colorIndex = index % colors.length; // حساب فهرس اللون باستخدام القسمة المتبقية

            return ClassWidget(
              // color: yellow,
                    color: colors[colorIndex], // استخدام اللون المحدد من القائمة

              imageUrl: imageUrl,
              text: classes[index].name.toString(),
              id : classes[index].id,
            );
              },
            ),



            )

        ],
      )
      );
      }
         return Scaffold(
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
                  SizedBox(width:40 ,),
                  Text('هيا لنتعلم معاً',style: TextStyle(color: yellow,fontWeight: FontWeight.bold,fontSize: 30),),
                  Expanded(child: Image.asset('assets/images/pencel.gif')),

                ],
              ),

            ],
          ),

      Expanded(


      child :GridView.builder(
        gridDelegate: gridDelegate,
        itemCount: classes.length,
        itemBuilder: (BuildContext context, int index) {
              final currentClass = classes[index];
              // تحديد الصورة بناءً على الفهرس index
              final imageUrl = 'assets/images/${index + 1}.png';
                  final colorIndex = index % colors.length; // حساب فهرس اللون باستخدام القسمة المتبقية

              return ClassWidget(
                // color: yellow,
                      color: colors[colorIndex], // استخدام اللون المحدد من القائمة

                imageUrl: imageUrl,
                text: classes[index].name.toString(),
                id : classes[index].id,
              );
                },
      ),



      )

        ],
      )
      );
      });
  }
}

class TsClip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 50);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height - 100, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}






class ClassWidget extends StatelessWidget {
  const ClassWidget({
    Key? key,
    required this.color,
    required this.imageUrl,
    required this.text,
    required this.id,
  }) : super(key: key);

  final Color color;
  final String imageUrl;
  final String text;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: () {
      print('pppppppppppppppppppppp');
        print(id);
        print(id);
           ClassesCubit.get(context).getSubject(id);

          // if(index == 0){
          //  ClassesCubit.get(context).getSubject(1.toInt());
          // }
          //  if(index == 1){
          //  ClassesCubit.get(context).getSubject(2.toString());
          // }
          //  if(index == 3){
          //  ClassesCubit.get(context).getSubject(4);
          // }
          //  if(index == 4){
          //  ClassesCubit.get(context).getSubject(5);
          // }
          //  if(index == 5){
          //  ClassesCubit.get(context).getSubject(6);
          // }
          //  if(index == 6){
          //  ClassesCubit.get(context).getSubject(7);
          // }
          //  if(index == 7){
          //  ClassesCubit.get(context).getSubject(8.toInt());
          // }
          //  if(index == 8){
          //  ClassesCubit.get(context).getSubject(9);
          // }
          //  if(index == 9){
          //  ClassesCubit.get(context).getSubject(10);
          // }
          //  if(index == 10){
          //  ClassesCubit.get(context).getSubject(11);
          // }
          //  if(index == 11){
          //  ClassesCubit.get(context).getSubject(12);
          // }

        
         //Navigator.of(context).pushNamed('/subjects_view');

     },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
backgroundColor: Colors.white.withOpacity(0.5),
              backgroundImage: AssetImage(imageUrl), // استخدام رابط الصورة
              radius: 40,
            ),
            const SizedBox(height: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
