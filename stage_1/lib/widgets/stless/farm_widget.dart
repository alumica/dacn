import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/models/farm.dart';

import 'custom_container_decoration.dart';

class FarmWidget extends StatelessWidget {
  const FarmWidget({
    Key? key,
    this.name = 'Nông trại',
    this.onTap,
    required this.farm,
  }) : super(key: key);

  final String name;
  final Farm farm;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          decoration: borderContainer(),
          padding: const EdgeInsets.all(8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: CustomTextStyle.heading3GreenBold),
                Text.rich(
                  TextSpan(
                    text: 'Địa chỉ: ',
                    style: CustomTextStyle.heading3BlackBold,
                    children: <TextSpan>[
                      TextSpan(
                        text: '${farm.street}, ${farm.ward} ${farm.district}',
                        style: CustomTextStyle.heading3,
                      )
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Tổng diện tích: ',
                    style: CustomTextStyle.heading3BlackBold,
                    children: <TextSpan>[
                      TextSpan(
                        text: '${farm.area?.round()} ${farm.areaUnit}',
                        style: CustomTextStyle.heading3,
                      )
                    ],
                  ),
                ),
                // Text.rich(
                //   TextSpan(
                //     text: 'Đang trồng ',
                //     style: CustomTextStyle.heading3,
                //     children: <TextSpan>[
                //       TextSpan(
                //         text: '${farm.listOfAgriculturalId?.length ?? 0}',
                //         style: CustomTextStyle.heading3BlackBold,
                //       ),
                //       TextSpan(
                //         text: ' loại cây.',
                //         style: CustomTextStyle.heading3,
                //       )
                //     ],
                //   ),
                // ),
              ]),
        ),
      ),
    );
  }
}
