import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;


  Quiz({ @required this.questions, @required this.questionIndex , @required this.answerQuestion});


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Question(questions[this.questionIndex]['questionText']),
        ...(this.questions[this.questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) => Answer(() => this.answerQuestion(answer['score']), answer['text']))
            .toList(),
      ],
    );
  }
}
