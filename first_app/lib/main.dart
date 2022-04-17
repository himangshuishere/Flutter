import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// void main(){
//   runApp(FirstApp());
// }

// Alternative block of the above code.
void main() => runApp(FirstApp());

class FirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstAppState();
  }
}


class _FirstAppState extends State<FirstApp> {
  var _questionIndex = 0;
  int _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Green', 'score': 10},
        {'text': 'Blue', 'score': 15},
        {'text': 'Red', 'score': 12},
        {'text': 'Yellow', 'score': 5}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Cheetah', 'score': 15},
        {'text': 'Lion', 'score': 20},
        {'text': 'Tiger', 'score': 10},
        {'text': 'Cow', 'score': 5}
      ]
    },
    {
      'questionText': 'What\'s your favorite App?',
      'answers': [
        {'text': 'Google', 'score': 5},
        {'text': 'Instagram', 'score': 10},
        {'text': 'FaceBook', 'score': 15},
        {'text': 'WhatsApp', 'score': 20}
      ]
    },
  ];

  void _answerQuestion(int score) {
    var aBool = true;
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Hello World")),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore),
      ),
    );
  }
}
