import 'dart:html';

import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  final int resultScore;
  final Function resultQuiz;


  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  Result(this.resultScore, this.resultQuiz);

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text(resultPhrase,
          style: TextStyle(fontSize: 28 , fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        RaisedButton(child: Text('Reset Quiz'),onPressed: this.resultQuiz,),
      ],
    )
      ,);
  }
}
