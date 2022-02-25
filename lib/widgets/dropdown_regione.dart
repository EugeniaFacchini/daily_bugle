import 'package:flutter/material.dart';

class DropDownRegion extends StatefulWidget {
  const DropDownRegion({Key? key, required this.onChange}) : super(key: key);
  final void Function(String? str) onChange;
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownRegion> {
  String? _chosenValue = "";
  var A = [
    "",
    'Abruzzo',
    'Basilicata',
    'Calabria',
    'Campania',
    'Emilia Romagna',
    'Friuli Venezia Giulia',
    'Lazio',
    'Liguria',
    'Lombardia',
    'Marche',
    'Molise',
    'Piemonte',
    'Puglia',
    'Sardegna',
    'Sicilia',
    'Toscana',
    'Trentino Alto Adige',
    'Umbria',
    'Val d Aosta',
    'Veneto',
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
