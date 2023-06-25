import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';

class FarmProductBox extends StatelessWidget {
  const FarmProductBox({Key? key, required this.title, required this.time})
      : super(key: key);

  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: LightTheme.lightGreenBackground,
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: CustomTextStyle.heading3
                  .copyWith(fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            time,
            style: CustomTextStyle.heading3,
          ),
        ],
      ),
    );
  }
}
