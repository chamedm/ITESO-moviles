// ************************
// ************************
// EJERCICIO EN CLASE
// ************************
// ************************

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Material App Bar'),
//         ),
//         body: Container(
//           color: Color(0xff464a47),
//           child: Row(
//             // utilizando propiedad de la Row != Expanded
//             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.thumb_up, color: Colors.grey),
//                     SizedBox(height: 5),
//                     Text(
//                       "Like",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     SizedBox(height: 5),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.thumb_down, color: Colors.grey),
//                     Text(
//                       "Dislike",
//                       style: TextStyle(color: Colors.grey),
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.share, color: Colors.grey),
//                     Text(
//                       "Share",
//                       style: TextStyle(color: Colors.grey),
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.download_rounded, color: Colors.grey),
//                     Text(
//                       "Download",
//                       style: TextStyle(color: Colors.grey),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

// ************************
// ************************
// TAREA 2
// ************************
// ************************

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITESO App',
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
  int likeCounter = 0;
  bool isLikePressed = false;
  bool isDislikePressed = false;
  String isEven(number) {
    return likeCounter % 2 == 0 ? "par" : "impar";
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showSnackBar(String message) {
    try {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(message),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'X',
            onPressed: () {},
          )));
    } on Exception catch (e, s) {
      print(s);
    }
  }

  void _showEvenDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Likes, ¿Par o impar?"),
              content: Text('Likes son ${isEven(likeCounter)}'),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('ITESO App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network("https://pbs.twimg.com/media/DburBCaVQAAM_2g.jpg"),
            Row(
              children: [
                // textos
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ITESO, Universidad Jesuita de Guadalajara",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("San Pedro Tlaquepaque"),
                    ],
                  ),
                ),
                Expanded(
                    child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: Icon(Icons.thumb_down,
                            color: isLikePressed ? Colors.red : Colors.grey),
                        onPressed: () {
                          likeCounter = likeCounter > 0 ? likeCounter - 1 : 0;
                          isLikePressed = !isLikePressed;
                          setState(() {});
                        }),
                    Text(likeCounter.toString()),
                    IconButton(
                        icon: Icon(Icons.thumb_up,
                            color:
                                isDislikePressed ? Colors.blue : Colors.grey),
                        onPressed: () {
                          likeCounter = likeCounter + 1;
                          isDislikePressed = !isDislikePressed;
                          setState(() {});
                        })
                  ],
                ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // botones
                  Column(children: [
                    IconButton(
                      icon: Icon(Icons.mail, size: 30),
                      onPressed: () =>
                          {_showSnackBar("Enviando correo info@iteso.mx")},
                    ),
                    Text("Correo")
                  ]),
                  Column(children: [
                    IconButton(
                      icon: Icon(Icons.call, size: 30),
                      onPressed: () => {_showSnackBar("Llamando 33166225")},
                    ),
                    Text("Llamar")
                  ]),
                  Column(children: [
                    IconButton(
                      icon: Icon(Icons.directions, size: 30),
                      onPressed: () => {
                        _showSnackBar("Av. Periferico Manuel Gomez Morin 8585")
                      },
                    ),
                    Text("Direcciones")
                  ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                  "ITESO, Universidad Jesuita de Guadalajara — distinct from the state University of Guadalajara — also known as Instituto Tecnológico y de Estudios Superiores de Occidente, ITESO, is a Jesuit university in the Western Mexican state of Jalisco, located in the municipality of Tlaquepaque in the Guadalajara Metropolitan Area."),
            ),
            Column(children: [
              IconButton(
                icon: Icon(Icons.question_answer, size: 30),
                onPressed: () => {_showEvenDialog(context)},
                color: Colors.yellow[900],
              ),
              Text("Likes, ¿par o impar?")
            ])
          ],
        ),
      ),
    );
  }
}
