import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';

class StatisticListTile extends StatelessWidget {
  const StatisticListTile({
    Key? key,
    this.imageUrl =
        'https://2sao.vietnamnetjsc.vn/images/2020/08/17/12/27/namdienvienleeminho.jpg',
    required this.title,
    required this.trailing,
    this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.5, color: LightTheme.grey),
              borderRadius: BorderRadius.circular(8)),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
          title: Text(title),
          trailing: Text(
            trailing,
            style: CustomTextStyle.heading3Green
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
