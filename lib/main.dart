import 'package:flutter/material.dart';

import 'presentation/menu_page.dart';

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
        fontFamily: 'Autobus',
      ),
      title: 'Solar System Data',
      home: const MenuPage(),
    );
  }
}
