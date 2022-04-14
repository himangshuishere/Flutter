import 'package:flutter/material.dart';

// void main(){
//   runApp(FirstApp());
// }

// Alternative block of the above code.
void main() => runApp(FirstApp());

class FirstApp extends StatelessWidget {

  var questionIndex = 0;

  void answerQuestion() {
    questionIndex += 1;
    // print('Answer chosen!');
    print(questionIndex);
  }


  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Hello World")),
        body: Column(
          children: [
            Text(questions[questionIndex]), // Text
            RaisedButton(child: Text('Answer 1'), onPressed: answerQuestion), // RaisedButton
            RaisedButton(child: Text('Answer 2'), onPressed: () => print("Answer 2 chosen!")), // RaisedButton
            RaisedButton(child: Text('Answer 3'), onPressed: () {
              print("Answer 3 chosen!");
            }),
          ],
        ),
      ),
    );
  }
}
