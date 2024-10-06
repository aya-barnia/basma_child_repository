import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:basma_child/helper/constant.dart';
import 'package:basma_child/view/Posts/model_posts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Posts/all_cubit.dart';
import 'Posts/all_state.dart';

class PostsView extends StatefulWidget {
  //const PostsView({Key? key}) : super(key: key);

  @override
  _PostsViewState createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  final ScrollController _scrollController = ScrollController();
  bool _showReadMoreButton = false;
  ////////////////////////////////////////////////////////////////////////////////////

  File? _image;
  int selected = 0; // أو أي قيمة ابتدائية تمثل الزر الأول

  //List<PostsModel> listPosts =[];
  List<PostsModel> listPostsActivity = [];
  var numberPage = 1;
  var numberPageStep;
  bool selectedIndex = false;

  @override
  void initState() {
    AllPostsCubit.get(context).getPosts(numberPage);
    // AllPostsCubit.get(context).getShowUserInfo();
    // selectedIndex == true ? Colors.black45 : Colors.blue;
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

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllPostsCubit, AllPostsState>(
        listener: (BuildContext context, state) {

      if (state is AddLikeSuccess) {
        AllPostsCubit.get(context).getPosts(numberPage);
        Flushbar(
          duration: Duration(seconds: 3),
          message: state.message,
          backgroundColor: Purple,
        ).show(context);

        
      }

      if (state is AddLikeError) {
        Flushbar(
          duration: Duration(seconds: 3),
          message: state.message,
          backgroundColor: Purple,
        ).show(context);
        this.isLiked = false;

       
      }
    }, builder: (BuildContext context, state) {
       if(state is LoadingState){
          return Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  color: yellow, // لون الخلفية
                  borderRadius:
                      BorderRadius.circular(30.0), // جعل الحواف بيضوية
                  boxShadow: const [
                    BoxShadow(
                      //  color: Colors.grey.withOpacity(0.5),
                      color: Colors.grey,

                      spreadRadius: 5,
                      blurRadius: 7,
                      offset:
                          Offset(0, 3), // تحديد موقع الظل بالنسبة للـ Container
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _image != null
                        ? Image.file(
                            _image!,
                            width: 100,
                            height: 100,
                          )
                        : IconButton(
                            // onPressed: _pickImage,
                            onPressed: () {
                              Navigator.of(context).pushNamed('/add_post_view');
                            },
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Purple,
                            ),
                          ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/add_post_view');
                        },
                        child: Text(
                          '... شاركنا نشاطاتك',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100,),
              CircularProgressIndicator(),
            ],
          ),
          
        );
        }

      if (state is LoadingLikeState) {
        return Scaffold(
          body: Center(
            // child: Text('loading'),
            child: Image(image: AssetImage('assets/images/purple_heart.gif')),
          ),
        );
      }

      if (state is LoadingCategoryState) {
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  color: yellow, // لون الخلفية
                  borderRadius:
                      BorderRadius.circular(30.0), // جعل الحواف بيضوية
                  boxShadow: const [
                    BoxShadow(
                      //  color: Colors.grey.withOpacity(0.5),
                      color: Colors.grey,

                      spreadRadius: 5,
                      blurRadius: 7,
                      offset:
                          Offset(0, 3), // تحديد موقع الظل بالنسبة للـ Container
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _image != null
                        ? Image.file(
                            _image!,
                            width: 100,
                            height: 100,
                          )
                        : IconButton(
                            // onPressed: _pickImage,
                            onPressed: () {
                              Navigator.of(context).pushNamed('/add_post_view');
                            },
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Purple,
                            ),
                          ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/add_post_view');
                        },
                        child: Text(
                          '... شاركنا نشاطاتك',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100,),
              CircularProgressIndicator(),
            ],
          ),
          
        );
      }

      if (state is GetMyPostsErrorStateFilter) {
        return Scaffold(
          body: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(
                color: yellow, // لون الخلفية
                borderRadius: BorderRadius.circular(30.0), // جعل الحواف بيضوية
                boxShadow: const [
                  BoxShadow(
                    //  color: Colors.grey.withOpacity(0.5),
                    color: Colors.grey,

                    spreadRadius: 5,
                    blurRadius: 7,
                    offset:
                        Offset(0, 3), // تحديد موقع الظل بالنسبة للـ Container
                  ),
                ],
              ),
              child: Row(
                children: [
                  _image != null
                      ? Image.file(
                          _image!,
                          width: 100,
                          height: 100,
                        )
                      : IconButton(
                          // onPressed: _pickImage,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/add_post_view');
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Purple,
                          ),
                        ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/add_post_view');
                      },
                      child: const Text(
                        '... شاركنا نشاطاتك',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              


                 TextButton(
                    onPressed: () {
                      setState(() {
                        selected = 0; // تعديل الزر المختار
                      });
                      AllPostsCubit.get(context).getPosts(1);
                    },
                    child: Text(
                      'الكل',
                      style: TextStyle(
                        color: selected == 0 ? yellow : Purple,
                      ),
                    ),
                  ),

// زر مواهب
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selected = 1; // تعديل الزر المختار
                      });
                      AllPostsCubit.get(context).getPostsCategory('activity');
                    },
                    child: Text(
                      'مواهب',
                      style: TextStyle(
                        color: selected == 1 ? yellow : Purple,
                      ),
                    ),
                  ),

