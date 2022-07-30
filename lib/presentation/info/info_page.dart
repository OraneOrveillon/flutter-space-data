import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/pictures_bloc/pictures_bloc.dart';
import '../../bloc/solar_system_bloc/solar_system_bloc.dart';
import '../../bloc/wiki_bloc/wiki_bloc.dart';
import '../../utils/constants.dart';
import 'info_part.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key? key, required String bodyEnglishName, required String bodyUrl}) : super(key: key) {
    _singleBodyBloc = SolarSystemBloc()..add(LoadSingleBody(bodyUrl: bodyUrl));
    _picturesBloc = PicturesBloc()..add(LoadPictures(bodyName: bodyEnglishName));
    _wikiBloc = WikiBloc()..add(LoadWiki(bodyName: bodyEnglishName));
  }

  late final SolarSystemBloc _singleBodyBloc;
  late final PicturesBloc _picturesBloc;
  late final WikiBloc _wikiBloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _singleBodyBloc),
        BlocProvider(create: (context) => _picturesBloc),
        BlocProvider(create: (context) => _wikiBloc),
      ],
      child: const Scaffold(
        backgroundColor: MyColors.dark,
        body: InfoPart(),
      ),
    );
  }
}
