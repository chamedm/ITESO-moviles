import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // json ejemplovar
  var _data = [
    {
      "nombre": "Juan Perez",
      "gamer": true,
      "edad": 79,
      "foto":
          "https://richardgarcia.net/wp-content/uploads/2017/01/hombre-exitoso-png.png",
    },
    {
      "nombre": "Chuy",
      "gamer": false,
      "edad": 9,
      "foto":
          "https://1.bp.blogspot.com/-xQjYgbOWBVo/V_mkuxzIJKI/AAAAAAAABOE/WiqjQQV15cAuwbXmtem26vywz4mTKlw8ACLcB/s1600/hombre.png",
    },
    {
      "nombre": "Karen",
      "gamer": false,
      "edad": 14,
      "foto":
          "https://toppng.com/uploads/preview/mujeres-en-png-mujer-feliz-11563001923iicassndn8.png",
    },
    {
      "nombre": "Mohammed",
      "gamer": false,
      "edad": 34,
      "foto":
          "https://1.bp.blogspot.com/-5ydU5haAbEY/V_mkYhkzOVI/AAAAAAAABOs/cVcd0cPB45AanuRdHIYoA7uYD5Wh1IkaACEw/s1600/banner2-man.png",
    },
    {
      "nombre": "Maria",
      "gamer": false,
      "edad": 62,
      "foto":
          "https://www.pngjoy.com/pngm/103/2144636_sad-girl-triste-mujer-png-download.png",
    },
    {
      "nombre": "Joanne",
      "gamer": true,
      "edad": 19,
      "foto":
          "https://acoal-assessors.com/wp-content/uploads/2018/06/mujer_positiva_crecemujer.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My contacts'),
        ),
        body: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int index) {
              // return regresa el widget que queremos que pinte
              return _listItem(_data[index]);
            }));
  }

  Widget _listItem(Map<String, Object> usuario) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage("${usuario["foto"]}"),
        backgroundColor: Colors.grey[400],
      ),
      title: Text("${usuario["nombre"]}"),
      subtitle: Text("${usuario["edad"]}"),
      trailing: IconButton(
        icon: Icon(Icons.games,
            color: usuario["gamer"] ? Colors.indigo : Colors.grey),
        onPressed: () {
          setState(() {
            usuario["gamer"] = !usuario["gamer"];
          });
        },
      ),
    );
  }
}
