import 'package:flutter/material.dart';
import './question.dart';

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

class _FirstAppState extends State<FirstApp>{
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
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Hello World")),
        body: Column(
          children: [
            Question(questions[_questionIndex]), // Question
            RaisedButton(child: const Text('Answer 1'), onPressed: _answerQuestion), // RaisedButton
            RaisedButton(child: const Text('Answer 2'), onPressed: () => print("Answer 2 chosen!")), // RaisedButton
            RaisedButton(child: const Text('Answer 3'), onPressed: () {
              print("Answer 3 chosen!");
            }),
          ],
        ),
      ),
    );
  }
}
