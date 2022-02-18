import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Daily Buglr'),
          centerTitle: true,
        ));
        // floatingActionButton: SizedBox(
        //   child: FittedBox(
        //     child: FloatingActionButton(
        //         onPressed: () async {
        //           var res = await getPhoto();
        //           setState(() {
        //             _list.add(res);
        //           });
        //         },
        //         child: Icon(
        //           Icons.add,
        //         )),
        //   ),
        //   height: 80,
        //   width: 80,
        // ),
        // body: PicList(
        //   clickFavorite: setFavoriteFlag,
        //   elements: _list,
        // ));
  }

  // void setFavoriteFlag(picQuoteGuid) {
  //   setState(() {
  //     for (var item in _list) {
  //       if (item.id == picQuoteGuid) {
  //         item.isFavorite = !item.isFavorite!;
  //       }
  //     }
  //   });
  // }
}
