import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_data/utils/constants.dart';

class TypingText extends StatelessWidget {
  const TypingText({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: MyColors.lightColor, fontFamily: 'Autobus', fontSize: 20),
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText(content),
        ],
        isRepeatingAnimation: false,
      ),
    );
  }
}
