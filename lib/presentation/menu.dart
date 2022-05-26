import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/data/repository/solar_system_repository.dart';
import 'package:flutter_space_data/presentation/selection_menu.dart';
import 'package:flutter_space_data/utils/constants.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkColor,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 5,
            child: const FittedBox(
              child: Text(
                "SPACE DATA",
                style: TextStyle(color: MyColors.lightColor),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RepositoryProvider(
                    create: (context) => SolarSystemRepository(),
                    child: const SelectionMenu(),
                  ),
                ),
              );
            },
            child: const Text('cc'),
          ),
        ],
      ),
    );
  }
}
