
import 'Video_model.dart';

abstract class VideoState{}

class VideoInitial extends VideoState{}


class LoadingState extends VideoState{}

class OrderError extends VideoState{}

class OrderSuccess extends VideoState{}

class VideoSuccess extends VideoState{
  List<VideoModel> vid ;
  VideoSuccess(this.vid);
}

class VideoError extends VideoState{}
