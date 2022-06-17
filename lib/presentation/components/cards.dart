import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class SelectionCard extends StatelessWidget {
  const SelectionCard({Key? key, required this.onTap, required this.child}) : super(key: key);

  final Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [MyColors.accentColor, MyColors.accentColor.withOpacity(0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      ),
    );
  }
}
