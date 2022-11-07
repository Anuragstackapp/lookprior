

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class VideoPlayerNetwork extends StatefulWidget {

  String? videoAndImageLink;

  VideoPlayerNetwork({super.key, this.videoAndImageLink});



  @override
  State<VideoPlayerNetwork> createState() => _VideoPlayerNetworkState();
}

class _VideoPlayerNetworkState extends State<VideoPlayerNetwork> {

  // late VideoPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;

  ChewieController? _chewieController;
  int? bufferDelay;
  late VideoPlayerController _videoPlayerController1;

  @override
  void initState() {


    // _controller = VideoPlayerController.network(
    //   '${widget.videoAndImageLink}',
    // );
    // _initializeVideoPlayerFuture = _controller.initialize();
    //
    // _controller.setLooping(true);
    super.initState();

    initializePlayer();

  }

  Future<void> initializePlayer()async {

    _videoPlayerController1 =
        VideoPlayerController.network("${widget.videoAndImageLink}");

   await Future.wait([_videoPlayerController1.initialize()]);

    _createChewieController();
    setState(() {});

  }

  void _createChewieController() {
    // final subtitles = [
    //     Subtitle(
    //       index: 0,
    //       start: Duration.zero,
    //       end: const Duration(seconds: 10),
    //       text: 'Hello from subtitles',
    //     ),
    //     Subtitle(
    //       index: 0,
    //       start: const Duration(seconds: 10),
    //       end: const Duration(seconds: 20),
    //       text: 'Whats up? :)',
    //     ),
    //   ];

    final subtitles = [
      Subtitle(
        index: 0,
        start: Duration.zero,
        end: const Duration(seconds: 10),
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Hello',
              style: TextStyle(color: Colors.red, fontSize: 22),
            ),
            TextSpan(
              text: ' from ',
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            TextSpan(
              text: 'subtitles',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            )
          ],
        ),
      ),
      Subtitle(
        index: 0,
        start: const Duration(seconds: 10),
        end: const Duration(seconds: 20),
        text: 'Whats up? :)',
        // text: const TextSpan(
        //   text: 'Whats up? :)',
        //   style: TextStyle(color: Colors.amber, fontSize: 22, fontStyle: FontStyle.italic),
        // ),
      ),
    ];

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      progressIndicatorDelay:
      bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,

      subtitle: Subtitles(subtitles),
      subtitleBuilder: (context, dynamic subtitle) => Container(
        padding: const EdgeInsets.all(10.0),
        child: subtitle is InlineSpan
            ? RichText(
          text: subtitle,
        )
            : Text(
          subtitle.toString(),
          style: const TextStyle(color: Colors.black),
        ),
      ),

      hideControlsTimer: const Duration(seconds: 1),

      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    // _controller.dispose();
    _videoPlayerController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Column(children: [
            Expanded(
              child: Center(
                child: _chewieController != null &&
                    _chewieController!
                        .videoPlayerController.value.isInitialized
                    ? Chewie(
                  controller: _chewieController!,
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text('Loading'),
                  ],
                ),
              ),
            ),
          ],),


          // FutureBuilder(
          //   future: _initializeVideoPlayerFuture,
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       return Container(
          //         height: double.infinity,
          //         width: double.infinity,
          //         // aspectRatio: _controller.value.aspectRatio,
          //         child: VideoPlayer(_controller),
          //       );
          //     } else {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.highlight_remove_sharp,color: Colors.white,size: 35)),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       // pause
      //       if (_controller.value.isPlaying) {
      //         _controller.pause();
      //       } else {
      //         // play
      //         _controller.play();
      //       }
      //     });
      //   },
      //   // icon
      //   child: Icon(
      //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
    );
  }
}










// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
//
// class VideoPlayerScreen extends StatefulWidget {
//   VideoPlayerScreen({required Key key}) : super(key: key);
//
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     _controller = VideoPlayerController.network(
//       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
//     );
//     _initializeVideoPlayerFuture = _controller.initialize();
//
//     _controller.setLooping(true);
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GeeksForGeeks'),
//         backgroundColor: Colors.green,
//       ),
//       body: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: VideoPlayer(_controller),
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             // pause
//             if (_controller.value.isPlaying) {
//               _controller.pause();
//             } else {
//               // play
//               _controller.play();
//             }
//           });
//         },
//         // icon
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }
