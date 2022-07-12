import 'package:flutter/material.dart';

import '../bloc/solar_system_bloc/solar_system_bloc.dart';
import '../utils/constants.dart';
import 'components/cards.dart';
import 'info.dart';
import 'selection_menu.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  static List<Map<String, dynamic>> buttons = [
    {'label': 'PLANETS', 'asset': 'planet', 'event': LoadPlanets()},
    {'label': 'MOONS', 'asset': 'moon', 'event': LoadMoons()},
    {'label': 'SUN', 'asset': 'sun'},
    {'label': 'DWARF PLANETS', 'asset': 'dwarf-planet', 'event': LoadDwarfPlanets()},
    {'label': 'ASTEROIDS', 'asset': 'asteroid', 'event': LoadAsteroids()},
    {'label': 'COMETS', 'asset': 'comet', 'event': LoadComets()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.dark,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(MyPaddings.veryLarge),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 5,
              child: const FittedBox(
                child: Text(
                  'SOLAR SYSTEM DATA',
                  style: MyTextStyles.title,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 2,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: 50,
                crossAxisSpacing: 50,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: buttons.length,
              itemBuilder: (BuildContext context, int index) {
                return SelectionCard(
                  onTap: () {
                    // Loads directly the Info page for the Sun
                    if (buttons[index]['label'] == 'SUN') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Info(
                            bodyEnglishName: buttons[index]['label'],
                            bodyUrl: 'https://api.le-systeme-solaire.net/rest/bodies/sun',
                          ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectionMenu(
                            label: buttons[index]['label'],
                            event: buttons[index]['event'],
                          ),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(MyPaddings.small),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset("assets/images/${buttons[index]['asset']!}.png", color: MyColors.light),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: MyPaddings.large),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                            child: FittedBox(
                              child: Text(
                                buttons[index]['label']!,
                                style: MyTextStyles.title,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
