import 'package:flutter/material.dart';
import 'package:flutter_space_data/utils/constants.dart';
import 'package:flutter_space_data/view/components/title.dart';

class SelectionMenu extends StatelessWidget {
  const SelectionMenu({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkColor,
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Stack(
              children: [
                TitlePage(title: title),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                ),
              ],
            ),
            // ? Code for the scrollable grid
            // Scaffold(
            //   body: new Column(
            //     children: <Widget>[
            //       new Expanded(
            //         child: Padding(
            //           padding: const EdgeInsets.all(50),
            //           child: GridView.count(
            //             // Create a grid with 2 columns. If you change the scrollDirection to
            //             // horizontal, this would produce 2 rows.
            //             crossAxisCount: 3,
            //             // Generate 100 Widgets that display their index in the List
            //             children: List.generate(10, (index) {
            //               return Container(
            //                 padding: const EdgeInsets.all(8),
            //                 child: const Text("He'd have you all unravel at the"),
            //                 color: Colors.teal[100],
            //               );
            //             }),
            //           ),
            //         ),
            //       ),
            //       new Text("text")
            //     ],
            //   ),
          ],
        ),
      ),
    );
  }
}