// زر قصص
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selected = 2; // تعديل الزر المختار
                      });
                      AllPostsCubit.get(context).getPostsCategory('story');
                    },
                    child: Text(
                      'قصص',
                      style: TextStyle(
                        color: selected == 2 ? yellow : Purple,
                      ),
                    ),
                  ),

// زر أخرى
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selected = 3; // تعديل الزر المختار
                      });
                      AllPostsCubit.get(context).getPostsCategory('other');
                    },
                    child: Text(
                      'أخرى',
                      style: TextStyle(
                        color: selected == 3 ? yellow : Purple,
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
                child: Center(
              child: Text(
                '..لا يوجد منشورات',
                style: TextStyle(color: Purple3),
              ),
            ))
          ]),
        );
      }
      if (state is GetMyPostsStateFilter) {
  print('here filterrrrrrrr **************************************');
  print(state.po);
  this.listPostsActivity = state.po;
  return Scaffold(
    body: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(
            color: yellow, // لون الخلفية
            borderRadius: BorderRadius.circular(30.0), // جعل الحواف بيضوية
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // تحديد موقع الظل بالنسبة للـ Container
              ),
            ],
          ),
          child: Row(
            children: [
              _image != null
                  ? Image.file(
                      _image!,
                      width: 100,
                      height: 100,
                    )
                  : IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/add_post_view');
                      },
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Purple,
                      ),
                    ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/add_post_view');
                  },
                  child: Text(
                    '... شاركنا نشاطاتك',
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  selected = 0; // تعديل الزر المختار
                });
                AllPostsCubit.get(context).getPosts(1);
              },
              child: Text(
                'الكل',
                style: TextStyle(
                  color: selected == 0 ? yellow : Purple,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selected = 1; // تعديل الزر المختار
                });
                AllPostsCubit.get(context).getPostsCategory('activity');
              },
              child: Text(
                'مواهب',
                style: TextStyle(
                  color: selected == 1 ? yellow : Purple,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selected = 2; // تعديل الزر المختار
                });
                AllPostsCubit.get(context).getPostsCategory('story');
              },
              child: Text(
                'قصص',
                style: TextStyle(
                  color: selected == 2 ? yellow : Purple,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selected = 3; // تعديل الزر المختار
                });
                AllPostsCubit.get(context).getPostsCategory('other');
              },
              child: Text(
                'أخرى',
                style: TextStyle(
                  color: selected == 3 ? yellow : Purple,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: listPostsActivity.isEmpty
              ? Center(
                  child: Text(
                    '..لا يوجد منشورات',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: listPostsActivity.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(listPostsActivity[index].name.toString()),
                            const SizedBox(width: 10),
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                listPostsActivity[index].image_profile_path ?? '',
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        listPostsActivity[index].text != null
                            ? Text(
                                listPostsActivity[index].text.toString(),
                                textAlign: TextAlign.right,
                              )
                            : Text('no description'),
                        const SizedBox(height: 10),
                        listPostsActivity[index].imagePathPost != null &&
                                listPostsActivity[index].imagePathPost!.isNotEmpty
                            ? Image.network(
                                listPostsActivity[index].imagePathPost!,
                                fit: BoxFit.fill,
                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  return Text('Failed to load image', style: TextStyle(color: Colors.red));
                                },
                              )
                            : Text('No image uploaded'),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            listPostsActivity[index].likeCount == null
                                ? Text('0')
                                : Text(listPostsActivity[index].likeCount.toString()),
                            IconButton(
                              onPressed: () {
                                print('isLiked');
                                print(isLiked);
                                isLiked = !isLiked;
                                if (isLiked == true) {
                                  AllPostsCubit.get(context).addLikePostsCubit(listPostsActivity[index].id);
                                }
                              },
                              icon: Icon(
                                isLiked ? Icons.favorite : Icons.favorite_border,
                                color: isLiked ? Colors.red : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: green,
                          height: 1.0, // سمك الخط
                        ),
                      ],
                    );
                  },
                ),
        ),
      ],
    ),
  );
}


      if (state is GetPosts) {
        listPostsActivity = state.po;
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  color: yellow, // لون الخلفية
                  borderRadius:
                      BorderRadius.circular(30.0), // جعل الحواف بيضوية
                  boxShadow: const [
                    BoxShadow(
                      //  color: Colors.grey.withOpacity(0.5),
                      color: Colors.grey,

                      spreadRadius: 5,
                      blurRadius: 7,
                      offset:
                          Offset(0, 3), // تحديد موقع الظل بالنسبة للـ Container
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _image != null
                        ? Image.file(
                            _image!,
                            width: 100,
                            height: 100,
                          )
                        : IconButton(
                            // onPressed: _pickImage,
                            onPressed: () {
                              Navigator.of(context).pushNamed('/add_post_view');
                            },
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Purple,
                            ),
                          ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/add_post_view');
                        },
                        child: const Text(
                          '... شاركنا نشاطاتك',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 

                  TextButton(
                    onPressed: () {
                      setState(() {
                        selected = 0; // تعديل الزر المختار
                      });
                      AllPostsCubit.get(context).getPosts(1);
                    },
                    child: Text(
                      'الكل',
                      style: TextStyle(
                        color: selected == 0 ? yellow : Purple,
                      ),
                    ),
                  ),

// زر مواهب
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selected = 1; // تعديل الزر المختار
                      });
                      AllPostsCubit.get(context).getPostsCategory('activity');
                    },
                    child: Text(
                      'مواهب',
                      style: TextStyle(
                        color: selected == 1 ? yellow : Purple,
                      ),
                    ),
                  ),

