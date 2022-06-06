import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_data/utils/constants.dart';

class TypingText extends StatelessWidget {
  const TypingText({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(content, textStyle: const TextStyle(color: MyColors.lightColor, fontSize: 25)),
      ],
      isRepeatingAnimation: false,
    );
  }
}
