import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ImagePage extends StatelessWidget {
  final String imageUrl = 'https://images.unsplash.com/photo-1725203574073-79922f64110a?q=80&w=2612&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  const ImagePage({super.key}); 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 50,),
          Image.network(imageUrl),
          const Spacer(),
          ElevatedButton(
            onPressed: () async {
              _shareContent();
            },
            child: const Text('Share'),
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }

  void _shareContent() {
  final url = "postshareapp://open/image?id=456";
  Share.share('Check out this image: $url');
}

}
