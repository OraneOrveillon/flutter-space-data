import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class SelectionCard extends StatelessWidget {
  const SelectionCard({Key? key, required this.onTap, required this.child}) : super(key: key);

  final Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(MyBorderRadius.normal),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyBorderRadius.normal),
          gradient: LinearGradient(
            colors: [MyColors.accent, MyColors.accent.withOpacity(0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      ),
    );
  }
}
