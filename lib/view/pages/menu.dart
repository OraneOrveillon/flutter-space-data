import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../components/title.dart';
import 'package:flutter_space_data/view/pages/selection_menu.dart';

/// The application's home
class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Each list contains :
    /// - The text displayed on the button
    /// - The image's name to show as an ImageIcon
    const List<List<String>> buttons = [
      ['PLANETS', 'planet'],
      ['MOONS', 'moon'],
      ['SUN', 'sun'],
      ['DWARF PLANETS', 'dwarf-planet'],
      ['ASTEROIDS', 'asteroid'],
      ['COMETS', 'comet']
    ];

    return Scaffold(
      backgroundColor: MyColors.darkColor,
      body: Column(
        children: [
          const TitlePage(title: 'Space Data'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.3,
                  0,
                  MediaQuery.of(context).size.width * 0.3,
                  50),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                children: List.generate(buttons.length, (index) {
                  return _MenuButton(
                    buttons: buttons,
                    index: index,
                    nextPageTitle: buttons[index][0],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton(
      {Key? key,
      required this.buttons,
      required this.index,
      required this.nextPageTitle})
      : super(key: key);

  final List<List<String>> buttons;
  final int index;
  final String nextPageTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelectionMenu(title: nextPageTitle)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.accentColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: FittedBox(
                  child: ImageIcon(
                    AssetImage("assets/images/${buttons[index][1]}.png"),
                    color: MyColors.lightColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: FittedBox(
                child: Text(
                  buttons[index][0],
                  style: const TextStyle(
                    color: MyColors.textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
