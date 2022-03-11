import 'package:flutter/material.dart';
import 'package:daily_bugle/models/news_model.dart';
import 'package:daily_bugle/widgets/news_list.dart';

class NewsScreen extends StatefulWidget {
  final List<News> elements;
  final dynamic  clickFavorite;
  final String? province;
  
  const NewsScreen({Key? key, required this.elements,required this.clickFavorite, required this.province}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  

  @override
  Widget build(BuildContext context) {
    final String? _province= widget.province;
    return Scaffold(
        appBar: AppBar(title: Text('NEWS $_province')),
        body: NewsList(elements: widget.elements, clickFavorite: widget.clickFavorite));
  }
}


