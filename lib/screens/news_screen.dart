import 'package:flutter/material.dart';
import 'package:daily_bugle/models/news_model.dart';
import 'package:daily_bugle/widgets/news_list.dart';

class NewsScreen extends StatefulWidget {
  final List<News> elements;
  final dynamic  clickFavorite;
  
  const NewsScreen({Key? key, required this.elements,required this.clickFavorite}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: NewsList(elements: widget.elements, clickFavorite: widget.clickFavorite));
  }
}


