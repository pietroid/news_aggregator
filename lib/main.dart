import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_aggregator_flutter/bloc/news_summaries_cubit.dart';
import 'package:news_aggregator_flutter/content_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_aggregator_flutter/repository/news_summaries_service.dart';
import 'package:news_aggregator_flutter/repository/news_summary.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => NewsSummariesService()),
        Bind.singleton((i) => NewsSummariesCubit()),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => HomePage())];
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp().modular();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.get<NewsSummariesCubit>().fetchAll();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<NewsSummariesCubit, NewsSummariesState>(
            bloc: Modular.get<NewsSummariesCubit>(),
            builder: (context, state) {
              if (state.status == NewsSummariesStatus.loading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state.status == NewsSummariesStatus.error) {
                return Center(
                  child: Text('Erro'),
                );
              }

              return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.content.length,
                  onPageChanged: (index) =>
                      Modular.get<NewsSummariesCubit>().setIndex(index),
                  itemBuilder: (context, count) {
                    NewsSummary newsSummary = state.content[count];
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
            }),
      ),
    );
  }
}
