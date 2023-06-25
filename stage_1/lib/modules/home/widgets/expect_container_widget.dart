import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/widgets/stless/custom_container_decoration.dart';
import 'package:stage_1/widgets/stless/farm_product_box.dart';

class ExpectContainer extends StatelessWidget {
  const ExpectContainer({
    Key? key,
    required this.expertOutputs,
  }) : super(key: key);

  final List<String> expertOutputs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderContainer(),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              AppConstants.harvestTitle,
              textAlign: TextAlign.left,
              style: CustomTextStyle.heading3
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          ...expertOutputs.map((e) => FarmProductBox(
                title: e,
                time: '1 thang',
              ))
        ],
      ),
    );
  }
}
