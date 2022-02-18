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
        title: Text('Daily Bugle'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: DropdownButton(
            items: [
              DropdownMenuItem(
                  child: Text("Emilia Romagna")),
                  DropdownMenuItem(child: Text("Trentino Alto Adige"))],
            onChanged: null,
          ),
        ),
      ),
    );
  }
}
