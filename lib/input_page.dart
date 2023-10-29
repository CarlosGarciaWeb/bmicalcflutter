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
                  GestureDetector(
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
                  GestureDetector(
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
                              _height.toString(),
                              style: numStyle,
                            ),
                            const Text(
                              'cm',
                              style: labelStyle,
                            )
                          ],
                        ),
                        Slider(
                          value: _height.toDouble(),
                          min: 120,
                          max: 240,
                          onChanged: (double newValue) {
                            print(newValue);
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
                        const Text('WEIGHT'),
                        const Text('87'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )),
                            TextButton(
                                onPressed: () {},
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
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
                        const Text('AGE'),
                        const Text('25'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )),
                            TextButton(
                                onPressed: () {},
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
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
            ),
          ],
        ),
      ),
    );
  }
}
