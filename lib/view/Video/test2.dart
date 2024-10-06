// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Video Player',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: VideoPlayerScreen(publicId: 'ddswdhjvao65pl0eienj'),
//     );
//   }
// }
//
// class VideoPlayerScreen extends StatefulWidget {
//   final String publicId;
//
//   VideoPlayerScreen({required this.publicId});
//
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   VideoPlayerController? _controller;
//   bool isPlaying = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayer(widget.publicId);
//   }
//
//   void _initializeVideoPlayer(String publicId) {
//     final String cloudName = 'drro8ruai'; // Replace with your actual Cloudinary cloud name
//     final String videoUrl = 'https://res.cloudinary.com/$cloudName/video/upload/$publicId.mp4';
//
//     _controller = VideoPlayerController.network(videoUrl)
//       ..initialize().then((_) {
//         setState(() {});
//       }).catchError((error) {
//         print('Error initializing video player: $error');
//       });
//   }
//
//   void _playPauseVideo() {
//     setState(() {
//       if (_controller!.value.isPlaying) {
//         _controller!.pause();
//       } else {
//         _controller!.play();
//       }
//       isPlaying = _controller!.value.isPlaying;
//     });
//   }
//
//   void _stopVideo() {
//     setState(() {
//       _controller!.pause();
//       _controller!.seekTo(Duration.zero);
//       isPlaying = false;
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: Center(
//         child: _controller != null && _controller!.value.isInitialized
//             ? Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AspectRatio(
//               aspectRatio: _controller!.value.aspectRatio,
//               child: VideoPlayer(_controller!),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: Icon(
//                     isPlaying ? Icons.pause : Icons.play_arrow,
//                   ),
//                   onPressed: _playPauseVideo,
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.stop),
//                   onPressed: _stopVideo,
//                 ),
//               ],
//             ),
//           ],
//         )
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }
