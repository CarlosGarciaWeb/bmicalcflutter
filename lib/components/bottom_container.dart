import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
    required this.bottomLabel,
    required this.onPress,
  });

  final String bottomLabel;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bottomColor,
      margin: const EdgeInsets.only(top: 10.0),
      height: 70.0,
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Center(
        child: TextButton(
            onPressed: onPress,
            child: Text(
              bottomLabel,
              style: kLargeButtonTextStyle,
            )),
      ),
    );
  }
}
