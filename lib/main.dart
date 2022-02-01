// ignore_for_file: deprecated_member_use, avoid_print
//import the packages for flutter
import 'package:flutter/material.dart';
import 'package:test/result.dart';
//import the files needed 
import './answer.dart';
import './quiz.dart';
import './result.dart';

//starting function
void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    //ask the questions
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 8},
        {'text': 'Spider', 'score': 10},
        {'text': 'Lion', 'score': 5}
      ],
    },
    {
      'questionText': 'Who\'s your favourite person?',
      'answers': [
        {'text': 'Nic', 'score': 1},
        {'text': 'Tim', 'score': 10},
        {'text': 'Alex', 'score': 10},
        {'text': 'Noah', 'score': 10}
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
//reset the quiz
  void _resetQuiz() {
    setState(() {
    _questionIndex = 0;
    _totalScore = 0;
    });

  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions~');
    } else {
      print('No more questions');
    }
  }
// build the widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Personality test'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
