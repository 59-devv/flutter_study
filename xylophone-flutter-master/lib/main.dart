import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      XylophoneApp(),
    );

class XylophoneApp extends StatelessWidget {
  AudioCache audioPlayer = AudioCache();

  Expanded makeColoredBox(Color color, int number) {
    return Expanded(
      child: ColoredBox(
        color: color,
        child: TextButton(
          onPressed: () {
            playSound(number);
          },
        ),
      ),
    );
  }

  void playSound(int number) => audioPlayer.play('note$number.wav');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              makeColoredBox(Colors.red, 1),
              makeColoredBox(Colors.orange, 2),
              makeColoredBox(Colors.yellow, 3),
              makeColoredBox(Colors.green, 4),
              makeColoredBox(Colors.green.shade800, 5),
              makeColoredBox(Colors.blue, 6),
              makeColoredBox(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
