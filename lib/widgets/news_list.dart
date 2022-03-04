import 'package:flutter/material.dart';
import 'package:daily_bugle/models/news_model.dart';
import 'package:daily_bugle/widgets/news_element.dart';

class NewsList extends StatelessWidget {
  final List<News> elements;
  final void Function(String picQuoteGuid) clickFavorite;
  
  const NewsList({Key? key, required this.elements, required this.clickFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (var i = 0; i < elements.length; i++) {
      var e = elements[i];
      widgets.add(NewsElement(
        key: Key(e.id!),
        imageUrl: e.imageUrl,
        news: e.news,
        isFavorite: e.isFavorite ?? false,
        clickFavorite: (){
          this.clickFavorite(e.id!);
        },
      ));
    }

    return ListView(
      children: widgets,
    );
  }
}
