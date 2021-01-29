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

class SeparateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text("Button moved to separate widget"),
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Button moved to separate widget'),
            duration: Duration(seconds: 3),
          ));
        });
  }
}

class _HomePageState extends State<HomePage> {
  int likeCounter = 0;
  bool isLikePressed = false;
  bool isDislikePressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ITESO App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // children: [Image.asset("assets/Religion.jpg")],
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
                      onPressed: () => {},
                    ),
                    Text("Correo")
                  ]),
                  Column(children: [
                    IconButton(
                      icon: Icon(Icons.call, size: 30),
                      onPressed: () => {},
                    ),
                    Text("Llamar")
                  ]),
                  Column(children: [
                    IconButton(
                      icon: Icon(Icons.directions, size: 30),
                      onPressed: () => {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Holi"),
                            duration: Duration(seconds: 3)))
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
            )
          ],
        ),
      ),
    );
  }
}
