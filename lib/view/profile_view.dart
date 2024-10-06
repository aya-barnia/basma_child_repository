import 'package:another_flushbar/flushbar.dart';
import 'package:basma_child/helper/constant.dart';
import 'package:basma_child/view/Posts/api_posts.dart';
import 'package:basma_child/view/Posts/model_posts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login/login_view.dart';
import 'Posts/all_cubit.dart';
import 'Posts/all_state.dart';

class ProfileView extends StatefulWidget {
  String? name;
  String? image;

  @override
  _PostsViewState createState() => _PostsViewState();
}

class _PostsViewState extends State<ProfileView> {
  final ScrollController _scrollController = ScrollController();
  bool _showReadMoreButton = false;

  Widget getCategoryText(String category) {
    Color textColor;
    Color backgroundColor;

    switch (category) {
      case 'story':
        textColor = Colors.black;
        backgroundColor = yellow;
        break;
      case 'activity':
        textColor = Colors.white;
        backgroundColor = green;
        break;
      case 'other':
        textColor = Colors.white;
        backgroundColor = Purple;
        break;
      default:
        textColor = Colors.black;
        backgroundColor = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        category,
        style: TextStyle(color: textColor),
      ),
    );
  }

  // File? _image;

  ApiPosts api = ApiPosts();

  // dynamic name ;
  //  dynamic image ;

  @override
  void initState() {
    getName();
    getImage();

    // BlocProvider.of<AllPostsCubit>(context).getMyPosts();
    AllPostsCubit.get(context).getMyPosts();
    // AllPostsCubit.get(context).getShowUserInfo(userId);
    super.initState();
    _scrollController.addListener(_scrollListener);
    // تحديث قيمة _showReadMoreButton عند تحميل الصفحة للمرة الأولى
  }

  void _scrollListener() {
    // تحديث قيمة _showReadMoreButton عندما يتم التمرير في القائمة
    _updateShowReadMoreButton(_scrollController.position);
  }

  void _updateShowReadMoreButton(ScrollPosition position) {
    if (position.pixels == position.maxScrollExtent) {
      setState(() {
        _showReadMoreButton = true;
      });
    } else {
      setState(() {
        _showReadMoreButton = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String? name2;

  getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? getName = await prefs.getString('saveName');
    print(getName);

    setState(() => name2 = getName!);
    // v.name = name2;
    // v.getName(name2);
  }

  String? image2;

  getImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? getImage2 = await prefs.getString('saveImage');
    print(getImage2);

    setState(() => image2 = getImage2!);
    // v.image=image2;
    // v.getImage(image2);
  }

  List<PostsModel> po = [];
  dynamic user;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllPostsCubit, AllPostsState>(
        listener: (BuildContext context, Object state) {
      if (state is DeleteSuccessState) {
        // Flushbar(
        //   duration: Duration(seconds: 3),
        //   message: "Delete Successfuly.",
        // ).show(context);

        Flushbar(
          duration: Duration(seconds: 3),
          messageText: Text(
            "تم حذف منشورك",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: blue, // اللون المعرف في مشروعك
        ).show(context);

        // Navigator.push(context, MaterialPageRoute(
        //   builder: (BuildContext context) => BlocProvider(
        //     create: (BuildContext context )=>AllPostsCubit(),
        //     child: ProfileView()) ));
      }
      if (state is LogOutSuccessState) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => LoginView()));
      }
    }, builder: (BuildContext context, state) {
      if (state is DeleteSuccessState) {
        // String? name = await api.getUserNamePref() ;
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Directionality(
                textDirection: TextDirection.rtl,

                ///////////////////////////////////////////
                ///
                ///
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(image2.toString()),
                  ),
                  title: Text(
                    name2.toString(),
                    style: TextStyle(
                      color: blue2,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Adjust the radius as needed
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        AllPostsCubit.get(context).logOut();
                      },
                      icon: Icon(Icons.logout,color: green,)),
                ),
                // child: ListTile(
                //   contentPadding:
                //       EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                //   tileColor: Colors.blue[50], // لون خلفية الـ ListTile
                //   leading: Icon(
                //     Icons.star,
                //     color: Colors.orange,
                //     size: 40.0,
                //   ),
                //   title: Text(
                //     'Title',
                //     style: TextStyle(
                //       color: Colors.blue,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20.0,
                //     ),
                //   ),
                //   subtitle: Text(
                //     'Subtitle',
                //     style: TextStyle(
                //       color: Colors.grey[700],
                //       fontSize: 16.0,
                //     ),
                //   ),
                //   trailing: Icon(
                //     Icons.arrow_forward_ios,
                //     color: Colors.grey,
                //     size: 20.0,
                //   ),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(15.0),
                //     side: BorderSide(color: Colors.blue, width: 1),
                //   ),
                //   onTap: () {
                //     // التعامل مع النقر
                //   },
                // ),

                ///////////////////////////////////////////////////////////
                ///
              ),
              Divider(
                color: blue2,
                thickness: 4,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(Duration(seconds: 3));
                    AllPostsCubit.get(context).getMyPosts();
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: po.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                             getCategoryText(po[index].postCategory),
                             SizedBox(width: 200,),
                              Text(po[index].name.toString()),
                              const SizedBox(width: 10),
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    po[index].image_profile_path.toString()),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Divider(
                                color: blue2,
                                thickness: 5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                            //   Padding(
                            //   padding: const EdgeInsets.only(left: 10),
                            //   /////////////////////////////////////////////////
                            //   // child: Text(po[index].postCategory),
                            //   child: getCategoryText(po[index].postCategory),

                            //   ////////////////////////////
                            // ),
                            ],
                          ),
                          //if (po[index].text != null)
                          Text(
                            po[index].text!,
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(height: 10),
                          //if (po[index].imagePathPost != null)
                          ///////////////////////////////herrrrrrrrrrrrrrrrre
                          Image(image: NetworkImage(po[index].imagePathPost!)),

                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  AllPostsCubit.get(context)
                                      .deletePost(po[index].id);
                                  // وظيفة الضغط على أيقونة الحذف
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: po[index].likeCount == null
                                        ? Text('0')
                                        : Text(po[index].likeCount.toString(),style: TextStyle(color: blue,fontWeight: FontWeight.bold),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    // child: Text(': عدد الإعجابات'),
                                    child: CircleAvatar(
                                      child: Image(
                                    image:
                                        AssetImage('assets/images/heart.gif'),
                                  )),
                                  ),
                                  // IconButton(
                                  //   onPressed: () {
                                  //     // وظيفة الضغط على أيقونة القلب
                                  //   },
                                  //   icon: Icon(
                                  //     post.isLiked ? Icons.favorite : Icons.favorite_border,
                                  //     color: post.isLiked ? Colors.red : Colors.grey,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          // WavyDivider(),
                          // Image.asset('assets/images/green divider.gif')
                          Divider(color: yellow,thickness: 4,)
                        ],
                      );
                    },
                  ),
                ),
              ),
              if (_showReadMoreButton)
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'قراءة المزيد',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
            ],
          ),
        );
      }
      if (state is LoadingStateForName) {
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  // tileColor: Colors.grey.shade300,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(image2.toString()),
                  ),
                  title: Text(
                    name2.toString(),
                    style: TextStyle(
                      color: blue2,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Adjust the radius as needed
                  ),
                  trailing: IconButton(
                 
                      onPressed: () {
                        AllPostsCubit.get(context).logOut();
                      },
                      icon: Icon(Icons.logout,color: green),),
                ),
              ),
              Divider(
                color: blue2,
                thickness: 4,
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          ),
        );
      }
      if (state is LoadingState) {
        return CircularProgressIndicator();
        // return Scaffold(
        //   body: Center(
        //     child: Image(image: AssetImage('assets/images/basma.png')),

        //   ),
        // );
      }
      if (state is GetMyPostsState) {
        this.po = state.po;
        print(name2);
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  // tileColor: Colors.grey.shade300,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(image2.toString()),
                  ),
                  title: Text(
                    name2.toString(),
                    style: TextStyle(
                      color: blue2,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Adjust the radius as needed
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        AllPostsCubit.get(context).logOut();
                      },
                      icon: Icon(Icons.logout,color: green)),
                ),
              ),

              Divider(
                color: blue2,
                thickness: 4,
              ),

              const SizedBox(
                height: 10,
              ),

              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: po.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [
                             getCategoryText(po[index].postCategory),
                             SizedBox(width: 200,),
                            Text(
                              po[index].name.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: blue2,
                                // shadows: [
                                //   Shadow(
                                //     blurRadius: 10.0,
                                //     color: Colors.blue.withOpacity(0.5),
                                //     offset: Offset(0.5, 0.5),
                                //   ),
                                // ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                po[index].image_profile_path.toString(),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                           
                          ],
                        ),
                        Divider(
                                color: blue2,
                                thickness: 1,
                              ),
                        const SizedBox(height: 10),
                         
                        Row(
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 10),
                            //   /////////////////////////////////////////////////
                            //   // child: Text(po[index].postCategory),
                            //   child: getCategoryText(po[index].postCategory),

                            //   ////////////////////////////
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //if (po[index].text != null)
                        Text(
                          po[index].text!,
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 10),
                        //if (po[index].imagePathPost != null)
                        Image(image: NetworkImage(po[index].imagePathPost!),),
// Container(
//   decoration: BoxDecoration(
//     border: Border.all(
//       color: Purple, // Adjust border color as needed
//       width: 2.0, // Adjust border width as needed
//     ),
//   ),
//   child: Image(
//     image: NetworkImage(po[index].imagePathPost!),
   
//   ),
// ),

                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                AllPostsCubit.get(context)
                                    .deletePost(po[index].id);
                                // وظيفة الضغط على أيقونة الحذف
                              },
                              icon: Icon(
                                Icons.close,
                                color: blue,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: po[index].likeCount == null
                                      ? Text('0')
                                      : Text(
                                          po[index].likeCount.toString(),
                                          style: TextStyle(
                                              color: blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  // child: Text(': عدد الإعجابات'),

                                  child: CircleAvatar(
                                      child: Image(
                                    image:
                                        AssetImage('assets/images/heart.gif'),
                                  )),
                                ),
                                // IconButton(
                                //   onPressed: () {
                                //     // وظيفة الضغط على أيقونة القلب
                                //   },
                                //   icon: Icon(
                                //     post.isLiked ? Icons.favorite : Icons.favorite_border,
                                //     color: post.isLiked ? Colors.red : Colors.grey,
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        // WavyDivider(),
                                                  Divider(color: yellow,thickness: 4,)

                        // Image.asset('assets/images/green divider.gif')
                      ],
                    );
                  },
                ),
              ),
              // if (_showReadMoreButton)
              //   TextButton(
              //     onPressed: () {

              //     },
              //     child: Text(
              //       'قراءة المزيد',
              //       style: TextStyle(color: Colors.grey),
              //     ),
              //   ),
            ],
          ),
        );
      }
      return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                // tileColor: Colors.grey.shade300,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(image2.toString()),
                ),
                title: Text(
                  name2.toString(),
                  style: TextStyle(
                    color: blue2,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30.0), // Adjust the radius as needed
                ),
                trailing: IconButton(
                    onPressed: () {
                      AllPostsCubit.get(context).logOut();
                    },
                    icon: Icon(Icons.logout,color: green)),
              ),
            ),
            Divider(
              color: blue2,
              thickness: 4,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 3));
                  AllPostsCubit.get(context).getMyPosts();
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: po.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(po[index].name.toString()),
                            const SizedBox(width: 10),
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  po[index].image_profile_path.toString()),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [],
                        ),
                        //if (po[index].text != null)
                        Text(
                          po[index].text!,
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 10),
                        //if (po[index].imagePathPost != null)
                        Image(image: NetworkImage(po[index].imagePathPost!)),

                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                AllPostsCubit.get(context)
                                    .deletePost(po[index].id);
                                // وظيفة الضغط على أيقونة الحذف
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: po[index].likeCount == null
                                      ? Text('0')
                                      : Text(po[index].likeCount.toString(),style: TextStyle(color: blue,fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  // child: Text(': عدد الإعجابات'),
                                  child: CircleAvatar(
                                      child: Image(
                                    image:
                                        AssetImage('assets/images/heart.gif'),
                                  )),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        // WavyDivider(),
                                                  Divider(color: yellow,thickness: 4,)

                      ],
                    );
                  },
                ),
              ),
            ),
            if (_showReadMoreButton)
              TextButton(
                onPressed: () {},
                child: Text(
                  'قراءة المزيد',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
          ],
        ),
      );
    });
  }
}

class WavyDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = blue // لون الخط
      ..strokeWidth = 1; // سمك الخط

    // رسم الموجات
    Path path = Path();
    path.moveTo(0, size.height / 2); // البداية

    // تحديد الموجات بالمنحنيات البيزيه
    for (double i = 0; i <= size.width; i += 10) {
      path.relativeQuadraticBezierTo(5, -10, 10, 0); // المنحنى الأول
      path.relativeQuadraticBezierTo(5, 10, 10, 0); // المنحنى الثاني
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class WavyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width, 20),
      painter: WavyDividerPainter(),
    );
  }
}
