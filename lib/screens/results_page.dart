import 'package:flutter/material.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/components/bottom_container.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Results')),
      ),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: BMICard(
                cardColor: defaultCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'UNDERWEIGHT',
                      style: kResultsHeaderStyle,
                    ),
                    Text(
                      '28.5',
                      style: numStyle,
                    ),
                    Text('Description')
                  ],
                ),
              ),
            ),
            BottomContainer(
                bottomLabel: 'RE-CALCULATE',
                route: '/' 
                )
          ],
        ),
      ),
    );
  }
}
