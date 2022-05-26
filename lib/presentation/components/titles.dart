import 'package:flutter/material.dart';
import 'package:flutter_space_data/utils/constants.dart';

class TopTitle extends StatelessWidget {
  const TopTitle({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Paddings.veryLarge),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: double.infinity,
              child: FittedBox(
                child: BackButton(
                  color: MyColors.lightColor,
                ),
              ),
            ),
            Expanded(
              child: FittedBox(
                child: Text(
                  label,
                  style: const TextStyle(color: MyColors.lightColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
