import 'package:flutter/cupertino.dart';
import 'package:stage_1/constants/app_constants.dart';

class Blank extends StatelessWidget {
  const Blank({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
    height: AppConstants.primaryPadding,
  );
  }
}