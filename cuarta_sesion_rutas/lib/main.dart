import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(body: HomePage()),

      // push named
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => HomePage(),
      //   "/secondPage": (context) => SecondPage(),
      // },
    );
  }
}
