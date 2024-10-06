// import 'package:child_basma/helper/constant.dart';
// import 'package:child_basma/view/Classes/classes_view.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter/widgets.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   final String? publicId; // Make publicId nullable
//   VideoPlayerScreen({required this.publicId});
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   VideoPlayerController? _controller;
//   bool isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayer(widget.publicId);
//   }

//   void _initializeVideoPlayer(String? publicId) {
//     if (publicId != null) {
//       final String cloudName =
//           'drro8ruai'; // Replace with your actual Cloudinary cloud name
//       final String videoUrl =
//           'https://res.cloudinary.com/$cloudName/video/upload/$publicId.mp4';

//       _controller = VideoPlayerController.network(videoUrl)
//         ..initialize().then((_) {
//           setState(() {});
//           _controller!.setVolume(1.0); // Ensure volume is up
//           print("Video initialized with volume: ${_controller!.value.volume}");
//         }).catchError((error) {
//           print('Error initializing video player: $error');
//           // You might want to show an error message to the user here
//         });
//     } else {
//       // Handle the case where publicId is null
//       print('Error: video ID is missing');
//     }
//   }

// // //////////////////////هون
// //   Duration _clampDuration(Duration value, Duration min, Duration max) {
// //     return Duration(
// //       microseconds:
// //           min.inMicroseconds.clamp(min.inMicroseconds, max.inMicroseconds),
// //     );
// //   }

// //  void _seekForward() {
// //   final currentPosition = _controller!.value.position;
// //   final newPosition = currentPosition + const Duration(seconds: 10);

// //   // Check for negative position before clamping
// //   if (newPosition.inMicroseconds < 0) {
// //     _controller!.seekTo(Duration.zero);
// //     return;
// //   }

// //   _controller!.seekTo(_clampDuration(
// //       newPosition, Duration.zero, _controller!.value.duration));
// // }

// //   void _seekBackward() {
// //     final currentPosition = _controller!.value.position;
// //     final newPosition = currentPosition - const Duration(seconds: 10);
// //     _controller!.seekTo(_clampDuration(
// //         newPosition, Duration.zero, _controller!.value.duration));
// //   }

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

//   void _stopVideo() {
//     setState(() {
//       _controller!.pause();
//       _controller!.seekTo(Duration.zero);
//       isPlaying = false;
//     });
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.chat,
//               color: yellow,
//             ),
//           )
//         ],
//         leading: Image(image: AssetImage('assets/images/basma.png')),
//         backgroundColor: green2,
//         title: Center(
//           child: Text(
//             'مدرسة بسمة',
//             style: TextStyle(
//               color: yellow,
//               fontStyle: FontStyle.normal,
//             ),
//           ),
//         ),
//       ),
//       body: Center(
//           child: widget.publicId != null && _controller != null
//               ? _controller!.value.isInitialized
//                   ? Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // SizedBox(height: 50,),
//                         AspectRatio(
//                           aspectRatio: _controller!.value.aspectRatio,
//                           child: VideoPlayer(_controller!),
//                         ),
//                         SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // IconButton(
//                             //   icon: Icon(Icons.fast_rewind,
//                             //       color: yellow, size: 50),
//                             //   onPressed: _seekBackward,
//                             // ),
//                             IconButton(
//                               icon: Icon(
//                                 isPlaying ? Icons.pause : Icons.play_arrow,
//                                 color: yellow,
//                                 size: 50,
//                               ),
//                               onPressed: _playPauseVideo,
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 Icons.stop,
//                                 color: green,
//                                 size: 50,
//                               ),
//                               onPressed: _stopVideo,
//                             ),
//                             // IconButton(
//                             //   icon: Icon(Icons.fast_forward,
//                             //       color: yellow, size: 50),
//                             //   onPressed: _seekForward,
//                             // ),
//                           ],
//                         ),
//                       ],
//                     )
//                   : CircularProgressIndicator(color: green)
//               : Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image(
//                         image: AssetImage('assets/images/oops.png'),
//                         height: 60,
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         'الفيديو غير متوفر يمكنك مراسلتنا حول ذلك ',
//                         style: TextStyle(
//                           color: green,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                     ],
//                   ),
//                 ) // Replace with your message or image
//           ),
//     );
//   }
// }

