import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget(
      {Key? key, this.opacity = 1, this.content = 'Đang tải...'})
      : super(key: key);

  final double opacity;
  final String content;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height / 4,
        width: size.width / 1.5,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: LightTheme.darkGreen),
            const SizedBox(height: 24),
            Text(content, style: CustomTextStyle.heading2),
          ],
        ),
      ),
    );
  }
}
