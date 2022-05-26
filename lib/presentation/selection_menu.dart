import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/bloc/body_bloc/solar_system_bloc.dart';
import 'package:flutter_space_data/data/repository/solar_system_repository.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Paddings.veryLarge),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: double.infinity,
                          child: FittedBox(
                            child: BackButton(
                              color: MyColors.lightColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              label,
                              style: const TextStyle(color: MyColors.lightColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.solarSystem.bodies.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          state.solarSystem.bodies[index].name,
                          style: const TextStyle(color: MyColors.lightColor),
                        ),
                        subtitle: Text(
                          state.solarSystem.bodies[index].bodyType.name,
                          style: const TextStyle(color: MyColors.lightColor),
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
