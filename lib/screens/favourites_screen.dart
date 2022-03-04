import 'package:flutter/material.dart';
import 'package:daily_bugle/models/news_model.dart';
import 'package:daily_bugle/widgets/news_list.dart';
<<<<<<< HEAD
=======
import 'package:daily_bugle/widgets/news_element.dart';
>>>>>>> 66db0088343b09af835482f062218678920ec78b

class FavouriteScreen extends StatefulWidget {
  final List<News> elements;
  const FavouriteScreen({Key? key, required this.elements}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: NewsList(elements: this.widget.elements, clickFavorite: (_) {}));
  }
}
