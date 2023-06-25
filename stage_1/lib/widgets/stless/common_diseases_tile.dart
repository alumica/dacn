import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';

import 'custom_container_decoration.dart';

class CommonDiseasesTile extends StatelessWidget {
  const CommonDiseasesTile({
    Key? key, 
    required this.title,
    required this.date,
    this.onPressed, 
    required this.imageUrl, 
     }) : super(key: key);

    final String title;
    final String imageUrl;
    final String date;
    final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: borderContainer(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 32,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: CustomTextStyle.heading2
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Thời gian: '+date,
                    style: CustomTextStyle.heading4Grey
                        .copyWith(fontWeight: FontWeight.w600,)
                  ),
                ],
              ),
            ],
          ),
          TextButton(
              onPressed: onPressed,
              child: Text(
                'Chi tiết',
                style: CustomTextStyle.heading4.copyWith(color: LightTheme.darkGreen),
              )),
        ],
      ),
    );
  }
}