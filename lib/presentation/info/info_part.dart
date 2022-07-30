import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/solar_system_bloc/solar_system_bloc.dart';
import '../../bloc/wiki_bloc/wiki_bloc.dart';
import '../../data/model/solar_system_model.dart';
import '../../utils/beautify_info.dart';
import '../../utils/constants.dart';
import '../../utils/translator.dart';
import '../components/animated_texts.dart';
import '../components/errors.dart';
import '../components/progress_indicators.dart';
import '../components/scrollbars.dart';
import '../components/titles.dart';
import 'info_page.dart';
import 'pictures_part.dart';

class InfoPart extends StatelessWidget {
  const InfoPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SolarSystemBloc, SolarSystemState>(
      builder: (context, solarSystemState) {
        if (solarSystemState is SolarSystemLoading) {
          return const CustomProgressIndicator();
        }
        if (solarSystemState is SingleBodyLoaded) {
          List<String> bodyInfo = BeautifyBodyInfo(body: solarSystemState.body).beautifiedBodyInfo;

          return Column(
            children: [
              TopTitle(label: solarSystemState.body.englishName),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(MyPaddings.large, 0, MyPaddings.large, MyPaddings.large),
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.accent,
                      borderRadius: BorderRadius.circular(MyBorderRadius.normal),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(MyPaddings.large),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Information :',
                                    style: MyTextStyles.sectionTitle,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: MyPaddings.large),
                                      child: Builder(builder: (context) {
                                        ScrollController scrollController = ScrollController();
                                        return MyScrollbar(
                                          scrollController: scrollController,
                                          child: BlocBuilder<WikiBloc, WikiState>(
                                            builder: (context, wikiState) {
                                              if (wikiState is WikiLoading) {
                                                return const CustomProgressIndicator();
                                              }
                                              if (wikiState is WikiLoaded) {
                                                return ListView.separated(
                                                  separatorBuilder: (context, index) => const SizedBox(
                                                    height: MyPaddings.small,
                                                  ),
                                                  itemCount: bodyInfo.length + 1,
                                                  controller: scrollController,
                                                  itemBuilder: (context, index) {
                                                    if (index == 0) {
                                                      return TypingText(
                                                          content: ((wikiState.props.first as List<dynamic>).last
                                                                  as List<dynamic>)
                                                              .first);
                                                    } else if (index != bodyInfo.length - 1) {
                                                      return TypingText(content: bodyInfo[index]);
                                                    } else {
                                                      if (solarSystemState.body.moons != null) {
                                                        List<Widget> chipMoons = [];
                                                        for (Moon moon in solarSystemState.body.moons!) {
                                                          chipMoons.add(
                                                            FutureBuilder(
                                                              future: Translator().translate(moon.moon),
                                                              builder: (context, snapshot) {
                                                                if (snapshot.hasData) {
                                                                  return Padding(
                                                                    padding: const EdgeInsets.all(MyPaddings.verySmall),
                                                                    child: ActionChip(
                                                                      labelStyle: MyTextStyles.chip,
                                                                      label: Text(snapshot.data as String),
                                                                      backgroundColor: MyColors.light,
                                                                      onPressed: () => Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) => InfoPage(
                                                                            bodyEnglishName: snapshot.data as String,
                                                                            bodyUrl: moon.rel,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                return const CustomProgressIndicator();
                                                              },
                                                            ),
                                                          );
                                                        }
                                                        return Wrap(
                                                          children: [
                                                            TypingText(content: bodyInfo[index]),
                                                            ...chipMoons,
                                                          ],
                                                        );
                                                      }
                                                      return Container();
                                                    }
                                                  },
                                                );
                                              }
                                              if (wikiState is WikiError) {
                                                const CustomError();
                                              }
                                              return Container();
                                            },
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const PicturesPart(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        if (solarSystemState is SolarSystemError) {
          const CustomError();
        }
        return Container();
      },
    );
  }
}
