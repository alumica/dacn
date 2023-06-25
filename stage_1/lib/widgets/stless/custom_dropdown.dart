import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    this.content,
    this.title,
    this.description = '',
    this.textAlign = TextAlign.start,
    this.onTap,
  }) : super(key: key);

  final String? content;
  final String description;
  final TextAlign textAlign;
  final String? title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title!,
                style: CustomTextStyle.heading2,
              )
            : const SizedBox(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          width: double.infinity,
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              content != null && content!.isNotEmpty ? content! : description,
              textAlign: textAlign,
              style: content != null && content!.isNotEmpty
                  ? CustomTextStyle.heading4
                  : CustomTextStyle.heading4Grey,
            ),
          ),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: LightTheme.grey,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
