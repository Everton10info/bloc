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
      home: BlocBuilder<MyBloc, MyState>(
        builder: (_, state) => state is StateA ? const PageA() : const PageB(),
      ),
    );
  }
}

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: const Text('Go to PageA'),
          onPressed: () {
            context.read<MyBloc>().add(EventA());
          },
        ),
      ),
    );
  }
}
