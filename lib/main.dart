import 'package:flutter/material.dart';
import 'package:post_share_app/image_page.dart';
import 'package:post_share_app/text_page.dart';
import 'package:post_share_app/video_page.dart';
import 'navigation_page.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();

    _handleInitialUri();

    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _navigateToPage(uri);
      }
    }, onError: (err) {
    });
  }

  Future<void> _handleInitialUri() async {
    try {
      final Uri? initialUri = await getInitialUri();
      if (initialUri != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _navigateToPage(initialUri);
        });
      }
    } on FormatException {
    }
  }

  void _navigateToPage(Uri uri) {
  print('Received URI: $uri');
  print('Navigating to: $uri');
  
  if (uri.host == 'open') {
    if (uri.pathSegments.contains('text')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TextPage()),
      );
    } else if (uri.pathSegments.contains('image')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ImagePage()),
      );
    } else if (uri.pathSegments.contains('video')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VideoPage()),
      );
    }
  }
}



  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple[900],
        ),
      ),
      home: NavigationPage(),
    );
  }
}
