// import 'package:child_basma/helper/constant.dart';
// import 'package:child_basma/view/classes_view.dart';
// import 'package:child_basma/view/posts_view.dart';
// import 'package:child_basma/view/profile_view.dart';
// import 'package:flutter/material.dart';

// class home_page_view extends StatefulWidget {
//   const home_page_view({super.key});

//   @override
//   State<home_page_view> createState() => _home_page_viewState();
// }

// class _home_page_viewState extends State<home_page_view> {

//   int _selectedIndex = 1;  
//  static const List<Widget> _widgetOptions = <Widget>[  
//   ClassesView(),
//   PostsView(),
//   ProfileView(),
// ];
//   void _onItemTapped(int index) {  
//     setState(() {  
//       _selectedIndex = index;  
//     });  
// }

// Color _getSelectedColor(int index) {
//   switch (index) {
//     case 0:
//       return Color.fromARGB(225, 167, 139, 16); 
//     case 1:
//       return Color.fromARGB(255, 117, 67, 108);
//     case 2:
//       return Color.fromARGB(255, 50, 143, 177); 
//     default:
//       return Colors.black; // الافتراضي
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(  
//         actions: [IconButton(onPressed: (){}, icon:Icon(Icons.chat,color: Color.fromARGB(255, 201, 200, 200),) )],
//         title: const Text(' أهلاً بأطفالنا',style: TextStyle(color:Color.fromARGB(255, 230, 228, 228),fontStyle:FontStyle.normal,),),  
//           backgroundColor: Purple,
//           // leading:SizedBox(width: 10,child: CircleAvatar(backgroundImage:  AssetImage('assets/images/basma.png'))),leadingWidth: 40.0 ,
//     //  leading:Image(image: AssetImage('assets/images/basma.png')),
//       ),  
//       body: Center(  
//         child: _widgetOptions.elementAt(_selectedIndex),  
//       ),  
//       bottomNavigationBar: BottomNavigationBar(  
//         items: const <BottomNavigationBarItem>[  
//           BottomNavigationBarItem(  
//             icon: Icon(Icons.school),  
//              label: 'مدرسة بسمة',
//             backgroundColor: const Color.fromARGB(255, 247, 210, 41)
//           ),  
//           BottomNavigationBarItem(  
//             icon: Icon(Icons.home), 
//             label: 'مجتمع بسمة',
//             backgroundColor: const Color.fromARGB(255, 179, 113, 168)
//           ),  
//           BottomNavigationBarItem(  
//             icon: Icon(Icons.person), 
//             label: 'بروفايلي', 
//             backgroundColor: const Color.fromARGB(255, 84, 193, 234),  
//           ),  
//         ],  
//         type: BottomNavigationBarType.shifting,  
//         currentIndex: _selectedIndex,  
//         unselectedItemColor: Color.fromARGB(255, 201, 200, 200),
//         selectedItemColor: _getSelectedColor(_selectedIndex),  
//         iconSize: 40,  
//         onTap: _onItemTapped,  
//         elevation: 5  
//       ),  
//     );  
   
//   }
// }
