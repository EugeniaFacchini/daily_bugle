import 'package:flutter/material.dart';

import 'package:daily_bugle/widgets/dropdown_regione.dart';

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
        title: Text('Daily Bugle'),
        centerTitle: true,
      ),
       body: Center(
         child: Container(
          child: DropDownRegion() ,
        ),
       ),
    );
  }
}
