// ignore_for_file: avoid_unnecessary_containers

import 'package:calculator_app/my_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, int index) {
                    if (index == 0) {
                      return MyButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        buttonText: buttons[index],
                      );
                    } else if (index == 1) {
                      return MyButton(
                        textColor: Colors.white,
                        color: Colors.red,
                        buttonText: buttons[index],
                      );
                    }
                    return MyButton(
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
}
