

import 'package:basma_child/view/Posts/model_posts.dart';

abstract class AllPostsState{}

class InitialState extends AllPostsState{}

class LoadingState extends AllPostsState{}

class LoadingCategoryState extends AllPostsState{}

class LoadingLikeState extends AllPostsState{}

class LoadingStateForName extends AllPostsState{}

class PickImageState extends AllPostsState{}

class PickImageNullState extends AllPostsState{}

class SuccessAddPost extends AllPostsState{

 String message;

SuccessAddPost(this.message);
}


class GetPosts extends AllPostsState{

List<PostsModel> po ;

GetPosts(this.po);

}

class WaitAddPost extends AllPostsState{

String po ;

WaitAddPost(this.po);

}

class WaitAddPost2 extends AllPostsState{}

class GetPostsError extends AllPostsState{

String po ;

GetPostsError(this.po);

}


class GetMyPostsState extends AllPostsState{

List<PostsModel> po ;
//Map<String,dynamic> user ;


GetMyPostsState(this.po );

}

class GetMyPostsErrorState extends AllPostsState{

String message;

GetMyPostsErrorState(this.message);

}



class GetMyPostsStateFilter extends AllPostsState{

List<PostsModel> po ;

GetMyPostsStateFilter(this.po);

}

class GetMyPostsErrorStateFilter extends AllPostsState{

String message;

GetMyPostsErrorStateFilter(this.message);

}

class AddLikeSuccess extends AllPostsState{

 String message;

 AddLikeSuccess(this.message);

}

class AddLikeError extends AllPostsState{

 String? message;

 AddLikeError(this.message);

}

class DeleteSuccessState extends AllPostsState{
 String? message;

 DeleteSuccessState(this.message);

}

class DeleteErrorState extends AllPostsState{
 String message;

 DeleteErrorState(this.message);

}

class LogOutSuccessState extends AllPostsState{
 String message;

 LogOutSuccessState(this.message);

}

class LogOutErrorState extends AllPostsState{
 String message;

 LogOutErrorState(this.message);

}

class GetMyInfoState extends AllPostsState{
 dynamic res;


 GetMyInfoState(this.res);

}

class GetMyInfoStateError extends AllPostsState{


 String message;

 GetMyInfoStateError(this.message);

}




