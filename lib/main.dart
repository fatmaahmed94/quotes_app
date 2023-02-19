// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quotes_app/widgets/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

//class for card quotes(title,author )
class BestQuotes {
  String title;
  String author;
  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> {
  //list of all quotes
  List AllQuotes = [
    BestQuotes(author: "fatma", title: "كنت القريب وكنت أنت مقربي🔥"),
    BestQuotes(author: "batota", title: "فغدوت أشبه بالخصيم لخصمه"),
    BestQuotes(author: "fatoma", title: "عجبًا إذا لتقلب الأحوال 😉 "),
    BestQuotes(author: "fatima", title: "أنا ما طلبتك أن تعود لصحبتي ✋ "),
    BestQuotes(author: "fatima", title: "  بعد القطيعة، أو ترق لحالي✋ "),
    BestQuotes(author: "fatima", title: "فأنا بغيرك كامل مكتمل"),
    BestQuotes(author: "fatima", title: "لا أنت لي نقص ولا أنا سالب"),
  ];
  delete(BestQuotes item) {
    setState(() {
      AllQuotes.remove(item);
    });
  }

  addNewQuote() {
    setState(() {
      AllQuotes.add(
        BestQuotes(author: myController2.text, title: myController.text),
      );
    });
  }

  final myController = TextEditingController();
  final myController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(43, 29, 29, 36),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: myController,
                      decoration: InputDecoration(hintText: "ADD new quote"),
                      maxLength: 20,
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: myController2,
                      decoration: InputDecoration(hintText: "ADD author"),
                      maxLength: 20,
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          addNewQuote();
                        },
                        child: Text(
                          "ADD",
                          style: TextStyle(fontSize: 22),
                        ))
                  ],
                );
              },
              isScrollControlled: true);
        },
        backgroundColor: Color.fromARGB(255, 57, 25, 143),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 192, 75, 153),
        title: Text(
          "Best Quotes",
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ...AllQuotes.map((item) => CardWidget(
                item: item,
                delete: delete,
                mytitle: item.title,
                person: item.author,
              )).toList()
        ]),
      ),
    );
  }
}
