// ignore_for_file: avoid_unnecessary_containers

import 'package:calculator_app/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];

  var userQuestion = '';
  var userAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, int index) {
                    //clear button
                    if (index == 0) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestion = '';
                          });
                        },
                        textColor: Colors.white,
                        color: Colors.green,
                        buttonText: buttons[index],
                      );
                    }
                    //delete button
                    else if (index == 1) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          });
                        },
                        textColor: Colors.white,
                        color: Colors.red,
                        buttonText: buttons[index],
                      );
                    }
                    // equal button
                    else if (index == buttons.length - 1) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            equalPress();
                          });
                        },
                        textColor: Colors.white,
                        color: Colors.deepPurple,
                        buttonText: buttons[index],
                      );
                    }
                    //others button
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      color: isOperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.deepPurple[50],
                      buttonText: buttons[index],
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'X' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPress() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
