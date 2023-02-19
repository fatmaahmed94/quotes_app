// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../main.dart';

class CardWidget extends StatelessWidget {
  final String mytitle;
  final String person;
  final Function delete;
  final BestQuotes item;

  const CardWidget(
      {required this.mytitle,
      required this.person,
      required this.delete,
      required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 167, 33, 149),
      margin: EdgeInsets.all(11),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      child: Container(
        padding: EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              mytitle,
              style: TextStyle(fontSize: 33, color: Colors.white),
              textDirection: TextDirection.rtl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    delete(item);
                  },
                  icon: Icon(Icons.delete),
                  iconSize: 27,
                  color: Color.fromARGB(255, 255, 217, 217),
                ),
                Text(
                  person,
                  style: TextStyle(fontSize: 33, color: Colors.white),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
