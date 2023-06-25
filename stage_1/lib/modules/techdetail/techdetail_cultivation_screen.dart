import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/modules/product_management/screens/product_details_screen.dart';
import 'package:stage_1/modules/techdetail/techdetail_static_data.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';

import '../../constants/app_constants.dart';
import '../../constants/assets_path.dart';

class TechDetailCultivationScreen extends StatefulWidget {
  const TechDetailCultivationScreen({Key? key, required this.productName})
      : super(key: key);
  final String productName;

  @override
  State<TechDetailCultivationScreen> createState() =>
      _TechDetailCultivationScreenState();
}

class _TechDetailCultivationScreenState
    extends State<TechDetailCultivationScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var info = getInfoProduct(widget.productName);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: AppConstants.techDetailOfCultivation,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(
              size: size,
              imgUrl: getImg(widget.productName), //edit
            ),
            const Blank(),

            Text(
              '${info['t1']['title']}',
              style: CustomTextStyle.heading2.copyWith(
                  fontWeight: FontWeight.w600, color: LightTheme.darkGreen),
            ),
            Text(
              '${info['t1']['description']}',
              style: CustomTextStyle.heading3,
            ),
            const Divider(),
            const Spacer(),

            Text(
              '${info['t2']['title']}',
              style: CustomTextStyle.heading2.copyWith(
                  fontWeight: FontWeight.w600, color: LightTheme.darkGreen),
            ),
            Text(
              '${info['t2']['description']}',
              style: CustomTextStyle.heading3,
            ),
            const Divider(),
            const Spacer(),

            Text(
              '${info['t3']['title']}',
              style: CustomTextStyle.heading2.copyWith(
                  fontWeight: FontWeight.w600, color: LightTheme.darkGreen),
            ),
            Text(
              '${info['t3']['description']}',
              style: CustomTextStyle.heading3,
            ),

            const Divider(),
            const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 24.0),
            //   child: GradientButton(
            //     size: size,
            //     content: 'Thu hoạch',
            //     onTap: () {
            //       _showHarvestDialog(context, widget.placeholder);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  String getImg(String title) {
    String imgName = AssetPath.imgAtiso;

    switch (title) {
      case 'Hoa Hồng':
        {
          imgName = AssetPath.imgHoaHong;
          return imgName;
        }
      case 'Chuối Laba':
        {
          imgName = AssetPath.imgChuoi;
          return imgName;
        }
      case 'Atiso':
        {
          imgName = AssetPath.imgAtiso;
          return imgName;
        }
      case 'Phúc Bồn Tử Đen':
        {
          imgName = AssetPath.imgPhucbontuDen;
          return imgName;
        }
      case 'Phúc Bồn Tử Đỏ':
        {
          imgName = AssetPath.imgPhucbontuDo;
          return imgName;
        }
      case 'Cá Tầm':
        {
          imgName = AssetPath.imgCaTam;
          return imgName;
        }
      default:
        {
          return imgName;
        }
    }
  }
}
