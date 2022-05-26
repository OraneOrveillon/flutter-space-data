import 'package:flutter/material.dart';
import 'package:flutter_space_data/presentation/Menu.dart';

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
      home: const Menu(),
    );
  }
}
