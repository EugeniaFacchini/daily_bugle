import 'package:uuid/uuid.dart';

class News {
  String news;
  String imageUrl;
  String url;

  String? _id;
  bool? isFavorite;

  String? get id => _id;

  News({
    required this.news,
    required this.imageUrl,
    required this.url,
    this.isFavorite = false,
  });

  News.withId({required this.news, required this.imageUrl, required this.url}) {
    isFavorite = false;
    _id = Uuid().v1();
  }
}
