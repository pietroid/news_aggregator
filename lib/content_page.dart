import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentPage extends StatelessWidget {
  const ContentPage(
      {Key? key,
      required this.newsSource,
      required this.newsImage,
      required this.newsTitle,
      required this.newsDate,
      required this.newsBody})
      : super(key: key);

  final Map newsSource;
  final String newsImage, newsTitle, newsDate, newsBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            NewsSource(
                imageURL: newsSource['icon'] ?? '', name: newsSource['name']),
            SizedBox(
              height: 10,
            ),
            NewsImage(imageURL: newsImage),
            SizedBox(
              height: 20,
            ),
            NewsTitle(title: newsTitle, date: newsDate),
            SizedBox(
              height: 30,
            ),
            NewsBody(newsBody)
          ],
        ),
      ),
    );
  }
}

class NewsSource extends StatelessWidget {
  const NewsSource({Key? key, required this.imageURL, required this.name})
      : super(key: key);

  final String name;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 30, child: Image(image: NetworkImage(imageURL))),
        SizedBox(
          width: 15,
        ),
        Text(
          name,
          style:
              GoogleFonts.openSans(fontSize: 23, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class NewsTitle extends StatelessWidget {
  const NewsTitle({required this.title, required this.date, Key? key})
      : super(key: key);
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.openSans(
                fontSize: 25, fontWeight: FontWeight.w700)),
        SizedBox(
          height: 8,
        ),
        Text(date,
            style: GoogleFonts.openSans(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic))
      ],
    );
  }
}

class NewsImage extends StatelessWidget {
  const NewsImage({Key? key, required this.imageURL}) : super(key: key);
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Image(
        image: NetworkImage(imageURL),
      ),
    );
  }
}

class NewsBody extends StatelessWidget {
  const NewsBody(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.w300),
    );
  }
}
