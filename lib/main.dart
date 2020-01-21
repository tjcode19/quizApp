import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

final _questions = const [
  {
    'questionText': 'What\'s your favourite colour?',
    'answer': [
      {'text': 'Blue', 'score': 1},
      {'text': 'White', 'score': 2},
      {'text': 'Gray', 'score': 6},
      {'text': 'Green', 'score': 4}
    ]
  },
  {
    'questionText': 'What\'s your favourite animal?',
    'answer': [
      {'text': 'Dog', 'score': 2},
      {'text': 'Rabbit', 'score': 4},
      {'text': 'Cat', 'score': 3},
      {'text': 'Snake', 'score': 10}
    ]
  },
  {
    'questionText': 'Who\'s your best friend?',
    'answer': [
      {'text': 'Coded', 'score': 1},
      {'text': 'King', 'score': 4},
      {'text': 'David', 'score': 3},
      {'text': 'Enitan', 'score': 2}
    ]
  },
];

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print('Answer Choosen');
  }

  void _restrateQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome Coded'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _restrateQuiz),
      ),
    );
  }
}
