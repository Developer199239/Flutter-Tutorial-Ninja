import 'package:flutter/material.dart';
import 'package:ninja/quote.dart';

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


  Widget quoteTemplate(quote) {
    return QuoteCard(quote: quote);
  }


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
        children: qoutes.map((e) => quoteTemplate(e)).toList(growable: true),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final Quote quote;
  QuoteCard({ required this.quote});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.lightBlue[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



