import 'package:flutter/material.dart';
import 'package:news_aggregator_flutter/content_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_aggregator_flutter/repository/news_summaries_service.dart';
import 'package:news_aggregator_flutter/repository/news_summary.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsSummariesService nss = NewsSummariesService();
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder(
              future: nss.getNewsSummaries(),
              builder: (context, AsyncSnapshot<List<NewsSummary>> snapshot) {
                if (snapshot.hasData) {
                  List<NewsSummary> newsSummaries = snapshot.data!;
                  return PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, count) {
                        NewsSummary newsSummary = newsSummaries[count];
                        return ContentPage(
                          newsSource: {
                            'icon': newsSummary.newsPage.iconURL,
                            'name': newsSummary.newsPage.name,
                          },
                          newsImage: newsSummary.mainImageURL,
                          newsTitle: newsSummary.title,
                          newsDate: '',
                          newsBody: newsSummary.mainText,
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
