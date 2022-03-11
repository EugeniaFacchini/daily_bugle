import 'package:flutter/material.dart';
import 'package:daily_bugle/models/news_model.dart';
import 'package:daily_bugle/widgets/news_list.dart';

class SavedScreen extends StatefulWidget {
  //final List<News> elements;
  //final dynamic  clickFavorite;
  
  const SavedScreen({Key? key,}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        );
  }
}