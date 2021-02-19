import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleBLOC/bloc/counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CounterBloc _counterBloc;

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: BlocProvider(
            create: (context) {
              _counterBloc = CounterBloc();
              return _counterBloc;
            },
            child: Center(child: widgetContador(0)),
          ),
        ));
  }

  Widget widgetContador(int counter) {
    return Container(
      width: 264,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // usar inyeccion de dependencias para acceder al bloc
                _counterBloc.add(ModifyCounter(isIncrement: true));
              }),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              if (state is NewCounterState) {
                return Text("${state.currentCount ?? "0"}");
              }
              return Text("--");
            },
          ),
          IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                _counterBloc.add(ModifyCounter(isIncrement: false));
              })
        ],
      ),
    );
  }
}
