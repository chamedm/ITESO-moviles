import 'package:flutter/material.dart';
import 'package:Act9/front.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word guesser',
      theme: ThemeData(primaryColor: Colors.blue[100]),
      home: Front(),
    );
  }
}
