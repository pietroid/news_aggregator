import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key, required this.URL}) : super(key: key);

  final String URL;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Expanded(
        child: WebView(
          initialUrl: URL,
        ),
      ),
    );
  }
}
