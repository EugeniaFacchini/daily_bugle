//business, entertainement, general, health, science, sport, technology.
import 'package:flutter/material.dart';

class DropDownCategory extends StatefulWidget {
  const DropDownCategory({Key? key, required this.onChange}) : super(key: key);
  final void Function(String? str) onChange;
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownCategory> {
  String? _chosenValue = "";
  var A = [
    "",
    "business",
    "entertainement",
    "general",
    "health",
    "science",
    "sport",
    "technology"

  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: _chosenValue,
        //elevation: 5,
        style: TextStyle(color: Colors.black),
        items: A,
        onChanged: (String? str){setState(() {
          _chosenValue = str;
          widget.onChange(str);
        });}
        );
  }
}
