// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:calculator/buttons/calculator_dart_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:calculator/buttons/calculator_button_symbols.dart';


void main() {
  runApp(MaterialApp(
    home: calculator(),
  ));
}

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  int firstNum = 0;
  int secondNum = 0;
  String history = '';
  String textToDisplay = '';
  String res = '';
  String operation = '';

  void buttonOnClick(String buttonValue) {
    print(buttonValue);
    if (buttonValue == "C") {
      textToDisplay = '';
      res = '';
      firstNum = 0;
      secondNum = 0;
    } else if (buttonValue == "AC") {
      textToDisplay = '';
      res = '';
      firstNum = 0;
      secondNum = 0;
      history = '';
    } else if(buttonValue == "+/-") {
      if(textToDisplay[0] != '-'){
        res = '-' + textToDisplay;
      }else{
        res = textToDisplay.substring(1);
      }
    }else if(buttonValue == "DL"){
      res = textToDisplay.substring(0, textToDisplay.length-1);
    }

    else if (buttonValue == "+" || buttonValue == "-" || buttonValue == "X" || buttonValue == "/") {
      firstNum = int.parse(textToDisplay);
      operation = buttonValue;
      res = '';
    }else if(buttonValue == "="){
      secondNum = int.parse(textToDisplay);
      if(operation == "+"){
        res = (firstNum + secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }if(operation == "-"){
        res = (firstNum - secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }if(operation == "X"){
        res = (firstNum * secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }if(operation == "/"){
        res = (firstNum / secondNum).toString();
        history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
    }else{
      res = int.parse(textToDisplay + buttonValue).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent[700],
          title: Text("Calculator App",
          style: TextStyle(
                        fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.black,
          ),),
          centerTitle: true,
        ),
        backgroundColor: Colors.cyan[200],
        body: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Text(history,
                    style: TextStyle(
                        fontSize:24,
                        color: Colors.grey
                    ),
                  ),
                ),
                alignment: Alignment(1.0,1.0),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(textToDisplay,
                  style: TextStyle(
                    fontSize:48,
                    color: Colors.black,
                  ),
                  ),
                ),
                alignment: Alignment(1.0,1.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calculatorSymbols("AC", buttonOnClick),
                  calculatorSymbols("C", buttonOnClick),
                  calculatorSymbols("DL", buttonOnClick),
                  calculatorSymbols("/", buttonOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calculator_buttons("9", buttonOnClick),
                  Calculator_buttons("8", buttonOnClick),
                  Calculator_buttons("7", buttonOnClick),
                  calculatorSymbols("X", buttonOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calculator_buttons("6", buttonOnClick),
                  Calculator_buttons("5", buttonOnClick),
                  Calculator_buttons("4", buttonOnClick),
                  calculatorSymbols("-", buttonOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Calculator_buttons("3", buttonOnClick),
                  Calculator_buttons("2", buttonOnClick),
                  Calculator_buttons("1", buttonOnClick),
                  calculatorSymbols("+", buttonOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calculatorSymbols("+/-", buttonOnClick),
                  Calculator_buttons("0", buttonOnClick),
                  Calculator_buttons("00", buttonOnClick),
                  calculatorSymbols("=", buttonOnClick),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}

