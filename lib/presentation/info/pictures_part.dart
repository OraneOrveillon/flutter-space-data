import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../bloc/pictures_bloc/pictures_bloc.dart';
import '../../utils/beautify_info.dart';
import '../../utils/constants.dart';
import '../components/errors.dart';
import '../components/progress_indicators.dart';
import '../components/scrollbars.dart';

class PicturesPart extends StatelessWidget {
  const PicturesPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
                      padding: const EdgeInsets.fromLTRB(0, MyPaddings.large, 0, MyPaddings.large),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Pictures :',
                              style: MyTextStyles.sectionTitle,
                            ),
                          ),
                          PageButton(
                            state: state,
                            icon: Icons.arrow_back,
                            tooltip: 'Previous page',
                            onPressed: (state.pictures.collection!.links != null &&
                                    state.pictures.collection!.links!.first.rel == 'prev')
                                ? () {
                                    context.read<PicturesBloc>().add(
                                          LoadPicturesWithPage(
                                            url: state.pictures.collection!.links!.first.href!,
                                          ),
                                        );
                                  }
                                : null,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              MyPaddings.small,
                              0,
                              MyPaddings.small,
                              0,
                            ),
                            child: Text(
                              'Page ${state.pictures.collection!.href.substring(state.pictures.collection!.href.length - 1)}',
                              style: MyTextStyles.info,
                            ),
                          ),
                          PageButton(
                            state: state,
                            icon: Icons.arrow_forward,
                            tooltip: 'Next page',
                            onPressed: (state.pictures.collection!.links != null &&
                                    state.pictures.collection!.links!.last.rel == 'next')
                                ? () {
                                    context.read<PicturesBloc>().add(
                                          LoadPicturesWithPage(
                                            url: state.pictures.collection!.links!.last.href!,
                                          ),
                                        );
                                  }
                                : null,
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
                            List<String> pictureInfo =
                                BeautifyPictureInfo(pictureData: state.pictures.collection!.items![index].data!.first)
                                    .beautifiedPictureInfo;

                            return InkWell(
                              onTap: () => Alert(
                                context: context,
                                closeIcon: const Icon(
                                  Icons.close,
                                  color: MyColors.light,
                                ),
                                buttons: [],
                                content: SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Image.network(
                                          state.pictures.collection!.items![index].links!.first.href!,
                                        ),
                                      ),
                                      for (String info in pictureInfo)
                                        Padding(
                                          padding: const EdgeInsets.only(top: MyPaddings.small),
                                          child: Text(
                                            info,
                                            style: MyTextStyles.info,
                                          ),
                                        )
                                    ],
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
    );
  }
}

class PageButton extends StatelessWidget {
  const PageButton({required this.state, required this.icon, required this.tooltip, required this.onPressed, Key? key})
      : super(key: key);

  final PicturesLoaded state;
  final IconData icon;
  final String tooltip;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      padding: const EdgeInsets.all(0),
      icon: Icon(
        icon,
        color: onPressed != null ? MyColors.light : MyColors.accent2,
        size: 30,
      ),
    );
  }
}
