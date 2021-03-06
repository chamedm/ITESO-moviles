import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/front_bloc.dart';

class Front extends StatefulWidget {
  Front({Key key}) : super(key: key);

  @override
  _FrontState createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => FrontBloc(),
        child: BlocConsumer<FrontBloc, FrontState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is JuegoIniciadoState) {
              return ListView(children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: (Container(
                          height: 150,
                          child: Column(children: [
                            Text(state.titulo),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              state.palabra,
                              style: TextStyle(fontSize: 30),
                            )
                          ]))),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                        ),
                        child: Text("Puntos " + state.contador.toString())),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                          child: Text("Wrong"),
                          color: Colors.red[200],
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context)
                                .add(SkipEvent());
                          }),
                      MaterialButton(
                          child: Text("Got it"),
                          color: Colors.green[200],
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context).add(GotEvent());
                          }),
                      MaterialButton(
                          child: Text("Me doy"),
                          color: Colors.grey[200],
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context).add(EndEvent());
                          }),
                    ],
                  ),
                )
              ]);
            } else if (state is JuegoEndState) {
              return ListView(children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: (Container(
                          height: 150,
                          child: Column(children: [
                            Text(state.titulo),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              state.contador.toString(),
                              style: TextStyle(fontSize: 30),
                            )
                          ]))),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                        ),
                        child: Text("Puntos " + state.contador.toString())),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                          child: Text("Play Again"),
                          color: Colors.blueGrey[200],
                          onPressed: () {
                            BlocProvider.of<FrontBloc>(context)
                                .add(StartEvent());
                          }),
                    ],
                  ),
                )
              ]);
            } else
              return ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: (Container(
                            height: 150,
                            child: Column(children: [
                              Text("Guess the word!"),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Get ready",
                                style: TextStyle(fontSize: 30),
                              )
                            ]))),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                            child: Text("Start game"),
                            color: Colors.blueGrey[200],
                            onPressed: () {
                              BlocProvider.of<FrontBloc>(context)
                                  .add(StartEvent());
                            }),
                      ],
                    ),
                  )
                ],
              );
          },
        ),
      ),
    );
  }
}
