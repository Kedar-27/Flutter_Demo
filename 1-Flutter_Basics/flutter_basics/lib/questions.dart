import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.questionText,
        textAlign: TextAlign.center,
        style: TextStyle(fontStyle: FontStyle.normal, fontSize: 28),
      ),
      width: double.infinity,
      margin: EdgeInsets.all(10),
      );
  }
}

