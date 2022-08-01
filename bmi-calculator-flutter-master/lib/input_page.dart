import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
          backgroundColor: Color(0xFF0A0E21),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(color: Color(0xFF1D1E33)),
                  ),
                  Expanded(
                    child: ReusableCard(color: Color(0xFF1D1E33)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(color: Color(0xFF1D1E33)),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(color: Color(0xFF1D1E33)),
                  ),
                  Expanded(
                    child: ReusableCard(color: Color(0xFF1D1E33)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;

  ReusableCard({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
