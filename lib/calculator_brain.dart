import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  CalculatorBrain({required this.height, required this.weight});
  late double bmi;
  bmiResult(){
      bmi = (weight/pow(height/100, 2));
      return bmi.toStringAsFixed(1);
  }

  bmiResultText(){
    if(bmi>25.0){
      return "Overweight";
    }else if(bmi > 18.5){
      return "Normal";
    }else{
      return "Underweight";
    }
  }

  bmiDescription(){
    if(bmi>25.0){
      return "You have more weight, eat less :)";
    }else if(bmi > 18.5){
      return "You have normal weight, keep it up!";
    }else{
      return "Eat more!!!";
    }
  }
}