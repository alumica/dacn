import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/models/placeholder.dart' as md;
import 'package:stage_1/shared/helper/datetime_helper.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';

import '../../../constants/assets_path.dart';
// import 'package:stage_1/widgets/stless/gradient_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.placeholder})
      : super(key: key);

  final md.Placeholder placeholder;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: AppConstants.productDetail,
        menuItem: [
          TextButton(
            onPressed: () => Navigator.pushNamed(
                    context, Routes.updateFarmProductScreen,
                    arguments: widget.placeholder)
                .then((value) => setState(() {})),
            child: const Icon(
              FontAwesomeIcons.pen,
              size: 24,
              color: LightTheme.darkGreen,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(
              size: size,
              imgUrl: getImg(widget.placeholder.variety?.name ?? "Null"),
            ),
            const Blank(),
            Text(
              'Thông tin loại cây trồng',
              style: CustomTextStyle.heading2.copyWith(
                  fontWeight: FontWeight.w600, color: LightTheme.darkGreen),
            ),
            Text.rich(
              TextSpan(
                text: 'Tên loại: ',
                style: CustomTextStyle.heading3BlackBold,
                children: <TextSpan>[
                  TextSpan(
                      text: '${widget.placeholder.variety!.name}',
                      style: CustomTextStyle.heading3),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Chu kỳ sống: ',
                style: CustomTextStyle.heading3BlackBold,
                children: <TextSpan>[
                  TextSpan(
                      text: '${widget.placeholder.variety!.cycleType}',
                      style: CustomTextStyle.heading3),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Sản lượng trung bình: ',
                style: CustomTextStyle.heading3BlackBold,
                children: <TextSpan>[
                  TextSpan(
                      text:
                          '${widget.placeholder.variety!.averageYield} - ${widget.placeholder.variety!.standardUnit}',
                      style: CustomTextStyle.heading3),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Sản lượng tối đa: ',
                style: CustomTextStyle.heading3BlackBold,
                children: <TextSpan>[
                  TextSpan(
                      text:
                          '${widget.placeholder.variety!.maximumProductivity} - ${widget.placeholder.variety!.standardUnit}',
                      style: CustomTextStyle.heading3),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Mật độ: ',
                style: CustomTextStyle.heading3BlackBold,
                children: <TextSpan>[
                  TextSpan(
                      text:
                          '${widget.placeholder.variety!.density} - ${widget.placeholder.variety!.densityUnit}',
                      style: CustomTextStyle.heading3),
                ],
              ),
            ),
            const Divider(),
            // Text(
            //   'Thông tin giống cây trồng',
            //   style: CustomTextStyle.heading2.copyWith(
            //       fontWeight: FontWeight.w600, color: LightTheme.darkGreen),
            // ),
            // Text.rich(
            //   TextSpan(
            //     text: 'Giống: ',
            //     style: CustomTextStyle.heading3BlackBold,
            //     children: <TextSpan>[
            //       TextSpan(
            //           text: '${widget.placeholder.seed?.name}',
            //           style: CustomTextStyle.heading3),
            //     ],
            //   ),
            // ),
            // Text.rich(
            //   TextSpan(
            //     text: 'Chu kỳ sinh trưởng: ',
            //     style: CustomTextStyle.heading3BlackBold,
            //     children: <TextSpan>[
            //       TextSpan(
            //           text: '${widget.placeholder.seed?.cycleGrowth?.toInt()}',
            //           style: CustomTextStyle.heading3),
            //     ],
            //   ),
            // ),
            // Text.rich(
            //   TextSpan(
            //     text: 'Giá hiện tại: ',
            //     style: CustomTextStyle.heading3BlackBold,
            //     children: <TextSpan>[
            //       TextSpan(
            //           text: '${widget.placeholder.variety?.currentPrice} VNĐ',
            //           style: CustomTextStyle.heading3),
            //     ],
            //   ),
            // ),
            // Text.rich(
            //   TextSpan(
            //     text: 'Sản lượng trung bình: ',
            //     style: CustomTextStyle.heading3BlackBold,
            //     children: <TextSpan>[
            //       TextSpan(
            //           text:
            //               '${widget.placeholder.variety?.averageYield} - ${widget.placeholder.variety?.standardUnit}',
            //           style: CustomTextStyle.heading3),
            //     ],
            //   ),
            // ),
            // const Divider(),
            Text(
              'Thông tin cây trồng',
              style: CustomTextStyle.heading2.copyWith(
                  fontWeight: FontWeight.w600, color: LightTheme.darkGreen),
            ),
            Text.rich(
              TextSpan(
                text: 'Ngày gieo trồng: ',
                style: CustomTextStyle.heading3BlackBold,
                children: <TextSpan>[
                  TextSpan(
                      // text: widget.placeholder.,
                      text: DateTimeHelper.getDate(DateTime.now(),
                          format: 'dd-MM-yyyy'),
                      style: CustomTextStyle.heading3),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Ngày thu hoạch dự kiến: ',
                style: CustomTextStyle.heading3BlackBold,
                children: <TextSpan>[
                  TextSpan(
                      text: widget.placeholder.expectedHarvestTime,
                      style: CustomTextStyle.heading3),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Sản lượng thu hoạch dự kiến: ',
                style: CustomTextStyle.heading3BlackBold,
                children: <TextSpan>[
                  TextSpan(
                      text:
                          '${widget.placeholder.expectedHarvestQuantity} - ${widget.placeholder.expectedHarvestQuantityUnit}',
                      style: CustomTextStyle.heading3),
                ],
              ),
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

  Future<dynamic> _showHarvestDialog(
      BuildContext context, md.Placeholder placeholder) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Thu hoạch'),
              content: const Text('Xác nhận thu hoạch'),
              actions: [
                TextButton(
                    onPressed: () {
                      // widget.refresh();
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text('Xác nhận'))
              ],
            ));
  }
}

class Blank extends StatelessWidget {
  const Blank({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 16);
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key, required this.size, required this.imgUrl})
      : super(key: key);

  final Size size;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imgUrl,
          height: size.height / 6,
          width: size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
