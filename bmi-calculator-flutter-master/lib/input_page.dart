import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;

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
                    child: ReusableCard(
                      onTapFunction: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      color: selectedGender == GenderType.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTapFunction: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      color: selectedGender == GenderType.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: 'MALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(color: activeCardColor),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(color: activeCardColor),
                  ),
                  Expanded(
                    child: ReusableCard(color: activeCardColor),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              height: bottomContainerHeight,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
            )
          ],
        ));
  }
}
