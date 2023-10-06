// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoId;

  const VideoPlayerScreen({super.key, required this.videoId});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
                onEnded: (metadata) {
                  SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.portraitUp]);
                  _controller.pause();
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton.outlined(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back))
                //  ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(20))),
                //   onPressed: () {
                //     SystemChrome.setPreferredOrientations(
                //         [DeviceOrientation.portraitUp]);
                //     _controller.pause();
                //     Navigator.of(context).pop();
                //   },
                //   child: const Text('Back'),
                // ),
                ),
          ],
        ),
      ),
    );
  }
}