// زر قصص
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selected = 2; // تعديل الزر المختار
                      });
                      AllPostsCubit.get(context).getPostsCategory('story');
                    },
                    child: Text(
                      'قصص',
                      style: TextStyle(
                        color: selected == 2 ? yellow : Purple,
                      ),
                    ),
                  ),

// زر أخرى
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selected = 3; // تعديل الزر المختار
                      });
                      AllPostsCubit.get(context).getPostsCategory('other');
                    },
                    child: Text(
                      'أخرى',
                      style: TextStyle(
                        color: selected == 3 ? yellow : Purple,
                      ),
                    ),
                  ),

////////////////////////////////////////////////////////
                ],
              ),
              Expanded(
                child: listPostsActivity.isEmpty
                    ? Center(
                        child: Text(
                          '..لا يوجد منشورات',
                          style: TextStyle(color: Purple3),
                        ),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount: listPostsActivity.length,
                        itemBuilder: (context, index) {
                          // final post = filteredPosts[index];
                          return Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      //post.publisherName
                                      listPostsActivity[index].name.toString()),
                                  const SizedBox(width: 10),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        listPostsActivity[index]
                                            .image_profile_path
                                            .toString()),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              if (listPostsActivity[index].text != null)
                                Text(
                                  listPostsActivity[index].text.toString(),
                                  textAlign: TextAlign.right,
                                ),
                              const SizedBox(height: 10),
                              listPostsActivity[index].imagePathPost == null
                                  ? Text('no image uploaded')
                                  : Image(
                                      image: NetworkImage(
                                          listPostsActivity[index]
                                              .imagePathPost!)),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  listPostsActivity[index].likeCount == null
                                      ? Text('0')
                                      : Text(listPostsActivity[index]
                                          .likeCount
                                          .toString()),
                                  IconButton(
                                    onPressed: () {
                                      print('isLiked');
                                      print(isLiked);
                                      isLiked = !isLiked;
                                      if (isLiked == true) {
                                        AllPostsCubit.get(context)
                                            .addLikePostsCubit(
                                                listPostsActivity[index].id);
                                      }
                                    },
                                    icon: Icon(
                                      isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isLiked ? Colors.red : Colors.grey,
                                          


                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Divider(
                                // أضف Divider بعد كل منشور
                                // color: Colors.grey[300], // لون رمادي فاتح
                                color: green,
                                height: 1.0, // سمك الخط
                              ),
                              // Image.asset('assets/images/green divider.gif'),
                            ],
                          );
                        },
                      ),
              ),
              if (_showReadMoreButton)
                

                TextButton(
                  onPressed: () {
                    // تحديث numberPageStep قبل كل مرة يتم فيها الضغط على الزر
                    numberPageStep = numberPage + 1;

                    // جلب الصفحة التالية
                    AllPostsCubit.get(context).getPosts(numberPageStep);

                    // زيادة قيمة numberPage
                    numberPage++;
                  },
                  child: const Text(
                    'قراءة المزيد',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
            ],
          ),
        );
      }
      return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(
                color: yellow, // لون الخلفية
                borderRadius: BorderRadius.circular(30.0), // جعل الحواف بيضوية
                boxShadow: const [
                  BoxShadow(
                    //  color: Colors.grey.withOpacity(0.5),
                    color: Colors.grey,

                    spreadRadius: 5,
                    blurRadius: 7,
                    offset:
                        Offset(0, 3), // تحديد موقع الظل بالنسبة للـ Container
                  ),
                ],
              ),
              child: Row(
                children: [
                  _image != null
                      ? Image.file(
                          _image!,
                          width: 100,
                          height: 100,
                        )
                      : IconButton(
                          // onPressed: _pickImage,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/add_post_view');
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Purple,
                          ),
                        ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/add_post_view');
                      },
                      child: const Text(
                        '... شاركنا نشاطاتك',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                




                 TextButton(
                    onPressed: () {
                      setState(() {
                        selected = 0; // تعديل الزر المختار
                      });
                      AllPostsCubit.get(context).getPosts(1);
                    },
                    child: Text(
                      'الكل',
                      style: TextStyle(
                        color: selected == 0 ? yellow : Purple,
                      ),
                    ),
                  ),

// زر مواهب
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selected = 1; // تعديل الزر المختار
                      });
                      AllPostsCubit.get(context).getPostsCategory('activity');
                    },
                    child: Text(
                      'مواهب',
                      style: TextStyle(
                        color: selected == 1 ? yellow : Purple,
                      ),
                    ),
                  ),

