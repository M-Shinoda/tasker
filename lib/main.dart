import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasker/views/components/bottom_navigation_bar.dart';

import 'package:tasker/views/pages/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: const HomePage(), //bottomNavigationBar内でページのステートを変更し、それに応じて内容を変える
        bottomNavigationBar: bottomNavicationBar(),
      ),
    );
  }
}
