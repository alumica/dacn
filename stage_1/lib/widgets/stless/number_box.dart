import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';

class NumberBox extends StatelessWidget {
  const NumberBox({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: Container(
        // height: size.height / 14,
        decoration: const BoxDecoration(
            color: LightTheme.lightGreen,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: CustomTextStyle.heading3White,
            ),
            Text(
              value,
              style: CustomTextStyle.heading1.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
