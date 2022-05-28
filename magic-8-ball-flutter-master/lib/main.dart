import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Ask Me Anything!',
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: BallPageBody(),
    );
  }
}

class BallPageBody extends StatefulWidget {
  const BallPageBody({Key? key}) : super(key: key);

  @override
  State<BallPageBody> createState() => _BallPageBodyState();
}

class _BallPageBodyState extends State<BallPageBody> {
  int randomNumber = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: TextButton(
          onPressed: () {
            setState(() {
              randomNumber = Random().nextInt(5) + 1;
            });
            print('I got clicked!');
            print('number: $randomNumber');
          },
          child: Image.asset('images/ball$randomNumber.png'),
        ),
      ),
    );
  }
}
