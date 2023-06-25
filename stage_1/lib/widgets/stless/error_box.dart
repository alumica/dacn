import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stage_1/config/routes/routes.dart';

import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';

class ErrorBox extends StatelessWidget {
  const ErrorBox(
      {Key? key,
      required this.size,
      required this.errorMessage,
      this.close,
      this.goSignIn})
      : super(key: key);

  final Size size;
  final String errorMessage;
  final VoidCallback? close;
  final bool? goSignIn;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppConstants.primaryPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: LightTheme.white,
      ),
      height: size.height / 4,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                errorMessage,
                style: CustomTextStyle.heading3,
              ),
            ),
          ),
          CupertinoButton(
              child: const Text('OK'),
              onPressed: () {
                if (close != null) {
                  close!();
                }
                if (goSignIn == true) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.onboardingScreen, (route) => false);
                } else {
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
    );
  }
}
