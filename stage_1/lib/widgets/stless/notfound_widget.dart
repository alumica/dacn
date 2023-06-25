import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    Key? key,
    this.onTap,
    required this.title,
    this.imagePath = 'assets/images/notfound.png',
  }) : super(key: key);
  final Function()? onTap;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: CustomTextStyle.heading3,
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Image.asset(
        //       imagePath,
        //       height: size.height / 2,
        //     ),
        //     GradientButton(
        //       size: size,
        //       content: title,
        //       onTap: onTap,
        //     )
        //   ],
        // ),
      ),
    );
  }
}
