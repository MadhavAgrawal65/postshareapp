import 'package:flutter/material.dart';
import 'package:share/share.dart';

class TextPage extends StatelessWidget {
  final String content = "Hello World , Madhav here , developed this app to learn deeplinking in an flutter app ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(content, style: const TextStyle(fontSize: 18)),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
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
  final url = "postshareapp://open/text?id=123";
  Share.share('Check out this post: $url');
}

}
