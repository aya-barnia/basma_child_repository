

// import 'package:bloc/bloc.dart';
// import 'package:child_basma/view/Api/api_posts.dart';
// import 'package:child_basma/view/Classes/classes_model.dart';
// import 'package:child_basma/view/Cubit/all_state.dart';
// import 'package:child_basma/view/Model/model_posts.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AllPostsCubit extends Cubit<AllPostsState>{

// AllPostsCubit() :super(InitialState());


// static AllPostsCubit get(context) => BlocProvider.of(context);


// ApiPosts apiPosts = ApiPosts();

// List<PostsModel> postModel =[];

// List<PostsModel> postModelGet =[];




// addPostsCubit(PostsModel post)async{

//   print('hi ');
//   print(post.toString());

//   emit(LoadingState());

// Map<String, dynamic> json = await post.allPostsTojson();
// print('hi again');
// print(json);

// List<dynamic> res = await apiPosts.addPost(json);

// this.postModel = res.map((e) => PostsModel.fromJson(e)).toList();

// print('in line 35');
// emit(WaitAddPost('Wait to send '));
// print(res);



// }


// getPosts() async{
// print('first stap');
// emit(LoadingState());

// final post = await apiPosts.getPosts();
// print('come back');
// this.postModelGet = post.map((e) => PostsModel.fromJson(e)).toList();
// print(postModelGet);

// if(postModelGet.isNotEmpty){
//   print(' i am not empty');

//   emit(GetPosts(postModelGet));
//   print('finish here');

// }
// else{

//   emit(GetPostsError('get post error'));
//   print('finish here');


// }


// }

// List<PostsModel> myPost = [];

// //List<Filter> myPostFilter = [];

// getMyPosts() async{

//   print('first stap');
//   emit(LoadingState());

// final post = await apiPosts.getMyPosts();
// this.myPost = await post.map((e) => PostsModel.fromJson(e)).toList();
// print(myPost);

// if(myPost.isNotEmpty){
//   print('this is ot empty my posts');
//   emit(GetMyPostsState(myPost));
// }
// else{
//     emit(GetMyPostsErrorState('is empty'));

// }




// }


// getPostsCategory( String cat ) async{

//   print('first stap');
//   emit(LoadingState());

//   Map<String , dynamic> f ={
  
//   if(cat != '')
//   'post_category':cat,

//   };



// RESPONCE2 post = await apiPosts.getPostCategory(f);
// print(post);

// if(post.status == true){
//   print('this is ot empty my posts activity');
//   emit(GetMyPostsStateFilterTalent(post.message));
// }
// else{
//     emit(GetMyPostsErrorStateTalent('is empty'));

// }





// }



// }