import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/models/farm.dart';
import 'package:stage_1/modules/farm_management/details/farm_details_screen_model.dart';
import 'package:stage_1/modules/farm_management/details/widgets/farm_infomation.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/custom_container_decoration.dart';
import 'package:stage_1/widgets/stless/notfound_widget.dart';
import 'package:stage_1/widgets/stless/seed_sown_list_tile.dart';
import '../../../constants/assets_path.dart';

class FarmDetailsScreen extends StatefulWidget {
  const FarmDetailsScreen({Key? key, this.farm}) : super(key: key);
  final Farm? farm;

  @override
  State<FarmDetailsScreen> createState() => _FarmDetailsScreenState();
}

class _FarmDetailsScreenState extends State<FarmDetailsScreen> {
  late FarmDetailsScreenModel _model;
  @override
  void initState() {
    _model = FarmDetailsScreenModel(widget.farm);
    super.initState();
    _model.getPlaceholders();
  }

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<FarmDetailsScreenModel>(
      create: (_) => _model,
      child: Consumer<FarmDetailsScreenModel>(builder: (context, model, child) {
        return Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   child: const Icon(FontAwesomeIcons.plus),
          //   backgroundColor: LightTheme.darkGreen,
          //   onPressed: () {
          //     Navigator.pushNamed(context, Routes.createFarmProductScreen,
          //             arguments: widget.farm)
          //         .then((value) => setState(() {}));
          //   },
          // ),
          appBar: CustomAppBar(
            title: 'Nông trại',
            menuItem: [
              TextButton(
                onPressed: () => Navigator.pushNamed(
                        context, Routes.updateFarmScreen,
                        arguments: widget.farm)
                    .then((value) => setState(() {})),
                child: const Icon(
                  FontAwesomeIcons.pen,
                  size: 24,
                  color: LightTheme.darkGreen,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: FarmInformation(
                        farm: widget.farm, placeholders: model.placeholders),
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Các loại cây đang trồng',
                          style: CustomTextStyle.heading3
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                      context, Routes.createFarmProductScreen,
                                      arguments: widget.farm)
                                  .then((value) => setState(() {}));
                            },
                            child: Container(
                              decoration: borderContainer().copyWith(
                                color: LightTheme.lightGreenBackground,
                              ),
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('Thêm nông sản mới',
                                      style: CustomTextStyle.heading3GreenBold),
                                ],
                              ),
                            ),
                          ),
                          model.placeholders.isEmpty
                              ? NotFoundWidget(
                                  title: 'Chưa có nông sản',
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.createFarmProductScreen,
                                      arguments: widget.farm,
                                    ).then((value) => setState(() {}));
                                  },
                                )
                              : const SizedBox(),
                          ..._buildAgriWidgets(model),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
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

  List<Widget> _buildAgriWidgets(FarmDetailsScreenModel model) {
    return model.placeholders.map((a) {
      DateTime expectedHarvestTime = DateTime.now();
      if (a.expectedHarvestTime == null) {
        expectedHarvestTime =
            DateFormat("dd-MM-yyyy").parse(expectedHarvestTime.toString());
      } else {
        expectedHarvestTime =
            DateFormat("dd-MM-yyyy").parse(a.expectedHarvestTime!);
      }

      DateTime now = DateTime.now();
      // if (expectedHarvestTime.isBefore(now)) {
      //   return Container();
      // }
      return Column(
        children: [
          SeedSownListTile(
            imageUrl: getImg(a.variety!.name ?? 'cây trồng'),
            title: a.variety!.name ?? 'cây trồng', area: a.area ?? 0,
            // date: DateTimeHelper.getDate(a.createdAt!,
            //     format: 'dd-MM-yyyy'),
            // date: DateTimeHelper.getDate(DateTime.now(), format: 'dd-MM-yyyy'),
            date: a.expectedHarvestTime!,
            onPressed: () => Navigator.pushNamed(
                    context, Routes.productDetailsScreen,
                    arguments: a)
                .then((value) => setState(() {})),
            onDeleted: () {
              model.deletePlaceholder(a);
            },
          ),
          const Divider(),
        ],
      );
    }).toList();
  }
}

// expectedHavestTime