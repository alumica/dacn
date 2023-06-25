import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/constants/assets_path.dart';
import 'package:stage_1/shared/helper/datetime_helper.dart';
import 'package:stage_1/widgets/stless/techdetail_list_tile.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/stless/custom_appbar.dart';

class TechDetailPage extends StatefulWidget {
  const TechDetailPage({Key? key}) : super(key: key);

  @override
  State<TechDetailPage> createState() => _TechDetailPageState();
}

class _TechDetailPageState extends State<TechDetailPage> {
  // @override
  //  void initState() {
  //    super.initState();
  //    // Enable virtual display.
  //    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  //  }

  // @override
  // Widget build(BuildContext context) {
  //   return const Scaffold(
  //     body: WebView(
  //       initialUrl: 'https://lacduongarg.dlu.edu.vn/techdetail',
  //       javascriptMode: JavascriptMode.unrestricted,
  //     )

  //     );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppConstants.techDetail,
        hideBack: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    const SizedBox(),
                    ..._buildAgriWidgets(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<String> _listTechDetail = [
    'Cá Tầm',
    'Chuối Laba',
    'Phúc Bồn Tử Đen',
    'Phúc Bồn Tử Đỏ',
    'Hoa Hồng',
    'Atiso'
  ];

  List<Widget> _buildAgriWidgets() {
    return _listTechDetail.map((e) {
      return Column(
        children: [
          TechDetailListTile(
            imageUrl: getImg(e),
            title: e,
            onPressed: () => Navigator.pushNamed(
                    context, Routes.techDetailCultivationScreen,
                    arguments: e)
                .then((value) => setState(() {})),
            onDeleted: () {},
          ),
          const Divider(),
        ],
      );
    }).toList();
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
