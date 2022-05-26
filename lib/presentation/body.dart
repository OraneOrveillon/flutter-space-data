import 'package:flutter/material.dart';
import 'package:flutter_space_data/data/model/solar_system_model.dart';
import 'package:flutter_space_data/presentation/components/titles.dart';
import 'package:flutter_space_data/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.body}) : super(key: key);

  final BodyModel body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkColor,
      body: Column(
        children: [
          TopTitle(label: body.englishName),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [MyColors.accentColor2, MyColors.accentColor],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    color: MyColors.accentColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
