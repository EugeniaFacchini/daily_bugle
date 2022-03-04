import 'package:uuid/uuid.dart';

class News {
  String news;
  String imageUrl;

  String? _id;
  bool? isFavorite;

  String? get id => _id;

  News({
    required this.news,
    required this.imageUrl,
    this.isFavorite = false,
  });

  News.withId({required this.news, required this.imageUrl}) {
    isFavorite = false;
    _id = Uuid().v1();
  }
}
