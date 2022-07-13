import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/data/model/solar_system_model.dart';

import '../bloc/solar_system_bloc/solar_system_bloc.dart';
import '../utils/constants.dart';
import 'components/cards.dart';
import 'components/errors.dart';
import 'components/progress_indicators.dart';
import 'components/scrollbars.dart';
import 'components/titles.dart';
import 'info/info_page.dart';

class SelectionMenuPage extends StatelessWidget {
  SelectionMenuPage({Key? key, required this.label, required this.event}) : super(key: key) {
    _solarSystemBloc.add(event);
  }

  final String label;
  final SolarSystemEvent event;
  final SolarSystemBloc _solarSystemBloc = SolarSystemBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.dark,
      body: BlocProvider(
        create: (context) => _solarSystemBloc,
        child: BlocBuilder<SolarSystemBloc, SolarSystemState>(
          builder: (context, state) {
            if (state is SolarSystemLoading) {
              return const CustomProgressIndicator();
            }
            if (state is SolarSystemLoaded) {
              ScrollController scrollController = ScrollController();
              return Column(
                children: [
                  TopTitle(label: label),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.4,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: MyScrollbar(
                      scrollController: scrollController,
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 1,
                          mainAxisSpacing: 50,
                          crossAxisSpacing: 50,
                        ),
                        controller: scrollController,
                        itemCount: state.solarSystem.bodies.length,
                        itemBuilder: (context, index) {
                          return SelectionCard(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoPage(
                                  // Enables to remove the number before the english name of asteroids for a better query
                                  bodyEnglishName: state.solarSystem.bodies[index].bodyType == BodyType.asteroid
                                      ? state.solarSystem.bodies[index].englishName.split(' ').last
                                      : state.solarSystem.bodies[index].englishName,
                                  bodyUrl: state.solarSystem.bodies[index].rel!,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                state.solarSystem.bodies[index].englishName,
                                style: MyTextStyles.selectionMenuCard,
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
              return const CustomError();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
