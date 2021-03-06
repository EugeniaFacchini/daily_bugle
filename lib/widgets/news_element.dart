import 'package:flutter/material.dart';
import 'package:daily_bugle/widgets/favourites.dart';

class NewsElement extends StatelessWidget {
  final String news;
  final String imageUrl;
  final bool isFavorite;
  final String url;
  final Function clickFavorite;

  const NewsElement(
      {Key? key,
      required this.imageUrl,
      required this.news,
      required this.isFavorite,
      required this.url,
      required this.clickFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 40,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          //alignment: AlignmentDirectional.center,
          children: [
            ListTile(
              leading: Icon(Icons.arrow_drop_down_circle),
              title: const Text('Link alla News'),
              subtitle: Text(
                url,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Image.network(imageUrl, fit: BoxFit.cover),
            Positioned(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(
                  news,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              bottom: 10,
              left: 10,
            ),
            SizedBox(
              child: Favourite(
                click: this.clickFavorite,
                isFavourite: this.isFavorite,
              ),
              height:50,
              width:50,
            ),
          ],
        ),
      ),
    );
  }
}
