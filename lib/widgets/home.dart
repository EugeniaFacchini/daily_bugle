import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:daily_bugle/widgets/dropdown_regione.dart';
import 'package:daily_bugle/widgets/dropdown_province.dart';
import 'package:daily_bugle/widgets/dropdown_category.dart';
import 'package:daily_bugle/models/news_model.dart';
import 'package:daily_bugle/screens/news_screen.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<News>> getNews() async {
    var res = await get(Uri.parse(
        'https://newsapi.org/v2/everything?q=$_provincia+$_category&language=it&apiKey=21fd58fd437247c9a0a37795f035b477'));
    var data = jsonDecode(res.body);
    List<News> news = [];
    for (var i = 0; i < data["articles"].length; i++) {
      print(data["articles"][i]);

      if (data["articles"][i]['content'] == null ||
          data["articles"][i]['urlToImage'] == null) {
        continue;
      }
      News n = News.withId(
          news: data["articles"][i]['content'],
          imageUrl: data["articles"][i]['urlToImage']);
      news.add(n);
    }
    return news;
  }

  String? _regione = null;
  String? _provincia = null;
  String? _category = null;

  List<News> _list = [];

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Il miglior sito di news in tempo reale in base alle tue preferenze',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'News Italiane aggiunte oggi',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.circle,
            color: Colors.red[500],
          ),
          const Text(
              '0'), //AL POSTO DELLO ZERO CI ANDRA' IL CONTATORE DELLE NEWS AGGIUNTE
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue,
          Colors.red,
        ],
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: 0,
              onTap: (index) {
                if (index == 0) {
                  // naviga verso preferiti
                }
                if (index == 1) {
                  // naviga verso salvati
                }
                if (index == 2) {
                  // naviga verso immetti notizia
                }
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "PREFERITI"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.cloud_download), label: "SALVATI"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.share), label: "IMMETTI NOTIZIA")
              ]),
          appBar: AppBar(
            title: const Text('DAILY BUGLE'),
            actions: [
              Container(
                width: 50,
                child: Image.asset(
                  'web/icons/logo.png',
                ),
              ),
            ],
          ),
          body: Column(children: [
            titleSection,
            Container(
              child: _regione == null
                  ? DropDownRegion(
                      onChange: (String? str) {
                        setState(() {
                          _regione = str;
                        });
                      },
                    )
                  : DropDownProvince(
                      regionName: _regione,
                      onChange: (str) {},
                    ),
            ),
            Container(child: DropDownCategory(onChange: (String? str) {
              setState(() {
                _category = str;
              });
            }))
          ]),
          floatingActionButton: SizedBox(
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () async {
                  var res = await getNews();
                  setState(() {
                    _list = res;
                  });
                  Navigator.of(context).push(MaterialPageRoute(builder: (bc) {
                    return NewsScreen(elements: _list);
                  }));
                },
              ),
            ),
            height: 80,
            width: 80,
          )),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
//ma che bel commento parte due