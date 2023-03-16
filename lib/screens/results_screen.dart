import 'package:bmi_app/calculator_brain.dart';
import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_app/utils/constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiBrain});

  CalculatorBrain bmiBrain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                child: Center(
                    child: Text(
                      "Your Result",
                      style: ktitleTextStyle,
                    )),
              )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiBrain.bmiResult(),
                    style: kresultTextStyle,
                  ),
                  Text(
                    bmiBrain.bmiResultText(),
                    style: kbmiTextStyle,
                  ),
                  Text(
                    bmiBrain.bmiDescription(),
                    style: kbodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(title: "RECALCULATE", onTap: (){
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
