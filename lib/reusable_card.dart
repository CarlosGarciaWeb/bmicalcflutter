import 'package:flutter/material.dart';




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
          color: cardColor,
        ),
        child: cardChild,
      ),
    );
  }
}
