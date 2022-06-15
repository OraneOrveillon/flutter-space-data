import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/bloc/solar_system_bloc/solar_system_bloc.dart';
import 'package:flutter_space_data/presentation/components/scrollbars.dart';
import 'package:flutter_space_data/presentation/info.dart';
import 'package:flutter_space_data/presentation/components/cards.dart';
import 'package:flutter_space_data/presentation/components/titles.dart';
import 'package:flutter_space_data/utils/constants.dart';

class SelectionMenu extends StatelessWidget {
  SelectionMenu({Key? key, required this.label, required this.event}) : super(key: key) {
    _solarSystemBloc.add(event);
  }

  final String label;
  final SolarSystemEvent event;
  final SolarSystemBloc _solarSystemBloc = SolarSystemBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkColor,
      body: BlocProvider(
        create: (context) => _solarSystemBloc,
        child: BlocBuilder<SolarSystemBloc, SolarSystemState>(
          builder: (context, state) {
            if (state is SolarSystemLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: MyColors.lightColor,
                ),
              );
            }
            if (state is SolarSystemLoaded) {
              return Column(
                children: [
                  TopTitle(label: label),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.4,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: MyScrollbar(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 1,
                          mainAxisSpacing: 50,
                          crossAxisSpacing: 50,
                        ),
                        itemCount: state.solarSystem.bodies.length,
                        itemBuilder: (context, index) {
                          return SelectionCard(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Info(body: state.solarSystem.bodies[index]),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                state.solarSystem.bodies[index].englishName,
                                style: const TextStyle(
                                  color: MyColors.lightColor,
                                  fontSize: 40,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
            if (state is SolarSystemError) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
