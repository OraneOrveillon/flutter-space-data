import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ErrorDisplay extends StatelessWidget {
  const ErrorDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Something went wrong.',
        style: TextStyle(
          color: MyColors.errorColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
