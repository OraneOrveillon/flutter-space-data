import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/bloc/body_bloc/body_bloc.dart';
import 'package:flutter_space_data/data/repository/body_repository.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BodyBloc(
        RepositoryProvider.of<BodyRepository>(context),
      )..add(LoadBodyEvent()),
      child: Scaffold(
        body: BlocBuilder<BodyBloc, BodyState>(
          builder: (context, state) {
            if (state is BodyLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is BodyLoadedState) {
              return Center(
                child: Text(state.body.bodies[0].name),
              );
            }
            if (state is BodyErrorState) {
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
