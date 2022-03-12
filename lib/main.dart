import 'package:flutter/material.dart';
import 'package:flutter_space_data/view/pages/menu.dart';

// import 'controller/api.dart';
// import 'controller/dto.dart';

Future<void> main() async {
  runApp(const MyApp());
  //DTOManager.jsonToSolarSystem(await APIManager.apiBodies());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //TODO: Ajouter un ThemeData avec les couleurs, polices, etc
      theme: ThemeData(
        fontFamily: 'Doctor Glitch',
        // FIXME
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
        ),
      ),
      title: 'Solar System Data',
      home: const Menu(),
    );
  }
}
