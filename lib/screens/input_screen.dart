import 'package:flutter/material.dart';
import 'package:bmi_app/utils/constants.dart';
import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/calculator_brain.dart';
import 'package:bmi_app/screens/results_screen.dart';


class InputScreen extends StatefulWidget {
  InputScreen();

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  int weight=50;

  int age = 10;

  int height = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        backgroundColor: Colors.black,
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(child:
         Row(
          children: [
            ReusableCard(cardChild: IconContent(icon: Icons.male, label: "MALE"),),
            ReusableCard(cardChild: IconContent(icon: Icons.female, label: "FEMALE"),),
          ],
        )
        ),
        ReusableCard(cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("HEIGHT", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(height.toString(), style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                Text("cm", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)
              ]
            ),
            Slider(value: height.toDouble(), min: 50, max:200, onChanged: (value){
              setState((){
                height = value.toInt();
              });

            })
          ]
        ),),
       Expanded(child:
         Row(
          children: [
            ReusableCard(cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("AGE", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                Text(age.toString(),style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          age--;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Icon(Icons.remove, size:50),
                      ),
                    ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      age++;
                    });
                  },
                  child:Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Icon(Icons.add, size:50),
                    )
              )
                  ]
                ),
                ),
              ]
            ),),
            ReusableCard(cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("WEIGHT", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                  Text(weight.toString(),style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                weight--;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Icon(Icons.remove, size:50),
                            ),
                          ),
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              child:Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Icon(Icons.add, size:50),
                              )
                          )
                        ]
                    ),
                  ),
                ]
            ),),
        ],
        )
        ),
        BottomButton(title:"CALCULATE",onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            CalculatorBrain bb = CalculatorBrain(height: height, weight: weight);
            return ResultsPage(bmiBrain: bb);
          }));
        })

      ],
      )
    );
  }
}

class IconContent extends StatelessWidget {
  final IconData  icon;
  final String label;

  IconContent({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size:80, color:Colors.white),
        SizedBox(height:10,),
        Text(label, style: TextStyle(color:Colors.white, fontSize: 20, fontWeight: FontWeight.bold), ),
      ]
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Widget cardChild;
  ReusableCard({required this.cardChild});


  @override
  Widget build(BuildContext context) {
    return Expanded(child:
     Container(
         margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: kinactiveCardColour,
              borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
       child: cardChild,
        ),
    );
  }
}