import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';

class CustomCardView extends StatelessWidget {
  const CustomCardView(
      {Key? key,
      required this.title,
      required this.img,
      required this.onTap,
      this.value})
      : super(key: key);

  final String title;
  final String img;
  final String? value;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: LightTheme.grey, width: 1),
          borderRadius: BorderRadius.circular(8),
          color: LightTheme.white,
        ),
        child: Column(
          children: [
            Image.asset(
              img,
              width: size.width / 8,
              height: size.height / 8,
            ),
            Text(title,
                style: CustomTextStyle.heading3.copyWith(
                  color: LightTheme.darkGreen,
                ),
                textAlign: TextAlign.center),
            Text(value!, style: CustomTextStyle.heading3Green.copyWith(
              fontWeight: FontWeight.bold
            ))
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
