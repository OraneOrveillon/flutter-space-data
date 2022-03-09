import 'package:flutter/material.dart';
import 'package:flutter_space_data/view/menu.dart';
import 'package:flutter_space_data/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //TODO: Ajouter un ThemeData avec les couleurs, polices, etc
      title: 'Solar System Data',
      home: Menu(),
    );
  }
}
