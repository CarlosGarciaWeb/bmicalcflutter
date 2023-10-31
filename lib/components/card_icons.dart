import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/constants.dart';


class CardChild extends StatelessWidget {
  const CardChild({super.key, required this.cardIcon, required this.cardTitle});

  final IconData cardIcon;
  final String cardTitle;

  final double cardChildSpacing = 15.0;
  final double cardChildIconSize = 50.0;

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
        Text(cardTitle, style: labelStyle,)
      ],
    );
  }
}