import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/models/farm.dart';
import 'package:stage_1/modules/farm_management/management/farm_management_screen_model.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';

class FarmManagementScreen extends StatefulWidget {
  const FarmManagementScreen({Key? key}) : super(key: key);

  @override
  State<FarmManagementScreen> createState() => _FarmManagementScreenState();
}

class _FarmManagementScreenState extends State<FarmManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<FarmManagementScreenModel>(
      create: (_) => FarmManagementScreenModel(),
      child: Consumer<FarmManagementScreenModel>(
        builder: (context, model, child) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: const Icon(FontAwesomeIcons.plus),
              backgroundColor: LightTheme.darkGreen,
              onPressed: () {
                Navigator.pushNamed(context, Routes.createFarmScreen)
                    .then((value) => setState(() {}));
              },
            ),
            appBar: const CustomAppBar(
              title: 'Quản lý nông trại',
              hideBack: true,
            ),
            body: FutureBuilder(
              future: model.getListFarm(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Farm>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListView.builder(
                          itemCount: model.farms.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                                Routes.farmDetailsScreen,
                                                arguments: model.farms[index])
                                            .then((value) => setState(() {}));
                                      },
                                      child: Container(
                                        height: size.height / 8,
                                        decoration: BoxDecoration(
                                            color:
                                                LightTheme.lightGreenBackground,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16),
                                                    bottomLeft:
                                                        Radius.circular(16))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                'Nông trại',
                                                style: CustomTextStyle
                                                    .heading3BlackBold,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  text: 'Diện tích: ',
                                                  style: CustomTextStyle
                                                      .heading3BlackBold,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text:
                                                            '${model.farms[index].area!.toInt()} ${model.farms[index].areaUnit}',
                                                        style: CustomTextStyle
                                                            .heading3),
                                                  ],
                                                ),
                                              ),
                                              model.farms[index].street
                                                          ?.isEmpty ??
                                                      false
                                                  ? const SizedBox()
                                                  : Text.rich(
                                                      TextSpan(
                                                        text: 'Địa chỉ: ',
                                                        style: CustomTextStyle
                                                            .heading3BlackBold,
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text:
                                                                  '${model.farms[index].street ?? ''}, ${model.farms[index].ward ?? ''}, ${model.farms[index].district ?? ''}',
                                                              style:
                                                                  CustomTextStyle
                                                                      .heading3),
                                                        ],
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: size.height / 8,
                                    decoration: BoxDecoration(
                                        color: LightTheme.lightGreenBackground,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(16),
                                            bottomRight: Radius.circular(16))),
                                    child: IconButton(
                                      onPressed: () {
                                        model.deleteFarm(model.farms[index]);
                                      },
                                      icon: const FaIcon(
                                        FontAwesomeIcons.trashAlt,
                                        size: 16,
                                        color: LightTheme.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                }
              },
            ),
          );
        },
      ),
    );
  }
}
