import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'content_page/bloc/news_summaries_cubit.dart';
import 'content_page/bloc/repository/news_summaries_service.dart';
import 'content_page/view/home_page_view.dart';

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
      [ChildRoute('/', child: (context, args) => HomePageView())];
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp().modular();
  }
}
