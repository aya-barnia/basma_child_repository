import 'package:basma_child/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../Posts/all_cubit.dart';
import 'login_cubit.dart';
import 'login_view.dart';
// class AuthLogin extends StatefulWidget {
//   const AuthLogin({Key? key}) : super(key: key);

//   @override
//   State<AuthLogin> createState() => _AuthLoginState();
// }

// class _AuthLoginState extends State<AuthLogin> {

//   String? token;
//   String? name;
//   String? image;
//   bool initial = false;

//   @override
//   Widget build(BuildContext context) {

//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;

//     if(initial == true){
//       SharedPreferences.getInstance().then((shard){
//         setState(() {
//           initial = true;
//           token = shard.getString("saveToken");
//           // print("ttttttt"+token!);
//           // print('***********');
//         });
//       });
//       // return CircularProgressIndicator();
//       return Scaffold(
//         body: Stack(
//           children: [
//             Container(
//               width: w,
//               height: h,
//               color: Colors.white,
//             ),
//             const Center(
//               child: Text(
//                 "Welcome Back",
//                 style: TextStyle(
//                   color: Colors.blue,
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//       // return Stack(children:[ LoginView()]);
//     }else {
//       if(token == null){
//         return BlocProvider(
//           create: (context) => LoginCubit(),
//           child:  LoginView(),
//         );
//       } else {
//         SharedPreferences.getInstance().then((shard){
//           setState(() {
//             name = shard.getString("saveName");
//             // print("ttttttt "+name!);
//             // print('***********');
//             ProfileView v = ProfileView();
//             v.name = this.name;
//           });
//         });
//         SharedPreferences.getInstance().then((shard){
//           setState(() {
//             image = shard.getString("saveImage");
//             // print("ttttttt "+image!);
//             // print('***********');
//             ProfileView v = ProfileView();
//             v.image = this.image;
//           });
//         });
//         return BlocProvider(
//           create: (BuildContext context) => AllPostsCubit(),
//           child:  MyHomePage(),
//         );
//       }
//     }

//   }
// }

//////////////////////////////////////////////////////////






class AuthLogin extends StatefulWidget {
  const AuthLogin({Key? key}) : super(key: key);

  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {

  String? token;
  String? name;
  String? image;
  bool initial = true;

  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    if(initial == true){
      SharedPreferences.getInstance().then((shard){
        setState(() {
          initial = false;
          token = shard.getString("saveToken");
          // print("ttttttt"+token!);
          // print('***********');
        });
      });
      // return CircularProgressIndicator();
      return Scaffold(
        body: Stack(
          children: [
            Container(
              width: w,
              height: h,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Welcome Back",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      );
    }else {
      if(token == null){
        return BlocProvider(
          create: (context) => LoginCubit(),
          child:  LoginView(),
        );
      } else {
        SharedPreferences.getInstance().then((shard){
          setState(() {
            name = shard.getString("saveName");
            // print("ttttttt "+name!);
            // print('***********');
            ProfileView v = ProfileView();
            v.name = this.name;
          });
        });
        SharedPreferences.getInstance().then((shard){
          setState(() {
            image = shard.getString("saveImage");
            // print("ttttttt "+image!);
            // print('***********');
            ProfileView v = ProfileView();
            v.image = this.image;
          });
        });
        return BlocProvider(
          create: (BuildContext context) => AllPostsCubit(),
          child:  MyHomePage(),
        );
      }
    }

  }
}