import 'package:basma_child/helper/constant.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String? publicId; // Make publicId nullable
  VideoPlayerScreen({required this.publicId});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer(widget.publicId);
  }

  void _initializeVideoPlayer(String? publicId) {
    if (publicId != null) {
      final String cloudName =
          'drro8ruai'; // Replace with your actual Cloudinary cloud name
      final String videoUrl =
          'https://res.cloudinary.com/$cloudName/video/upload/$publicId.mp4';

      _controller = VideoPlayerController.network(videoUrl)
        ..initialize().then((_) {
          setState(() {});
          _controller!.setVolume(1.0); // Ensure volume is up
          print("Video initialized with volume: ${_controller!.value.volume}");
        }).catchError((error) {
          print('Error initializing video player: $error');
          // You might want to show an error message to the user here
        });
    } else {
      // Handle the case where publicId is null
      print('Error: video ID is missing');
    }
  }

  void _playPauseVideo() {
    setState(() {
      if (_controller!.value.isPlaying) {
        _controller!.pause();
      } else {
        _controller!.play();
      }
      isPlaying = _controller!.value.isPlaying;
    });
  }

  void _stopVideo() {
    setState(() {
      _controller!.pause();
      _controller!.seekTo(Duration.zero);
      isPlaying = false;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chat,
              color: yellow,
            ),
          )
        ],
        leading: Image(image: AssetImage('assets/images/basma.png')),
        backgroundColor: green2,
        title: Center(
          child: Text(
            'مدرسة بسمة',
            style: TextStyle(
              color: yellow,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            widget.publicId != null && _controller != null
                ? _controller!.value.isInitialized
                    ? Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          ),
                          Positioned(
                            bottom: 0.0, // Adjust spacing from bottom
                            left: 10.0, // Adjust spacing from left
                            right: 10.0,
                            child: Slider(
                              activeColor: green, // لون الجزء النشط باللون الأزرق
                              inactiveColor: Colors
                                  .grey, // لون الجزء غير النشط باللون الرمادي
                              thumbColor: green, // لون الإبهام باللون الأخضر
                              value: _controller!.value.position.inSeconds
                                  .toDouble(),
                              min: 0.0,
                              max: _controller!.value.duration.inSeconds
                                  .toDouble(),
                              onChanged: (value) => _controller!
                                  .seekTo(Duration(seconds: value.toInt())),
                            ),
                          ),
                        ],
                      )
                    : CircularProgressIndicator(color: green)
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/oops.png'),
                          height: 60,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'الفيديو غير متوفر يمكنك مراسلتنا حول ذلك ',
                          style: TextStyle(
                            color: green,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: yellow,
                    size: 50,
                  ),
                  onPressed: _playPauseVideo,
                ),
                IconButton(
                  icon: Icon(
                    Icons.stop,
                    color: green,
                    size: 50,
                  ),
                  onPressed: _stopVideo,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// ///////////////////////////////////////هاد رااااااااااااائع

// import 'package:child_basma/helper/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   final String? publicId; // معرف الفيديو العام (يمكن أن يكون فارغًا)
//   VideoPlayerScreen({required this.publicId});

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   VideoPlayerController? _controller; // متحكم الفيديو
//   bool isPlaying = false; // متغير لتتبع حالة التشغيل/الإيقاف

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayer(widget.publicId);
//   }

//   void _initializeVideoPlayer(String? publicId) {
//     if (publicId != null) {
//       // قم بتكوين عنوان URL للفيديو باستخدام Cloudinary
//       final String cloudName = 'drro8ruai'; // استبدل باسم Cloudinary الخاص بك
//       final String videoUrl = 'https://res.cloudinary.com/$cloudName/video/upload/$publicId.mp4';

//       // قم بتهيئة متحكم الفيديو
//       _controller = VideoPlayerController.network(videoUrl)
//         ..initialize().then((_) {
//           // عند الانتهاء من التهيئة، قم بتشغيل الفيديو وتعيين مستوى الصوت
//           setState(() {});
//           _controller!.setVolume(1.0);
//         }).catchError((error) {
//           // إذا حدث خطأ، قم بطباعته في الكونسول
//           print('Error initializing video player: $error');
//         });
//     } else {
//       // إذا لم يتم تمرير معرف الفيديو، قم بطباعة رسالة خطأ
//       print('Error: video ID is missing');
//     }
//   }

//   void _playPauseVideo() {
//     setState(() {
//       if (_controller!.value.isPlaying) {
//         _controller!.pause(); // إيقاف الفيديو
//       } else {
//         _controller!.play(); // تشغيل الفيديو
//       }
//     });
//   }
// Duration _clampDuration(Duration value, Duration min, Duration max) {
//   return Duration(
//     microseconds: min.inMicroseconds.clamp(min.inMicroseconds, max.inMicroseconds),
//   );
// }

// void _seekForward() {
//   final currentPosition = _controller!.value.position;
//   final newPosition = currentPosition + const Duration(seconds: 10);
//   _controller!.seekTo(_clampDuration(newPosition, Duration.zero, _controller!.value.duration));
// }

// void _seekBackward() {
//   final currentPosition = _controller!.value.position;
//   final newPosition = currentPosition - const Duration(seconds: 10);
//   _controller!.seekTo(_clampDuration(newPosition, Duration.zero, _controller!.value.duration));
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // ... باقي شريط الأدوات
//       ),
//       body: Center(
//         child: widget.publicId != null && _controller != null
//             ? _controller!.value.isInitialized
//                 ? Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: AspectRatio(
//                           aspectRatio: _controller!.value.aspectRatio,
//                           child: VideoPlayer(_controller!),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           IconButton(
//                             icon: Icon(
//                               isPlaying ? Icons.pause : Icons.play_arrow,
//                               color: yellow,
//                               size: 50,
//                             ),
//                             onPressed: _playPauseVideo,
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.fast_rewind, color: yellow, size: 50),
//                             onPressed: _seekBackward,
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.fast_forward, color: yellow, size: 50),
//                             onPressed: _seekForward,
//                           ),
//                         ],
//                       ),
//                     ],
//                   )
//                 : CircularProgressIndicator(color: green)
//             : Center(
//                 // ... رسالة الخطأ إذا لم يكن هناك فيديو
//               ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
// }
