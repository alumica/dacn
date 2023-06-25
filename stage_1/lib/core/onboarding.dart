import 'package:flutter/material.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Ứng dụng Quản lý Nông nghiệp \n Huyện Lạc Dương',
                      style: CustomTextStyle.heading1GreenBold,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Image(
                      fit: BoxFit.fitWidth,
                      image: const AssetImage('assets/images/app_icon.jpg'),
                      height: size.height / 2,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Phụng sự Nông nghiệp Việt',
                      style: CustomTextStyle.heading2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              GradientButton(
                onTap: () {
                  Navigator.pushNamed(context, Routes.rootScreen);
                },
                content: 'Bắt đầu',
                size: size,
              )
            ],
          ),
        ),
      ),
    );
  }
}
