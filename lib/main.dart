import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/data/repository/body_repository.dart';
import 'package:flutter_space_data/presentation/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Doctor Glitch',
      ),
      title: 'Solar System Data',
      home: RepositoryProvider(
        create: (context) => BodyRepository(),
        child: const Menu(),
      ),
    );
  }
}
