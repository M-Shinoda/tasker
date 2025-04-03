import 'package:flutter/material.dart';

BottomNavigationBar bottomNavicationBar() {
  return BottomNavigationBar(
    currentIndex: 0,
    type: BottomNavigationBarType.fixed,

    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
        label: 'Calendar',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
    ],
  );
}
