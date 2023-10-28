import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'package:bmicalculator/card_icons.dart';

const defaultColor = Color(0xFF0A0E21);
const defaultCardColor =Color(0xFF1D1E33) ;
const inactiveCardColor = Color(0xFF111328);
const bottomColor = Colors.red;

enum Gender {
  female,
  male
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color activeCardColor = defaultCardColor;
  Color femaleCardColor = inactiveCardColor;
  Color maleCardColor = inactiveCardColor;

  showActiveCard(Gender selectedCard) {
    setState(() {
      if (selectedCard == Gender.female && femaleCardColor == activeCardColor) {
        femaleCardColor = inactiveCardColor;
      } else if (selectedCard == Gender.male &&
          maleCardColor == activeCardColor) {
        maleCardColor = inactiveCardColor;
      } else if (selectedCard == Gender.female) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else if (selectedCard == Gender.male) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showActiveCard(Gender.female);
                    },
                    child: BMICard(
                      cardColor: femaleCardColor,
                      cardChild: const CardChild(
                        cardIcon: FontAwesomeIcons.venus,
                        cardTitle: "FEMALE",
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showActiveCard(Gender.male);
                    },
                    child: BMICard(
                      cardColor: maleCardColor,
                      cardChild: const CardChild(
                          cardIcon: FontAwesomeIcons.mars, cardTitle: "MALE"),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Row(
                children: [
                  BMICard(
                    cardColor: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('150'), Text('cm')],
                        ),
                        Text('Slider goes here')
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
