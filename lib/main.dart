import 'package:complete_guide/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import 'result.dart';

// void main(){
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  var _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _totalScore += score;
    });
    print('Answer Chosen');
  }

  @override
  Widget build(BuildContext context) {
    final _questions = const [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'black', 'score': 4},
          {'text': 'red', 'score': 3},
          {'text': 'green', 'score': 5},
          {'text': 'blue', 'score': 10}
        ]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Dog', 'score': 10},
          {'text': 'Cat', 'score': 0},
          {'text': 'Turtle', 'score': 7},
          {'text': 'Monkey', 'score': 9}
        ]
      },
      {
        'questionText': 'What\'s your favorite Country?',
        'answers': [
          {'text': 'USA', 'score': 2},
          {'text': 'India', 'score': 10},
          {'text': 'Texas', 'score': 5},
          {'text': 'Italy', 'score': 3}
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
        appBar: AppBar(
          title: Text(
            'Answer My Questions Dawg'),
          ),
        ),
      );
  }
}
