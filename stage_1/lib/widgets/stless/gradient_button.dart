import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';

class GradientButton extends StatelessWidget {
  final Size size;
  final String content;
  final VoidCallback onTap;
  final bool isDisable;

  const GradientButton(
      {Key? key,
      this.isDisable = false,
      required this.size,
      required this.content,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisable ? null : onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        height: size.height / 16,
        width: size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              colors: <Color>[LightTheme.darkGreen, LightTheme.lightGreen],
            )),
        child: Text(
          content,
          style: CustomTextStyle.heading3White,
        ),
      ),
    );
  }
}
