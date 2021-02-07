import 'package:flutter/material.dart';
import 'second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Hello world Pantalla 1'),
          FlatButton(
              child: Text('Siguiente'),
              color: Colors.blue[200],
              onPressed: () async {
                // push named
                // Navigator.of(context).pushNamed("/secondPage");
                var result = await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SecondPage(),
                    settings: RouteSettings(arguments: "Hola")));
                print(result);
              }),
        ]),
      ),
    );
  }
}
