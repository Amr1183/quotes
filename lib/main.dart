// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quotes/quotes_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quotes(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class BestQuotes {
  String title;
  String author;

  BestQuotes({
    required this.title,
    required this.author,
  });
}

class _QuotesState extends State<Quotes> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  // ignore: non_constant_identifier_names
  List AllQuotes = [
    
  ];

  deleteQuote(BestQuotes item) {
    setState(() {
      AllQuotes.remove(item);
    });
  }

  addQuote() {
setState(() {
  AllQuotes.add(
        BestQuotes(title: myController.text, author: myController2.text));
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        decoration: InputDecoration(
                            hintText: "Quote",
                            hintStyle: TextStyle(fontSize: 22)),
                        maxLength: 120,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextField(
                        controller: myController2,
                        decoration: InputDecoration(
                            hintText: "Author",
                            hintStyle: TextStyle(fontSize: 22)),
                        maxLength: 25,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            addQuote();
                          },
                          child: Text("ADD",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.orange)))
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 57, 121),
        title: const Text(
          "Great Quotes",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: AllQuotes.map(
                    (item) => card_Widget(delete: deleteQuote, item: item))
                .toList()),
      ),
    );
  }
}
