import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/modules/home/widgets/number_container_widget.dart';
import '../../constants/app_constants.dart';
import '../../widgets/stless/custom_container_decoration.dart';

import 'home_page_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomePageProvider homeModel;

  @override
  void initState() {
    homeModel = HomePageProvider();
    super.initState();
    syncData();
  }

  Future<void> syncData() async {
    await homeModel.getAllPlaceholder();
    await homeModel.getAllFarms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<HomePageProvider>(
        create: (_) => homeModel,
        builder: (context, child) => Consumer<HomePageProvider>(
          builder: (context, model, child) {
            model.getUsername();
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: syncData,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.only(bottom: 16.0),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Xin chào 👋',
                                    style: CustomTextStyle.heading1Green
                                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
                                Text(model.userName ?? "",
                                    style: CustomTextStyle.heading1GreenBold
                                        .copyWith(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w800)),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.showProfileScreen);
                              },
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundColor: LightTheme.lightGreen,
                                child: Center(
                                    child: FaIcon(FontAwesomeIcons.leaf)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      NumberContainer(model: model),
                      Container(
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
                            FutureBuilder(
                              future: model.getAllPlaceholder(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return Container(
                                        alignment: Alignment.center,
                                        margin:
                                            const EdgeInsets.only(top: 64),
                                        child:
                                            const CircularProgressIndicator());
                                  default:
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      return model.placeholders.isEmpty
                                          ? Container(
                                              margin: const EdgeInsets.only(
                                                  top: 64),
                                              alignment: Alignment.center,
                                              child: const Text(
                                                  'Chưa có dữ liệu'))
                                          : Column(
                                              children: model.placeholders
                                                  .map((e) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 12),
                                                        child: Container(
                                                          decoration: const BoxDecoration(
                                                              border: Border(
                                                                  bottom: BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width:
                                                                          1))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  e.variety
                                                                          ?.name ??
                                                                      '',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: CustomTextStyle
                                                                      .heading3
                                                                      .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                ),
                                                                Text(
                                                                  e.expectedHarvestTime ??
                                                                      '',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: CustomTextStyle
                                                                      .heading3
                                                                      .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                            );
                                    }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
