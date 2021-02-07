import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // recuperar argumentos en la ruta

  @override
  Widget build(BuildContext context) {
    var parametroPag1 = ModalRoute.of(context).settings.arguments;
    print(parametroPag1);
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            child: Text('SecondPage'),
          ),
          MaterialButton(
            child: Text("Back"),
            color: Colors.red[200],
            onPressed: () {
              Navigator.of(context).pop("Holi de vuelta");
            },
          )
        ]),
      ),
    );
  }
}
