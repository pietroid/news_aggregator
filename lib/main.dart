import 'package:flutter/material.dart';
import 'package:news_aggregator_flutter/content_page.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Vertical fullscreen')),
        body: PageView(
          scrollDirection: Axis.vertical,
          children: [
            ContentPage(
                URL:
                    'https://www.tecmundo.com.br/ciencia/229907-voce-sabe-mecanica-quantica.htm'),
            ContentPage(
                URL:
                    'https://generalassemb.ly/blog/a-guide-to-startup-compensation/'),
            ContentPage(
                URL:
                    'https://www.howtogeek.com/764041/what-is-scratch-the-programming-language/'),
            ContentPage(
                URL:
                    'https://www.omelete.com.br/ccxp/resurrections-niobe-sati'),
            ContentPage(
                URL:
                    'https://www.inc.com/jeff-haden/why-emotionally-intelligent-leaders-avoid-feedback-sandwich-to-improve-employee-performance-backed-by-science.html'),
          ],
        ),
      ),
    );
  }
}
