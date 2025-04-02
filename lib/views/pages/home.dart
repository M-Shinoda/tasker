import 'package:flutter/material.dart';
import 'package:tasker/views/components/counter_count_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You have pushed the button this many times:'),
          CounterCountText(),
        ],
      ),
    );
  }
}
