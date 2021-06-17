import 'package:flutter/material.dart';

import 'package:star_app/services/http.dart' as http;

class Homepage extends StatefulWidget {
  Homepage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _counter = 0;

  void _incrementCounter() => setState(() => _counter++);
  void _decrementCounter() => setState(() => _counter--);

  void pull() async {
    _incrementCounter();
    print(await http.getPerson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            IconButton(
              tooltip: 'decrement',
              onPressed: _decrementCounter,
              icon: Icon(Icons.unsubscribe)
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pull,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}