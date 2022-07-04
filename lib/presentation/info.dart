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
    _singleBodyBloc = SolarSystemBloc()..add(LoadSingleBody(bodyUrl: bodyUrl));
    _picturesBloc = PicturesBloc()..add(LoadPictures(bodyName: bodyEnglishName));
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
        backgroundColor: MyColors.dark,
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
                                              child: ListView.separated(
                                                separatorBuilder: (context, index) => const SizedBox(
                                                  height: MyPaddings.small,
                                                ),
                                                itemCount: bodyInfo.length,
                                                controller: scrollController,
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
                                                                  padding: const EdgeInsets.all(MyPaddings.verySmall),
                                                                  child: ActionChip(
                                                                    labelStyle: MyTextStyles.chip,
                                                                    label: Text(snapshot.data as String),
                                                                    backgroundColor: MyColors.light,
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
                                            );
                                          }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, MyPaddings.large, MyPaddings.large),
                                child: BlocBuilder<PicturesBloc, PicturesState>(
                                  builder: (context, state) {
                                    if (state is PicturesLoading) {
                                      return const CustomProgressIndicator();
                                    }
                                    if (state is PicturesLoaded) {
                                      ScrollController scrollController = ScrollController();
                                      if (state.pictures.collection!.items!.isNotEmpty) {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(0, MyPaddings.large, 0, MyPaddings.large),
                                              child: Row(
                                                children: [
                                                  const Expanded(
                                                    child: Text(
                                                      'Pictures :',
                                                      style: MyTextStyles.sectionTitle,
                                                    ),
                                                  ),
                                                  _buildIconButton(
                                                      state: state,
                                                      context: context,
                                                      icon: Icons.arrow_back,
                                                      onPressed: () {}),
                                                  // TODO N°page
                                                  const SizedBox(
                                                    width: MyPaddings.small,
                                                  ),
                                                  _buildIconButton(
                                                    state: state,
                                                    context: context,
                                                    icon: Icons.arrow_forward,
                                                    onPressed: () {
                                                      if (state.pictures.collection!.links!.first.rel == 'next') {
                                                        // TODO : Marche pour le premier seulement
                                                        context.read<PicturesBloc>().add(
                                                              LoadPicturesWithPage(
                                                                url: state.pictures.collection!.links!.first.href!,
                                                              ),
                                                            );
                                                      }
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    width: MyPaddings.small,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: MyScrollbar(
                                                scrollController: scrollController,
                                                child: GridView.builder(
                                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 5,
                                                    childAspectRatio: 1,
                                                    mainAxisSpacing: MyPaddings.small,
                                                    crossAxisSpacing: MyPaddings.small,
                                                  ),
                                                  controller: scrollController,
                                                  itemCount: state.pictures.collection!.items!.length,
                                                  itemBuilder: (context, index) {
                                                    return InkWell(
                                                      onTap: () => Alert(
                                                        context: context,
                                                        closeIcon: const Icon(
                                                          Icons.close,
                                                          color: MyColors.light,
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
                                                          backgroundColor: MyColors.dark,
                                                          animationDuration: const Duration(milliseconds: 400),
                                                          alertBorder: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(MyBorderRadius.normal),
                                                            side: const BorderSide(
                                                              color: MyColors.light,
                                                            ),
                                                          ),
                                                          alertAlignment: Alignment.center,
                                                        ),
                                                      ).show(),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(MyBorderRadius.normal),
                                                        child: Image.network(
                                                          state.pictures.collection!.items![index].links!.first.href!,
                                                          fit: BoxFit.cover,
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
                                      return const Center(
                                        child: Text(
                                          'No pictures found for this body',
                                          style: MyTextStyles.info,
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
              const CustomError();
            }
            return Container();
          },
        ),
      ),
    );
  }

  IconButton _buildIconButton({
    required PicturesLoaded state,
    required BuildContext context,
    required IconData icon,
    required Function() onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: MyColors.light,
        size: 30,
      ),
    );
  }
}
