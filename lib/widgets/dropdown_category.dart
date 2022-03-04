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
    "Economia",
    "spettacolo",
    "notizie",
    "salute",
    "scienza",
    "sport",
    "tecnologia"
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 240,
        child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(width: 3, color: Colors.blue)),
            ),
            dropdownColor: Colors.blue[200],
            iconEnabledColor: Colors.red,
            value: _chosenValue,
            //elevation: 5,
            style: TextStyle(color: Colors.black),
            items: A,
            onChanged: (String? str) {
              setState(() {
                _chosenValue = str;
                widget.onChange(str);
              });
            }));
  }
}
