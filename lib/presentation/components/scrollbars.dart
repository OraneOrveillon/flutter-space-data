import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class MyScrollbar extends StatelessWidget {
  const MyScrollbar({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: MyColors.lightColor,
      radius: const Radius.circular(20),
      thickness: 7,
      child: child,
    );
  }
}
