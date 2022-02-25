import 'package:flutter/material.dart';

import 'package:daily_bugle/widgets/dropdown_regione.dart';
import 'package:daily_bugle/widgets/dropdown_province.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _regione = null;
  String? _provincia = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Bugle'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: _regione == null
              ? DropDownRegion(
                  onChange: (String? str) {
                    setState(() {
                      _regione = str;
                    });
                  },
                )
              : DropDownProvince(regionName: _regione, onChange: (str) {},),
        ),
      ),
    );
  }
}
