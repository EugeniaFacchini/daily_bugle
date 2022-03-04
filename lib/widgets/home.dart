import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:daily_bugle/widgets/dropdown_regione.dart';
import 'package:daily_bugle/widgets/dropdown_province.dart';
import 'package:daily_bugle/widgets/dropdown_category.dart';
import 'package:daily_bugle/models/news_model.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<News> getNews() async {
    var res = await get(Uri.parse(
        ' https://newsapi.org/v2/top-headlines?q=$_provincia&category=$_category&apiKey=21fd58fd437247c9a0a37795f035b477'));
    var data = jsonDecode(res.body);
    return News.withId(news: data['content'], imageUrl: data['urlToImage']);
  }

  String? _regione = null;
  String? _provincia = null;
  String? _category = null;

  final List<News> _list = [];

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
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
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.circle,
            color: Colors.blue[500],
          ),
          const Text(
              '0'), //AL POSTO DELLO ZERO CI ANDRA' IL CONTATORE DELLE NEWS AGGIUNTE
        ],
      ),
    );

    return Scaffold(
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
                    _list.add(res);
                  });
                },
                child: Icon(
                  Icons.add,
                )),
          ),
          height: 80,
          width: 80,
        ));
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
//ma che bel commento