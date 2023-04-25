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
  late IconData _icon1;
  late IconData _icon2;
  late IconData _icon3;
  late String _result;

  @override
  void initState() {
    super.initState();
    _shuffleIcons();
    _result = '';
  }

  void _shuffleIcons() {
    _icon1 = _getRandomIcon();
    _icon2 = _getRandomIcon();
    _icon3 = _getRandomIcon();
  }

  IconData _getRandomIcon() {
    final int randomNumber = _random.nextInt(3);
    switch (randomNumber) {
      case 0:
        return Icons.star;
      case 1:
        return Icons.favorite;
      case 2:
        return Icons.flash_on;
      default:
        return Icons.error;
    }
  }

  String _checkResult() {
    if (_icon1 == _icon2 && _icon2 == _icon3) {
      return 'Bravo ! Vous avez gagné !';
    } else {
      return 'Dommage ! Réessayez !';
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(_icon1, size: 100.0),
                Icon(_icon2, size: 100.0),
                Icon(_icon3, size: 100.0),
              ],
            ),
            const SizedBox(height: 50.0),
            Text(_result),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _shuffleIcons();
            _result = _checkResult();
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}