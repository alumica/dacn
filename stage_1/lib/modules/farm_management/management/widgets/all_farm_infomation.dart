import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';

class AllFarmInfomation extends StatelessWidget {
  const AllFarmInfomation({
    Key? key,
    required this.area,
    required this.areaUnit,
  }) : super(key: key);

  final int area;
  final String areaUnit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 0, 16),
      child: Text.rich(
        TextSpan(
          text: 'Tổng diện tích: ',
          style: CustomTextStyle.heading2,
          children: <TextSpan>[
            TextSpan(
              text: '$area $areaUnit',
              style: CustomTextStyle.heading1BlackBold,
            )
          ],
        ),
      ),
    );
  }
}
