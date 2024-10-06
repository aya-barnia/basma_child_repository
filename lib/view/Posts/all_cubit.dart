

import 'package:basma_child/view/Posts/model_posts.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Login/login_api.dart';
import 'all_state.dart';
import 'api_posts.dart';

class AllPostsCubit extends Cubit<AllPostsState>{

AllPostsCubit() :super(InitialState());


static AllPostsCubit get(context) => BlocProvider.of(context);


    ApiPosts apiPosts = ApiPosts();
    LoginApi api = LoginApi();

    List<PostsModel> postModel =[];

    List<PostsModel> postModelGet =[];


    // dynamic file;
    // Future pickImage(ImageSource src , context) async {
    //   XFile? image = await ImagePicker().pickImage(source: src);
    //   if (image == null){
    //     emit(PickedNullImage());
    //   }
    //   else {
    //     file = File(image.path);
    //     emit(PickedImageState(file));
    //     emit(PickedImageFinish());
    //     // Navigator.pop(context);
    //   }
    // }

    addPostsCubit(PostsModel post)async{

      print('hi ');
      print(post.toString());

      emit(LoadingState());

    Map<String, dynamic> json = await post.allPostsTojson();
    print('hi again');
    print(json);

    List<dynamic> res = await apiPosts.addPost(json);

    this.postModel = res.map((e) => PostsModel.fromJson(e)).toList();

    print('in line 35');
    emit(WaitAddPost('Wait to send '));
    print(postModel);
    print(res);
    emit(WaitAddPost2());




    }

    addLikePostsCubit(like)async{

      print('hi like ');
      print(like);

      emit(LoadingLikeState());

      final post = await apiPosts.addLike(like);
      print('in cubit post');

      print(post.toString());
      if(post.toString() == 'You have already liked this post'){

        print('hereeeeeeeeeeeeeeee $post');
                emit(AddLikeError(post));
        

      }
      else {
        print('add success in cubit');
        print(post.toString());
        emit(AddLikeSuccess(post));
      }

    }

    getPosts(numberPage) async{
    print('first stap');
    emit(LoadingState());

    final post = await apiPosts.getPosts(numberPage);
    print('come back');
    this.postModelGet = post.map((e) => PostsModel.fromJson(e)).toList();
    print(postModelGet);

    if(postModelGet.isNotEmpty){
      print(' i am not empty');

      emit(GetPosts(postModelGet));
      print('finish here');

    }
    else{

      emit(GetPostsError('get post error'));
      print('finish here');


    }


    }

    List<PostsModel> myPost = [];
    List<PostsModel> myPostFilter = [];

    getMyPosts() async{

      print('first stap');
      emit(LoadingState());
      emit(LoadingStateForName());

    final post = await apiPosts.getMyPosts();
    this.myPost = await post.map((e) => PostsModel.fromJson(e)).toList();
    print('myPost **************');
    print(myPost.toString());

    if(myPost.isNotEmpty){
      print('this is ot empty my posts');
      emit(GetMyPostsState(myPost ));
    }
    else{
        emit(GetMyPostsErrorState('is empty'));

    }




    }


    getPostsCategory( String cat ) async{

      print('first stap');
      print('                          ----                                  $cat                --------------');
      emit(LoadingCategoryState());
      //
      // Map<String , dynamic> f ={
      //
      // if(cat != '')
      // //'post_category':cat,
      // 'post_category':cat,
      //
      // };

    List<dynamic> post = await apiPosts.getPostCategory(cat);
    this.myPostFilter =  post.map((e) => PostsModel.fromJson(e)).toList();

    print(myPostFilter);

    if(myPostFilter.isNotEmpty ){
      print('this is ot empty my posts activity');
      print('//////////////////////////////////////////');
      print(myPostFilter.toString());

      emit(GetMyPostsStateFilter(myPostFilter));
    }
    else{
        emit(GetMyPostsErrorStateFilter('is empty'));

    }





    }

    getShowUserInfo() async{

      print('first stap');
      emit(LoadingState());


      dynamic post = await apiPosts.userInfo();
      print('here after api info');
      print(post);

      if(post.isNotEmpty ){
        print('getShowUserInfo');
        print('//////////////////////////////////////////');
        print(post.toString());

        emit(GetMyInfoState(post));
      }
      else{
        emit(GetMyInfoStateError('is empty'));

      }





    }



    deletePost(dynamic postId ) async
    {
      emit(LoadingState());
      print("del01");
      RESPONSE response = await apiPosts.deleteMyPost(postId);
      print(response.message);
      if(response.Success){
        print("del02");
        emit(DeleteSuccessState(response.message));
      }
      else {
        emit(DeleteErrorState( response.message));
      }
    }


    logOut() async {
      emit(LoadingState());
      print("logout01");
      RESPONSE response = await api.logOut();
      print("logout02");
      if(response.Success){
        print("logout03");
        emit(LogOutSuccessState(response.message));
      }
      else{
        emit(LogOutErrorState( response.message));
      }
    }




}