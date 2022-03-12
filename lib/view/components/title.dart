import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.1, 50,
          MediaQuery.of(context).size.width * 0.1, 30),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.15,
        child: FittedBox(
          child: Text(
            title,
            style: const TextStyle(
              color: MyColors.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
