import 'package:flutter/material.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';

class CommonWidgetScreen extends StatelessWidget {
  const CommonWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Common Widget Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: Column(
          children: [
            GradientButton(
              size: size,
              content: 'List All Components',
              onTap: () {
                Navigator.pushNamed(context, Routes.componentsScreen);
              },
            ),
            GradientButton(
              size: size,
              content: 'List All Screens',
              onTap: () {
                Navigator.pushNamed(context, Routes.screensList);
              },
            ),
          ],
        ),
      ),
    );
  }
}
