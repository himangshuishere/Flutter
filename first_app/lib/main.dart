import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    // print('Answer chosen!');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Green', 'Blue', 'Red', 'Yellow']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Cheetah', 'Lion', 'Tiger', 'Cow']
      },
      {
        'questionText': 'What\'s your favorite App?',
        'answers': ['Google', 'Instagram', 'Facebook', 'WhatsApp']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Hello World")),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText'] as String), // Question
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer){
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
