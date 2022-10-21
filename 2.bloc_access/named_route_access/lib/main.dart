// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'counter_page.dart';
import 'home_page.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterBloc,
              child: const HomePage(),
            ),
        '/counter': (context) => BlocProvider.value(
              value: _counterBloc,
              child: const CounterPage(),
            ),
      },
    );
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }
}
