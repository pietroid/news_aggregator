import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key, required this.URL}) : super(key: key);

  final String URL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          NewsSource(
              imageURL:
                  'https://www.tecmundo.com.br/mobile/icon_64x64.5fe08bef7e81e4e45eddfe09ebe53b6d.png',
              name: 'Tecmundo'),
          SizedBox(
            height: 50,
          ),
          NewsTitle('Você sabe o que é mecânica quântica?'),
          NewsImage(
              imageURL:
                  'https://tm.ibxk.com.br/2021/12/03/03171613471441.jpg?ims=352x208'),
          SizedBox(
            height: 20,
          ),
          NewsBody(
              "Se você não esteve isolado do mundo e da internet nos últimos anos, você deve ter ouvido alguma coisa ou algum termo ligado com a palavra “quântico”. Seja entre os famigerados coachs ou entre “tratamentos”, “curas” e “medicinas”, a apropriação do termo que faz referência à Mecânica Quântica é bastante disseminada e chegou até mesmo na alimentação com a “nutrição quântica” e o, acredite, “sal quântico”.")
        ],
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
        Container(width: 35, child: Image(image: NetworkImage(imageURL))),
        SizedBox(
          width: 15,
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'calibri'),
        ),
      ],
    );
  }
}

class NewsTitle extends StatelessWidget {
  const NewsTitle(this.title, {Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
      style: TextStyle(fontSize: 15),
    );
  }
}
