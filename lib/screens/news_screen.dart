import 'package:flutter/material.dart';
import 'package:daily_bugle/models/news_model.dart';
import 'package:daily_bugle/widgets/news_list.dart';

class NewsScreen extends StatefulWidget {
  final List<News> elements;
  const NewsScreen({Key? key, required this.elements}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: NewsList(elements: this.widget.elements, clickFavorite: (_) {}));
  }
}
