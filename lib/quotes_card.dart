// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quotes/main.dart';

class card_Widget extends StatelessWidget {
  final Function delete;
  final BestQuotes item;
  const card_Widget({super.key, required this.delete, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(11),
      color: const Color.fromARGB(255, 57, 66, 151),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      // ignore: prefer_const_literals_to_create_immutables
      child: Container(
        padding: const EdgeInsets.all(11),
        child: Column(children: [
          Text(
            item.title,
            style: TextStyle(fontSize: 25, color: Colors.white),
            textDirection: TextDirection.rtl,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    delete(item);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 20,
                  )),
              Text(item.author,
                  style: TextStyle(color: Colors.white, fontSize: 20))
            ],
          )
        ]),
      ),
    );
  }
}
