
import 'dart:io';



import 'package:basma_child/helper/constant.dart';
import 'package:basma_child/view/Classes/classes_view.dart';
import 'package:basma_child/view/Classes/cubit_class.dart';
import 'package:basma_child/view/Login/auth.dart';
import 'package:basma_child/view/Posts/all_cubit.dart';
import 'package:basma_child/view/add_post_view.dart';
import 'package:basma_child/view/chat/cubit.dart';
import 'package:basma_child/view/chat/test.dart';
import 'package:basma_child/view/chat_view.dart';
import 'package:basma_child/view/posts_view.dart';
import 'package:basma_child/view/profile_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async{

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthLogin(),
      routes: {
        '/add_post_view': (context) => add_post_view(),
        '/posts_view': (context) => PostsView(),
        //  '/home_page_view': (context) => HomePageView(),
        '/main': (context) => MyHomePage(),
        //'/subjects_view': (context) => SubjectsView(),
        //'/lessons_view': (context) => LessonsView(),
        //         '/videos_view': (context) => VideosView(),
        // '/profile': (context) => ProfileView(),
        '/chat_view': (context) => ChatView(),
                '/test': (context) => ChatScreen(),


      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

@override
  void initState() {
  // AllPostsCubit.get(context).getShowUserInfo();


}

  int _selectedIndex = 1;

  Color _getSelectedColor(int index) {
    switch (index) {
      case 0:
        return green2;
      case 1:
        return Purple2;
      case 2:
        return blue2;
      default:
        return Colors.black; // الافتراضي
    }
  }

  String _getSelectedTitle(int index) {
    return _titles[index];
  }

  static const List<String> _titles = <String>[
    'مدرسة بسمة',
    'مجتمع بسمة',
    'حسابي',
  ];







  final List<Widget> _pages = [


      BlocProvider(create: (BuildContext context)=> ClassesCubit() ,
    child: ClassesView(),
    ),
    BlocProvider(create: (BuildContext context)=> AllPostsCubit() ,
    child: PostsView(),
    ),

     BlocProvider(create: (BuildContext context)=> AllPostsCubit() , 
    child: ProfileView(),
    ),
    
    
    
    //ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 1,
        actions: [
          IconButton(
            onPressed: () {
              
              //  Navigator.of(context).pushNamed('/chat_view');
                            //  Navigator.of(context).pushNamed('/test');

              Navigator.push(context, MaterialPageRoute(builder: (context)=>BlocProvider(
                create: (BuildContext context)=> ChatCubit() ,
              child: ChatScreen())));
            },
            icon: Icon(
              Icons.chat,
              color: yellow,
            ),
          )
        ],
        title: Center(
          child: Text(
            _getSelectedTitle(_selectedIndex),
            style: TextStyle(
              color: yellow,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        backgroundColor: _getSelectedColor(_selectedIndex), // تغيير لون AppBar
        leading: Image(image: AssetImage('assets/images/basma.png')),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        // استخدام CurvedNavigationBar بدلاً من BottomNavigationBar
        items: const <Widget>[
          Icon(Icons.school, color: const Color.fromARGB(255, 232, 213, 128)),
          Icon(Icons.home, color: const Color.fromARGB(255, 232, 213, 128)),
          Icon(Icons.person, color: const Color.fromARGB(255, 232, 213, 128)),
        ],
        index: _selectedIndex,
        height: 50,
        color: _getSelectedColor(
            _selectedIndex), // تغيير لون الـ CurvedNavigationBar
        backgroundColor: Colors.transparent,
    
        buttonBackgroundColor: _getSelectedColor(
            _selectedIndex), // تغيير لون الـ CurvedNavigationBar
        onTap: _onItemTapped,
      ),
    );
  }
}
