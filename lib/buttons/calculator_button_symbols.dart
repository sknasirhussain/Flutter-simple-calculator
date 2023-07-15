// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

    class calculatorSymbols extends StatelessWidget {

      final String text;
      final Function callBack;

      const calculatorSymbols(this.text, this.callBack);

      @override
      Widget build(BuildContext context) {
        return Container(
          margin: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(10.0),
                backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                )),
              ),
              onPressed: (){
                callBack(text);

              },
              child: Text(text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),),
            ),
          ),
        );
      }
    }
