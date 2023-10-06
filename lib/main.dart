import 'package:flutter/material.dart';
import 'package:videoplayer/screens/splash.dart';

void main() {
  runApp(const VideoPlayer());
}

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const ScreenSplash(),
    );
  }
}
