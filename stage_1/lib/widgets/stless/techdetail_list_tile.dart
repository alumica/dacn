import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';

import 'custom_container_decoration.dart';

class TechDetailListTile extends StatelessWidget {
  const TechDetailListTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.onPressed,
    this.onDeleted,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final Function()? onPressed;
  final void Function()? onDeleted;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: borderContainer(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 32,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    title,
                    style: CustomTextStyle.heading2Green
                        .copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              height: size.height / 8,
              child: IconButton(
                onPressed: onPressed,
                icon: const FaIcon(
                  FontAwesomeIcons.arrowRight,
                  size: 16,
                  color: LightTheme.greyText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Temp extends StatelessWidget {
  const Temp({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.onPressed,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String date;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomTextStyle.heading3Green
                .copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            'Ngày gieo hạt: $date',
            style:
                CustomTextStyle.heading4.copyWith(color: LightTheme.greyText),
          ),
        ],
      ),
      trailing: TextButton(
          onPressed: onPressed,
          child: Text(
            'Chi tiết',
            style: CustomTextStyle.heading4.copyWith(color: LightTheme.red),
          )),
    );
  }
}