// زر قصص
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selected = 2; // تعديل الزر المختار
                      });
                      AllPostsCubit.get(context).getPostsCategory('story');
                    },
                    child: Text(
                      'قصص',
                      style: TextStyle(
                        color: selected == 2 ? yellow : Purple,
                      ),
                    ),
                  ),

// زر أخرى
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selected = 3; // تعديل الزر المختار
                      });
                      AllPostsCubit.get(context).getPostsCategory('other');
                    },
                    child: Text(
                      'أخرى',
                      style: TextStyle(
                        color: selected == 3 ? yellow : Purple,
                      ),
                    ),
                  ),


              ],
            ),
            Expanded(
              child: listPostsActivity.isEmpty
                  ? Center(
                      child: Text(
                        '..لا يوجد منشورات',
                        style: TextStyle(color: Purple3),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: listPostsActivity.length,
                      itemBuilder: (context, index) {
                        // final post = filteredPosts[index];
                        return Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                    //post.publisherName
                                    listPostsActivity[index].name.toString()),
                                const SizedBox(width: 10),
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      listPostsActivity[index]
                                          .image_profile_path
                                          .toString()),
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            if (listPostsActivity[index].text != null)
                              Text(
                                listPostsActivity[index].text.toString(),
                                textAlign: TextAlign.right,
                              ),
                            const SizedBox(height: 10),
                            listPostsActivity[index].imagePathPost == null
                                ? Text('no image uploaded')
                                : Image(
                                    image: NetworkImage(listPostsActivity[index]
                                        .imagePathPost!)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                listPostsActivity[index].likeCount == null
                                    ? Text('0')
                                    : Text(listPostsActivity[index]
                                        .likeCount
                                        .toString()),
                                IconButton(
                                  onPressed: () {
                                    print('isLiked');
                                    print(isLiked);
                                    isLiked = !isLiked;
                                    if (isLiked == true) {
                                      AllPostsCubit.get(context)
                                          .addLikePostsCubit(
                                              listPostsActivity[index].id);
                                    }
                                  },
                                  icon: Icon(
                                    isLiked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isLiked ? Colors.red : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Divider(
                              // أضف Divider بعد كل منشور
                              // color: Colors.grey[300], // لون رمادي فاتح
                              color: green,
                              height: 1.0, // سمك الخط
                            ),
                            // Image.asset('assets/images/green divider.gif'),
                          ],
                        );
                      },
                    ),
            ),
            if (_showReadMoreButton)
              TextButton(
                onPressed: () {},
                child: const Text(
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
