import 'package:flutter/material.dart';
import 'package:daily_bugle/widgets/dropdown_regione.dart';
import 'package:daily_bugle/widgets/dropdown_province.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _regione = null;
  String? _provincia = null;
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.favorite, 'PREFERITI'),
        _buildButtonColumn(color, Icons.cloud_download, 'SALVATI'),
        _buildButtonColumn(color, Icons.share, 'IMMETTI NOTIZIA'),
      ],
    );
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
            color: Colors.purple[500],
          ),
          const Text(
              '0'), //AL POSTO DELLO ZERO CI ANDRA' IL CONTATORE DELLE NEWS AGGIUNTE
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('DAILY BUGLE'),
      ),
      body: Column(children: [
        titleSection,
        buttonSection,
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
      ]),
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
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
