import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
    required this.bottomLabel,
    required this.route,
  });

  final String bottomLabel;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bottomColor,
      margin: const EdgeInsets.only(top: 10.0),
      height: 70.0,
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Center(
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            child: Text(
              bottomLabel,
              style: kLargeButtonTextStyle,
            )),
      ),
    );
  }
}
