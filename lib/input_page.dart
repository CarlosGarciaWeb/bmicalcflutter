import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const defaultColor = Color(0xFF0A0E21);
const defaultCardColor = Color(0xFF1D1E33);
const bottomColor = Colors.red;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Center(
        child: Column(
          children: [
            const Expanded(
              child: Row(
                children: [
                  BMICard(
                    cardColor: defaultCardColor,
                    cardChild: CardChild(
                      cardIcon: FontAwesomeIcons.venus,
                      cardTitle: "FEMALE",
                    ),
                  ),
                  BMICard(
                    cardColor: defaultCardColor,
                    cardChild: CardChild(
                        cardIcon: FontAwesomeIcons.mars, cardTitle: "MALE"),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Row(
                children: [
                  BMICard(
                    cardColor: defaultCardColor,
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
                    cardColor: defaultCardColor,
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
                    cardColor: defaultCardColor,
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

class CardChild extends StatelessWidget {
  const CardChild({super.key, required this.cardIcon, required this.cardTitle});

  final IconData cardIcon;
  final String cardTitle;

  final double cardChildSpacing = 15.0;
  final double cardChildIconSize = 56.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          cardIcon,
          size: cardChildIconSize,
        ),
        SizedBox(height: cardChildSpacing),
        Text(cardTitle)
      ],
    );
  }
}

class BMICard extends StatelessWidget {
  const BMICard({super.key, required this.cardColor, required this.cardChild});

  final Widget cardChild;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        height: 200.00,
        width: 170.00,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: defaultCardColor,
        ),
        child: cardChild,
      ),
    );
  }
}
