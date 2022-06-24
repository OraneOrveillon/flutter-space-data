import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class MyScrollbar extends StatelessWidget {
  const MyScrollbar({Key? key, required this.child, required this.scrollController}) : super(key: key);

  final Widget child;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: MyColors.lightColor,
      radius: const Radius.circular(20),
      thickness: 7,
      controller: scrollController,
      child: child,
    );
  }
}
