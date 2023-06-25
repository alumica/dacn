import 'package:flutter/material.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/constants/assets_path.dart';
// import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/modules/home/home_page_model.dart';
import 'package:stage_1/widgets/stless/custom_card.dart';
import 'package:stage_1/widgets/stless/custom_container_decoration.dart';

class NumberContainer extends StatelessWidget {
  const NumberContainer({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HomePageProvider model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderContainer(),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Tổng quan',
              style: CustomTextStyle.heading3
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(children: [
                  Expanded(
                    child: CustomCardView(
                        title: 'Bạn đang có ',
                        img:
                            AssetPath.img_1,
                        value: model.getTotalFarm().toString() + " nông trại",
                        onTap: () {
                          Navigator.pushNamed(context, Routes.farmManagementScreen);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomCardView(
                        title: 'Diện tích đã trồng',
                        img:
                            AssetPath.img_2,
                        value: model.getFillInArea().toStringAsFixed(0) + " m2",
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.farmManagementScreen);
                        }),
                  ),
                ]),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomCardView(
                        title: 'Tổng diện tích',
                        img:
                            AssetPath.img_2,
                        value: model.getTotalArea().toStringAsFixed(0) + ' m2',
                        onTap: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomCardView(
                        title: 'Giống cây trồng',
                        img:
                            AssetPath.img_3,
                        value: model.getTotalPlaceholder().toString(),
                        onTap: () {}),
                  ),
                ],
              ),
            ],
          )
          // ...stats.map((stat) => NumberBox(
          //       title: 'Tổng diện tích',
          //       value: stat,
          //     )),
        ],
      ),
    );
  }
}
