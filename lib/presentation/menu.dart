import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/bloc/body_bloc/solar_system_bloc.dart';
import 'package:flutter_space_data/data/repository/solar_system_repository.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SolarSystemBloc(
        RepositoryProvider.of<SolarSystemRepository>(context),
      )..add(LoadSolarSystemEvent()),
      child: Scaffold(
        body: BlocBuilder<SolarSystemBloc, SolarSystemState>(
          builder: (context, state) {
            if (state is SolarSystemLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SolarSystemLoadedState) {
              return Center(
                child: Text(state.solarSystem.bodies[0].name),
              );
            }
            if (state is SolarSystemErrorState) {
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
