import 'package:flutter/material.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';

class ScreensList extends StatefulWidget {
  const ScreensList({Key? key}) : super(key: key);

  @override
  State<ScreensList> createState() => _ScreensListState();
}

class _ScreensListState extends State<ScreensList> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    List<String> allScreens = const [
      Routes.onboardingScreen,
      Routes.signInScreen,
      Routes.signUpScreen,
      Routes.rootScreen,
      Routes.homeScreen,
      Routes.profileScreen,
      Routes.settingsScreen,
      Routes.farmManagementScreen,
      Routes.adviseScreen
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List All Screens',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: allScreens
              .map((e) => Builder(
                    builder: (_) => GradientButton(
                      content: e,
                      size: size,
                      onTap: () {
                        Navigator.pushNamed(context, e);
                      },
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
