import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/bloc/solar_system_bloc/solar_system_bloc.dart';
import 'package:flutter_space_data/data/repository/solar_system_repository.dart';
import 'package:flutter_space_data/presentation/info.dart';
import 'package:flutter_space_data/presentation/components/cards.dart';
import 'package:flutter_space_data/presentation/components/titles.dart';
import 'package:flutter_space_data/utils/constants.dart';

class SelectionMenuPlanets extends StatelessWidget {
  const SelectionMenuPlanets({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SolarSystemBloc.planets(
        RepositoryProvider.of<SolarSystemRepository>(context),
      )..add(LoadSolarSystemEvent()),
      child: const _SelectionMenuContent(label: "PLANETS"),
    );
  }
}

class SelectionMenuMoons extends StatelessWidget {
  const SelectionMenuMoons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SolarSystemBloc.moons(
        RepositoryProvider.of<SolarSystemRepository>(context),
      )..add(LoadSolarSystemEvent()),
      child: const _SelectionMenuContent(label: "MOONS"),
    );
  }
}

class SelectionMenuSun extends StatelessWidget {
  const SelectionMenuSun({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SolarSystemBloc.sun(
        RepositoryProvider.of<SolarSystemRepository>(context),
      )..add(LoadSolarSystemEvent()),
      child: const _SelectionMenuContent(label: "SUN"),
    );
  }
}

class SelectionMenuDwarfPlanets extends StatelessWidget {
  const SelectionMenuDwarfPlanets({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SolarSystemBloc.dwarfPlanets(
        RepositoryProvider.of<SolarSystemRepository>(context),
      )..add(LoadSolarSystemEvent()),
      child: const _SelectionMenuContent(label: "DWARF PLANETS"),
    );
  }
}

class SelectionMenuAsteroids extends StatelessWidget {
  const SelectionMenuAsteroids({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SolarSystemBloc.asteroids(
        RepositoryProvider.of<SolarSystemRepository>(context),
      )..add(LoadSolarSystemEvent()),
      child: const _SelectionMenuContent(label: "ASTEROIDS"),
    );
  }
}

class SelectionMenuComets extends StatelessWidget {
  const SelectionMenuComets({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SolarSystemBloc.comets(
        RepositoryProvider.of<SolarSystemRepository>(context),
      )..add(LoadSolarSystemEvent()),
      child: const _SelectionMenuContent(label: "COMETS"),
    );
  }
}

class _SelectionMenuContent extends StatelessWidget {
  const _SelectionMenuContent({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkColor,
      body: BlocBuilder<SolarSystemBloc, SolarSystemState>(
        builder: (context, state) {
          /// Loading build
          if (state is SolarSystemLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: MyColors.lightColor,
              ),
            );
          }

          /// Loaded build
          if (state is SolarSystemLoadedState) {
            return Column(
              children: [
                TopTitle(label: label),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.4,
                  width: MediaQuery.of(context).size.width / 1.5,
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
                            builder: (context) => Body(body: state.solarSystem.bodies[index]),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            state.solarSystem.bodies[index].englishName,
                            style: const TextStyle(
                              color: MyColors.lightColor,
                              fontFamily: 'Autobus',
                              fontSize: 40,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          /// Error build
          if (state is SolarSystemErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }

          /// Default
          return Container();
        },
      ),
    );
  }
}
