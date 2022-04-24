import 'package:flutter/material.dart';

void main() {
  runApp(const MoneyApp());
}

class MoneyApp extends StatefulWidget {
  const MoneyApp({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MoneyAppState();
}

class _MoneyAppState extends State<MoneyApp> {

  int _counter = 0;
  String? _message = 'Hello World';
  
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    if (_counter % 5 == 0 ) {
      setState(() {
        _message = 'You have reached $_counter';
      });
    }
    
    else if (_counter == 21) {
      setState(() {
        _counter = 0;
        _message = 'Oops, everything got reset!';
      });
    }else{
      setState(() {
        _message = 'Hello World';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_message',
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline3,
              ),
              FloatingActionButton(onPressed: _incrementCounter, child: const Icon(Icons.add),tooltip: 'Increment button',)
            ],
          ),
        ),
      ),
    );
  }
}

