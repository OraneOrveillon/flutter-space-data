import 'package:flutter/material.dart';
import 'package:flutter_space_data/view/selection_menu.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<String>> textButtons = [
      ['PLANETS', 'MOONS', 'SUN'],
      ['DWARF PLANETS', 'ASTEROIDS', 'COMETS']
    ];
    List<List<String>> iconButtons = [
      ['planet', 'moon', 'sun'],
      ['dwarf-planet', 'asteroid', 'comet']
    ];

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                'Space Data',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Doctor Glitch',
                  fontSize: 80,
                ),
              ),
            ),
            for (var i = 0; i < 2; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var j = 0; j < 3; j++)
                    ButtonItem(
                        iconButtons: iconButtons,
                        i: i,
                        j: j,
                        textButtons: textButtons)
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    Key? key,
    required this.iconButtons,
    required this.i,
    required this.j,
    required this.textButtons,
  }) : super(key: key);

  final List<List<String>> iconButtons;
  final int i;
  final int j;
  final List<List<String>> textButtons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SelectionMenu()),
          );
        },
        child: Container(
          height: 350,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(
                    "assets/images/${iconButtons.elementAt(i).elementAt(j)}.png"),
                color: Colors.white,
                size: 250,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  textButtons.elementAt(i).elementAt(j),
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Doctor Glitch',
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
