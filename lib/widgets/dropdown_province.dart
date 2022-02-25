import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter/services.dart';

class DropDownProvince extends StatefulWidget {
  const DropDownProvince(
      {Key? key, required this.onChange, required String? this.regionName})
      : super(key: key);
  final void Function(String? str) onChange;
  final String? regionName;
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownProvince> {
  String? _chosenValue = "";
  List<DropdownMenuItem<String>> _widgets = [];

  Future<List<DropdownMenuItem<String>>> readJson() async {
    final String province =
        await rootBundle.loadString('assets/data/province.json');
    final data = await json.decode(province);
    var L= (data[widget.regionName]as List<dynamic>).map((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
    return L;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readJson(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data as List<DropdownMenuItem<String>>;
            return DropdownButton<String>(
                value: _chosenValue,
                //elevation: 5,
                style: TextStyle(color: Colors.black),
                items: data,
                onChanged: (String? str) {
                  setState(() {
                    _chosenValue = str;
                    widget.onChange(str);
                  });
                });
          }else{
            return const Center(
              child:  CircularProgressIndicator(),
            );
          }
        }));
  }
}
