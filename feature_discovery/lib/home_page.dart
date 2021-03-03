import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box<int> _box;
  @override
  void initState() {
    _box = Hive.box<int>("la_cuenta");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _box.listenable(),
          //builder lleva: contexto, a que observa(obtener datos), widget a construir
          builder: (context, myBox, _) {
            return Text("${myBox.get("counter", defaultValue: 0)}");
          },
        ),
      ),
      floatingActionButton: Column(children: [
        FloatingActionButton(
          onPressed: () {
            _box.put("counter", _box.get("counter", defaultValue: 0) + 1);
          },
          child: Icon(Icons.add),
          tooltip: "Incrementar contador",
        ),
        SizedBox(height: 16),
        FloatingActionButton(
          onPressed: () {
            _box.put("counter", _box.get("counter", defaultValue: 0) + 1);
          },
          child: Icon(Icons.remove),
          tooltip: "Restar contador",
        )
      ]),
    );
  }
}
