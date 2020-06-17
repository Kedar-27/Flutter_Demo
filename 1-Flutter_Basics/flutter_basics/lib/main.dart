import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  var _totalScore = 0;


  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Ked27', 'score': 1},
        {'text': 'Ked27', 'score': 1},
        {'text': 'Ked27', 'score': 1},
        {'text': 'Ked27', 'score': 1},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
           title: Text('Flutter Demo'),
      ),
           body: this._questionIndex < this._questions.length ?
               Quiz(questions:this._questions, questionIndex: this._questionIndex, answerQuestion: this._answerQuestion)
               : Result(this._totalScore, this.resetQuiz)
    ));
  }

  void _answerQuestion(int score) {
    if (this._questionIndex < this._questions.length){

    }else{


    }
    setState(() {
      this._totalScore += score;
      this._questionIndex += 1;
    });
  }

  void resetQuiz(){
    setState(() {
      this._questionIndex = 0;
      this._totalScore = 0;
    });
  }



}

