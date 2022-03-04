import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  final Function click;
  final bool isFavourite;
  const Favourite({Key? key, required this.click, this.isFavourite = false})
      : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  late bool _isFavourite;

  @override
  void initState() {
    super.initState();
    _isFavourite = this.widget.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavourite = !_isFavourite;
        });

        this.widget.click();
      },
      child: Icon(
        Icons.favorite,
        color: _isFavourite ? Colors.red : Colors.white,
      ),
    );
  }
}