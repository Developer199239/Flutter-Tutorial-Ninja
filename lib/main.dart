import 'package:flutter/material.dart';
import 'package:ninja/quote.dart';
import 'quote_card.dart';

void main() {
  runApp(const MaterialApp(
    home: Quotes()
  ));
}

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  List<Quote> qoutes = [
    Quote(author: "Author1", text: "Be yourself; everyone else is already taken"),
    Quote(author: "Author2", text: "I have nothing to declare except my genius"),
    Quote(author: "Author3", text: "The truth is rarely pure and never simple"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Awesome Quotes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: qoutes.map((e) => QuoteCard(
            quote: e,
          delete: (){
              setState(() {
                qoutes.remove(e);
              });
          },

        )).toList(growable: true),
      ),
    );
  }
}





