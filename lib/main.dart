import 'package:flutter/material.dart';
import 'package:news_aggregator_flutter/content_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: PageView(
            scrollDirection: Axis.vertical,
            children: [
              ContentPage(
                newsSource: {
                  'icon':
                      'https://www.tecmundo.com.br/mobile/icon_64x64.5fe08bef7e81e4e45eddfe09ebe53b6d.png',
                  'name': 'Tecmundo',
                },
                newsImage:
                    'https://tm.ibxk.com.br/2021/12/03/03171613471441.jpg?ims=352x208',
                newsTitle: 'Você sabe o que é mecânica quântica?',
                newsDate: 'Segunda-feira, 16/12/2021',
                newsBody:
                    "Se você não esteve isolado do mundo e da internet nos últimos anos, você deve ter ouvido alguma coisa ou algum termo ligado com a palavra “quântico”. Seja entre os famigerados coachs ou entre “tratamentos”, “curas” e “medicinas”, a apropriação do termo que faz referência à Mecânica Quântica é bastante disseminada e chegou até mesmo na alimentação com a “nutrição quântica” e o, acredite, “sal quântico”.",
              ),
              ContentPage(
                newsSource: {
                  'icon':
                      'https://miro.medium.com/fit/c/128/128/1*yCwNxLbyLoSw_NMnqGop0Q.png',
                  'name': 'UX Planet',
                },
                newsImage:
                    'https://miro.medium.com/max/1400/1*_ilHSOk2pIR9H_amXr24tw.png',
                newsTitle: 'UX: Infinite Scrolling vs. Pagination',
                newsDate: 'Segunda-feira, 16/12/2021',
                newsBody:
                    "“I have a lot of content to display, should go for infinite scrolling or pagination for my content?” Some designers still not sure which method to choose for their project. Each method has their strengths and weaknesses and in this article we’ll overview the two methods and decide which one we should use for our projects.",
              ),
              ContentPage(
                newsSource: {
                  'icon': 'https://canaltech.com.br/favicon-32x32.png',
                  'name': 'Canaltech',
                },
                newsImage:
                    'https://t.ctcdn.com.br/emiGr-u_KaRjWGGFoAhojMvsE5c=/660x0/smart/i369186.png',
                newsTitle:
                    'Criador de Second Life alerta sobre riscos na proliferação de metaversos',
                newsDate: 'Segunda-feira, 16/12/2021',
                newsBody:
                    "Pioneiro na construção do game de mundo virtual Second Life, Philip Rosedale disse que a construção de um metaverso é algo que precisa ser minuciosamente planejado para que não haja consequências indesejadas. Em entrevista à revista Time, o fundador do jogo, febre em um passado não tão distante, falou sobre a importância de um sistema de moderação para permitir uma convivência harmônica no ambiente digital.",
              ),
              ContentPage(
                newsSource: {
                  'icon': 'https://www.incimages.com/favicons/favicon.ico',
                  'name': 'Inc.',
                },
                newsImage:
                    'https://img-cdn.inc.com/image/upload/w_1920,h_1080,c_fill/images/panoramic/GettyImages-1134519205_489099_zoykkb.jpg',
                newsTitle:
                    "Why Emotionally Intelligent Leaders Avoid the 'Feedback Sandwich'",
                newsDate: 'Segunda-feira, 16/12/2021',
                newsBody:
                    "Most of us were taught to deliver constructive feedback by using the feedback sandwich: Start with a positive, share the negative, close with a positive.Unfortunately, the feedback sandwich is always tough to swallow.Like the time a boss told me, I really appreciate how you always come prepared to the supervisor meetings. But you sometimes run over everyone else with all your facts and figures and productivity results. Still: You're a really valuable member of the team.The meat of the sandwich -- the you run over everyone else with your facts and figures -- was admittedly true.",
              ),
              ContentPage(
                newsSource: {
                  'icon': 'https://www.quantamagazine.org/favicon.png',
                  'name': 'Quanta magazine',
                },
                newsImage:
                    'https://d2r55xnwy6nx47.cloudfront.net/uploads/2020/10/HS-BlackHole_2880x1620_Lede.jpg',
                newsTitle: "The Most Famous Paradox in Physics Nears Its End",
                newsDate: 'Segunda-feira, 16/12/2021',
                newsBody:
                    "In a series of breakthrough papers, theoretical physicists have come tantalizingly close to resolving the black hole information paradox that has entranced and bedeviled them for nearly 50 years. Information, they now say with confidence, does escape a black hole. If you jump into one, you will not be gone for good. Particle by particle, the information needed to reconstitute your body will reemerge. Most physicists have long assumed it would; that was the upshot of string theory, their leading candidate for a unified theory of nature. But the new calculations, though inspired by string theory, stand on their own, with nary a string in sight. Information gets out through the workings of gravity itself — just ordinary gravity with a single layer of quantum effects.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
