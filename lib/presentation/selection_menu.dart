import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/bloc/body_bloc/solar_system_bloc.dart';
import 'package:flutter_space_data/data/repository/solar_system_repository.dart';
// import 'package:desktop_window/desktop_window.dart';

class SelectionMenu extends StatelessWidget {
  const SelectionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SolarSystemBloc(
        RepositoryProvider.of<SolarSystemRepository>(context),
      )..add(LoadSolarSystemEvent()),
      child: Scaffold(
        body: BlocBuilder<SolarSystemBloc, SolarSystemState>(
          builder: (context, state) {
            /// Loading build
            if (state is SolarSystemLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            /// Loaded build
            if (state is SolarSystemLoadedState) {
              return Column(
                children: [
                  const BackButton(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.solarSystem.bodies.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.solarSystem.bodies[index].name),
                          subtitle: Text(state.solarSystem.bodies[index].bodyType.name),
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
      ),
    );
  }
}
