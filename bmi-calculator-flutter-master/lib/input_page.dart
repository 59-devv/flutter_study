import 'dart:ffi';

import 'package:bmi_calculator/CalculatorBrain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'icon_content.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 200;
  int weight = 10;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
          backgroundColor: Color(0xFF0A0E21),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                    ),
                  ), // MALE
                  Expanded(
                    child: ReusableCard(
                      onTapFunction: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      color: selectedGender == GenderType.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: 'MALE',
                      ),
                    ),
                  ), // FEMALE
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kNumberTextStyle),
                        SizedBox(width: 3),
                        Text('cm', style: kLabelTextStyle)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x15EB1966),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderThumbShape(enabledThumbRadius: 30)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 250.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                          // print(newValue);
                          // this.height = newValue.toInt();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ), // SLIDER
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    this.weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    this.weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    this.age--;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    this.age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: "CALCULATOR",
              onTap: () {
                CalculatorBrain cal = CalculatorBrain(this.height, this.weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: cal.calculateBMI(),
                            resultText: cal.getResult(),
                            interpretation: cal.getInterpretation(),
                          )),
                );
              },
            )
          ],
        ));
  }
}

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  const BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 0.0,
      onPressed: () {
        onPressed();
      },
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: Icon(icon),
    );
  }
}
