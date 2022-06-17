import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class TopTitle extends StatelessWidget {
  const TopTitle({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Paddings.veryLarge),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 10,
            child: FittedBox(
              child: Text(
                label,
                style: const TextStyle(color: MyColors.lightColor, fontFamily: 'Doctor Glitch'),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            child: const FittedBox(
              child: BackButton(
                color: MyColors.lightColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
