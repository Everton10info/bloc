import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/my_bloc.dart';
import 'bloc/my_event.dart';
import 'bloc/my_state.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => MyBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const PageA(),
        '/pageB': (context) => const PageB(),
      },
      initialRoute: '/',
    );
  }
}

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyBloc, MyState>(
      listener: (context, state) {
        if (state is StateB) {
          Navigator.of(context).pushNamed('/pageB');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Page A'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Go to PageB'),
            onPressed: () {
              context.read<MyBloc>().add(EventB());
            },
          ),
        ),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page B'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pop'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
