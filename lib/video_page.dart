import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:share/share.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  final String videoUrl = 'https://cdn.pixabay.com/video/2016/11/04/6254-190219700_large.mp4';

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.setLooping(true); 
          _controller.setVolume(0.0); 
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 50),
          if (_controller.value.isInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          else
            const Center(child: CircularProgressIndicator()),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              _shareContent();
            },
            child: const Text('Share'),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  void _shareContent() {
  final url = "postshareapp://open/video?id=789";
  Share.share('Check out this video: $url');
}


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
