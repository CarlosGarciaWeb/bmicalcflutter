import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'package:bmicalculator/card_icons.dart';
import 'package:bmicalculator/constants.dart';

enum Gender { female, male }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int _height = 180;
  int _weight = 60;
  int _age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: BMICard(
                        cardColor: Gender.female == selectedGender
                            ? defaultCardColor
                            : inactiveCardColor,
                        cardChild: const CardChild(
                          cardIcon: FontAwesomeIcons.venus,
                          cardTitle: "FEMALE",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: BMICard(
                        cardColor: Gender.male == selectedGender
                            ? defaultCardColor
                            : inactiveCardColor,
                        cardChild: const CardChild(
                            cardIcon: FontAwesomeIcons.mars, cardTitle: "MALE"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  BMICard(
                    cardColor: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: labelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              (_height / 100).toString(),
                              style: numStyle,
                            ),
                            const Text(
                              'm',
                              style: labelStyle,
                            )
                          ],
                        ),
                        Slider(
                          value: _height.toDouble(),
                          min: 120,
                          max: 240,
                          onChanged: (double newValue) {
                            setState(() {
                              _height = newValue.round();
                            });
                          },
                          activeColor: const Color(0xFFEB1555),
                          inactiveColor: const Color(0xFF8D8E98),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  BMICard(
                    cardColor: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: labelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              _weight.toString(),
                              style: numStyle,
                            ),
                            const Text(
                              "kg",
                              style: labelStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              newIcon: Icons.remove,
                              buttonFunction: () {
                                setState(() {
                                  _weight -= 1;
                                });
                              },
                            ),
                            RoundIconButton(
                              newIcon: Icons.add,
                              buttonFunction: () {
                                setState(() {
                                  _weight += 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  BMICard(
                    cardColor: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: labelStyle,
                        ),
                        Text(
                          _age.toString(),
                          style: numStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              newIcon: Icons.remove,
                              buttonFunction: () {
                                setState(() {
                                  _age -= 1;
                                });
                              },
                            ),
                            RoundIconButton(
                              newIcon: Icons.add,
                              buttonFunction: () {
                                setState(() {
                                  _age += 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomColor,
              margin: const EdgeInsets.only(top: 10.0),
              height: 50.0,
              child: Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/results');
                    },
                    child: const Text(
                      'CALCULATE',
                      style: labelStyle,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.newIcon, required this.buttonFunction});

  final IconData newIcon;

  final void Function()? buttonFunction;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: buttonFunction,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      constraints: const BoxConstraints(
        maxWidth: 56.0,
        maxHeight: 56.0,
      ),
      elevation: 16.0,
      disabledElevation: 16.0,
      child: Icon(
        newIcon,
        color: Colors.white,
      ),
    );
  }
}
