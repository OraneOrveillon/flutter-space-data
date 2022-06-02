import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/data/repository/solar_system_repository.dart';
import 'package:flutter_space_data/presentation/components/cards.dart';
import 'package:flutter_space_data/presentation/selection_menu.dart';
import 'package:flutter_space_data/utils/constants.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  static const List<Map<String, dynamic>> buttons = [
    {"label": "PLANETS", "asset": "planet", "widget": SelectionMenuPlanets()},
    {"label": "MOONS", "asset": "moon", "widget": SelectionMenuMoons()},
    {"label": "SUN", "asset": "sun", "widget": SelectionMenuSun()},
    {"label": "DWARF PLANETS", "asset": "dwarf-planet", "widget": SelectionMenuDwarfPlanets()},
    {"label": "ASTEROIDS", "asset": "asteroid", "widget": SelectionMenuAsteroids()},
    {"label": "COMETS", "asset": "comet", "widget": SelectionMenuComets()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, Paddings.veryLarge, 0, Paddings.veryLarge),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 5,
              child: const FittedBox(
                child: Text(
                  "SPACE DATA",
                  style: TextStyle(color: MyColors.lightColor),
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
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RepositoryProvider(
                        create: (context) => SolarSystemRepository(),
                        child: buttons[index]["widget"]!,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Paddings.small),
                    child: Column(
                      children: [
                        Expanded(
                          child:
                              Image.asset("assets/images/${buttons[index]["asset"]!}.png", color: MyColors.lightColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: Paddings.large),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                            child: FittedBox(
                              child: Text(
                                buttons[index]["label"]!,
                                style: const TextStyle(color: MyColors.lightColor),
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
