import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../bloc/pictures_bloc/pictures_bloc.dart';
import '../bloc/solar_system_bloc/solar_system_bloc.dart';
import '../data/model/solar_system_model.dart';
import '../utils/beautify_body_info.dart';
import '../utils/constants.dart';
import '../utils/translator.dart';
import 'components/animated_texts.dart';
import 'components/errors.dart';
import 'components/progress_indicators.dart';
import 'components/scrollbars.dart';
import 'components/titles.dart';

class Info extends StatelessWidget {
  Info({Key? key, required String bodyEnglishName, required String bodyUrl}) : super(key: key) {
    _singleBodyBloc = SolarSystemBloc(bodyUrl: bodyUrl)..add(LoadSingleBody());
    _picturesBloc = PicturesBloc(bodyName: bodyEnglishName)..add(LoadPictures());
  }

  late final SolarSystemBloc _singleBodyBloc;
  late final PicturesBloc _picturesBloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _singleBodyBloc),
        BlocProvider(create: (context) => _picturesBloc),
      ],
      child: Scaffold(
        backgroundColor: MyColors.darkColor,
        body: BlocBuilder<SolarSystemBloc, SolarSystemState>(
          builder: (context, state) {
            if (state is SolarSystemLoading) {
              return const CustomProgressIndicator();
            }
            if (state is SingleBodyLoaded) {
              List<String> bodyInfo = BeautifyBodyInfo(body: state.body).beautifiedBodyInfo;

              return Column(
                children: [
                  TopTitle(label: state.body.englishName),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(Paddings.large, 0, Paddings.large, Paddings.large),
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.accentColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 3,
                              child: SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(Paddings.large),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Information :',
                                        style: TextStyle(color: MyColors.lightColor, fontSize: 50),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: Paddings.large),
                                          child: ListView.separated(
                                            separatorBuilder: (context, index) => const SizedBox(
                                              height: Paddings.small,
                                            ),
                                            itemCount: bodyInfo.length,
                                            controller: ScrollController(),
                                            itemBuilder: (context, index) {
                                              if (index != bodyInfo.length - 1) {
                                                return TypingText(content: bodyInfo[index]);
                                              } else {
                                                if (state.body.moons != null) {
                                                  List<Widget> chipMoons = [];
                                                  for (Moon moon in state.body.moons!) {
                                                    chipMoons.add(
                                                      FutureBuilder(
                                                        future: Translator().translate(moon.moon),
                                                        builder: (context, snapshot) {
                                                          if (snapshot.hasData) {
                                                            return Padding(
                                                              padding: const EdgeInsets.all(Paddings.verySmall),
                                                              child: ActionChip(
                                                                labelStyle: const TextStyle(
                                                                  fontSize: 20,
                                                                  color: MyColors.darkColor,
                                                                ),
                                                                label: Text(snapshot.data as String),
                                                                backgroundColor: MyColors.lightColor,
                                                                onPressed: () => Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => Info(
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
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, Paddings.large, Paddings.large),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0, Paddings.large, 0, Paddings.large),
                                      child: Text(
                                        'Pictures :',
                                        style: TextStyle(color: MyColors.lightColor, fontSize: 50),
                                      ),
                                    ),
                                    Expanded(
                                      child: BlocBuilder<PicturesBloc, PicturesState>(
                                        builder: (context, state) {
                                          if (state is PicturesLoading) {
                                            return const CustomProgressIndicator();
                                          }
                                          if (state is PicturesLoaded) {
                                            if (state.pictures.collection!.items!.isNotEmpty) {
                                              return MyScrollbar(
                                                child: GridView.builder(
                                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 5,
                                                    childAspectRatio: 1,
                                                    mainAxisSpacing: Paddings.small,
                                                    crossAxisSpacing: Paddings.small,
                                                  ),
                                                  itemCount: state.pictures.collection!.items!.length,
                                                  itemBuilder: (context, index) {
                                                    return InkWell(
                                                      onTap: () => Alert(
                                                        context: context,
                                                        closeIcon: const Icon(
                                                          Icons.close,
                                                          color: MyColors.lightColor,
                                                        ),
                                                        buttons: [],
                                                        content: SizedBox(
                                                          height: MediaQuery.of(context).size.height * 0.8,
                                                          width: MediaQuery.of(context).size.width * 0.8,
                                                          child: Image.network(
                                                            state.pictures.collection!.items![index].links!.first.href!,
                                                          ),
                                                        ),
                                                        style: AlertStyle(
                                                          animationType: AnimationType.grow,
                                                          backgroundColor: MyColors.darkColor,
                                                          animationDuration: const Duration(milliseconds: 400),
                                                          alertBorder: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(20),
                                                            side: const BorderSide(
                                                              color: MyColors.lightColor,
                                                            ),
                                                          ),
                                                          alertAlignment: Alignment.center,
                                                        ),
                                                      ).show(),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(20),
                                                        child: Image.network(
                                                          state.pictures.collection!.items![index].links!.first.href!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            }
                                            return const Center(
                                              child: Text(
                                                'No pictures found for this body',
                                                style: TextStyle(
                                                  color: MyColors.lightColor,
                                                  fontSize: 30,
                                                ),
                                              ),
                                            );
                                          }
                                          if (state is PicturesError) {
                                            return const CustomError();
                                          }
                                          return Container();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            if (state is SolarSystemError) {
              return Center(
                child: Text(
                  state.error.toString(),
                  style: const TextStyle(color: MyColors.lightColor),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
