import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> _quoteList = [
    'ไก่ที่หมดจาน ดีกว่าการที่เธอหมดใจ',
    'เหมาะกับการอยู่ในวงเหล้า มากกว่าการเข้าไปอยู่ในใจใคร',
    'ใบไม้ยังร่วง นับประสาอะไรกับคนง่วงอย่างเรา',
    'ไม่ถูกหวยไม่เป็นไร ขอเป็นคนที่ถูกใจเธอแทนแล้วกัน',
    'คงจะมีแต่แชมพูเท่านั้นแหละ ที่เป็นห่วงผม',
  ];
  static const List<MaterialColor> _colorList = [
    Colors.blue,
    Colors.yellow,
    Colors.deepPurple,
    Colors.red,
    Colors.pink,
  ];

  var _quote = _quoteList[0]; //state variable
  var _colors = _colorList[0];

  void _handldClickGo() {
    var random = Random();

    String newQuote;
    //Text
    do {
      var randomIndex = random.nextInt(_quoteList.length);
      newQuote = _quoteList[randomIndex];
    } while (newQuote == _quoteList);

    //Color
    MaterialColor newColor;
    do {
      var randomIndex = random.nextInt(_colorList.length);
      newColor = _colorList[randomIndex];
    } while (newColor == _colorList);

    setState(() {
      _quote = newQuote;
      _colors = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Funny Quotes')),
      floatingActionButton: FloatingActionButton(
        child: Text('Go'),
        onPressed: _handldClickGo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            _quote,
            style: TextStyle(
              color: _colors,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
