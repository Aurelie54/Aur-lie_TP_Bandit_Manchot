import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bandit Manchot',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(title: 'Bandit Manchot'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Random _random = Random();

  late String _symbol1;
  late String _symbol2;
  late String _symbol3;
  late String _resultMessage;

  @override
  void initState() {
    super.initState();
    _reset();
  }

  void _reset() {
    _resultMessage = '';
    _symbol1 = _getRandomSymbol();
    _symbol2 = _getRandomSymbol();
    _symbol3 = _getRandomSymbol();
  }

  String _getRandomSymbol() {
    const List<String> symbols = ['bar', 'cerise', 'cloche', 'diamant', 'fer-a-cheval', 'pasteque', 'sept'];
    final int randomNumber = _random.nextInt(symbols.length);
    return symbols[randomNumber];
  }

  String _checkResult() {
    if (_symbol1 == _symbol2 && _symbol2 == _symbol3) {
      if (_symbol1 == 'sept') {
        // Afficher un message spécial ou jouer une animation si les symboles sont égaux et égaux à sept
        return 'JACKPOT!!!';
      } else {
        return 'Congratulations, you win!';
      }
    } else {
      return 'You Loose... Try again!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bandit Manchot'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/casino.jpg',
                width: 200,
                height: 200,
                ),
            Positioned(
            top: -30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,)
                          )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset('assets/images/$_symbol1.png'),
                ),
                SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset('assets/images/$_symbol2.png'),
                ),
                SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset('assets/images/$_symbol3.png'),
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            Text(
              _resultMessage,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: _resultMessage == 'JACKPOT!!!' ? Colors.red : Colors.black,      
              ),
            ),    
      Visibility(
      visible: _resultMessage == 'JACKPOT!!!',
      child: SizedBox(
        height: 150,
        child: Image.asset('assets/images/jackpot.gif'),
      ),
    ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _reset();
                        _resultMessage = _checkResult();
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}