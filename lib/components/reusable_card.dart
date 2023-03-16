import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({this.colour = const Color(0xFF1D1E33), this.cardChild, required this.onPress});
  final Color colour;
  final Widget? cardChild;
  final Function onPress;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: colour,//
        ),
      ),
    );
  }
}
