import 'package:flutter/material.dart';
import 'package:flutter_space_data/data/model/solar_system_model.dart';
import 'package:flutter_space_data/presentation/components/animated_texts.dart';
import 'package:flutter_space_data/presentation/components/titles.dart';
import 'package:flutter_space_data/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.body}) : super(key: key);

  final BodyModel body;

  @override
  Widget build(BuildContext context) {
    // TODO : Adapter si les données sont vides ou non
    final List<TypingText> information = [
      TypingText(content: 'Discovered by : ${body.discoveredBy}'),
      TypingText(content: 'Discovery date : ${body.discoveryDate}'),
      TypingText(content: 'Average temperature : ${(body.avgTemp - 273.15).toStringAsFixed(2)}°C'),
      TypingText(content: 'Dimensions : ${body.dimension} km'),
      TypingText(content: 'Radius : ${body.equaRadius.round()} km'),
      TypingText(content: 'Moons : ${body.moons}'),
      TypingText(content: 'Semi major axis : ${body.semimajorAxis} km'),
      TypingText(content: 'Perihelion : ${body.perihelion} km'),
      TypingText(content: 'Aphelion : ${body.aphelion} km'),
      TypingText(content: 'Eccentricity : ${body.eccentricity}'),
      TypingText(content: 'Inclination : ${body.inclination}°'),
      TypingText(content: 'Mass : ${body.mass?.massValue}x10^${body.mass?.massExponent} kg'),
      TypingText(content: 'Volume : ${body.vol?.volValue}x10^${body.vol?.volExponent} km^3'),
      TypingText(content: 'Density : ${body.density} g.cm^3'),
      TypingText(content: 'Gravity : ${body.gravity} m.s^-2'),
      TypingText(content: 'Escape : ${body.escape} m.s^-1'),
      TypingText(content: 'Sidereal orbit : ${body.sideralOrbit} earth days'),
      TypingText(content: 'Sidereal rotation : ${body.sideralRotation} hours'),
      // TODO Mettre le nom en anglais
      TypingText(content: 'Around planet : ${body.aroundPlanet?.planet}'),
      TypingText(content: 'Axial tilt : ${body.axialTilt}'),
      TypingText(content: 'Main anomaly : ${body.mainAnomaly}°'),
      TypingText(content: 'Argument of perihelion : ${body.argPeriapsis}°'),
      TypingText(content: 'Longitude of ascending node : ${body.longAscNode}°'),
    ];

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
                  child: Padding(
                    padding: const EdgeInsets.all(Paddings.large),
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.accentColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.separated(
                          padding: const EdgeInsets.all(Paddings.large),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: Paddings.small,
                          ),
                          itemCount: information.length,
                          itemBuilder: (context, index) {
                            return information[index];
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    color: MyColors.darkColor,
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
