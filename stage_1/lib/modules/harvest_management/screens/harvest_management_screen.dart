import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/constants/app_enums.dart';
import 'package:stage_1/modules/harvest_management/provider/harvest_management_model.dart';
import 'package:stage_1/widgets/stless/blank.dart';
import 'package:stage_1/widgets/stless/checkbox_list_tile.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/custom_datepicker.dart';
import 'package:stage_1/widgets/stless/custom_text_field.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';
import 'package:stage_1/widgets/stless/harvest_history_tile.dart';
import 'package:stage_1/widgets/stless/picker_modal.dart';

class HarvestManagementScreen extends StatefulWidget {
  const HarvestManagementScreen({Key? key}) : super(key: key);

  @override
  _HarvestManagementScreenState createState() =>
      _HarvestManagementScreenState();
}

class _HarvestManagementScreenState extends State<HarvestManagementScreen> {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(now);
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<HarvestManagementModel>(
        create: (_) => HarvestManagementModel(),
        builder: (context, child) {
          return Consumer<HarvestManagementModel>(
              builder: (context, model, child) {
            return Scaffold(
                appBar: const CustomAppBar(
                  title: AppConstants.harvestManagement,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          'Atiso',
                          style: CustomTextStyle.heading2BlackBold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: size.height / 4,
                        child: Card(
                            margin: const EdgeInsets.all(16),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: const LinearGradient(colors: [
                                    LightTheme.darkGreen,
                                    LightTheme.lightGreen
                                  ])),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            AppConstants.amountOfHarvesting,
                                            style: CustomTextStyle.heading3
                                                .copyWith(
                                              color: LightTheme.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '12 tan',
                                            style: CustomTextStyle.heading3
                                                .copyWith(
                                              color: LightTheme.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const VerticalDivider(
                                      color: Colors.white,
                                      thickness: 1,
                                    ),
                                    Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppConstants.numberOfHarvests,
                                              style: CustomTextStyle.heading3
                                                  .copyWith(
                                                color: LightTheme.white,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              'n lan',
                                              style: CustomTextStyle.heading3
                                                  .copyWith(
                                                color: LightTheme.white,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ]),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ),
                      CustomDatePicker(
                          value: model.harvestTime,
                          setValue: (value) {
                            model.setharvestTime(value);
                          },
                          hintText: formatted,
                          title: 'Ngày thu hoạch'),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 3,
                                child: CustomInputField(
                                    content: AppConstants.quantity,
                                    description: AppConstants.enterQuantity,
                                    keyboardType: TextInputType.number,
                                    size: size,
                                    controller: model.amountOfHarvesting)),
                            // Expanded(
                            //   flex: 1,
                            //   child: GestureDetector(
                            //     onTap: showHarvestUnit(context, model);
                            //   )
                            //           ),
                          ],
                        ),
                      ),
                      LabeledCheckbox(
                        label: AppConstants.markTheLastHarvest,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected = newValue;
                          });
                        },
                        value: _isSelected,
                      ),
                      Container(
                          child: const Text('Lịch sử thu hoạch',
                              style: CustomTextStyle.heading2),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: LightTheme.lightGreen,
                          )))),
                      const Blank(),
                      HarvestHistoryTile(
                          onTap: () {}, title: 'title', subTitle: 'subTitle'),
                      HarvestHistoryTile(
                          onTap: () {}, title: 'title', subTitle: 'subTitle'),
                      HarvestHistoryTile(
                          onTap: () {}, title: 'title', subTitle: 'subTitle'),
                      const Blank(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: GradientButton(
                            size: size,
                            content: AppConstants.save,
                            onTap: () {}),
                      )
                    ],
                  ),
                ));
          });
        });
  }
}

void showHarvestUnit(context, HarvestManagementModel model) {
  showCupertinoModalPopup(
      context: context,
      builder: (_) => PickupModal(
            onSelectedItemChanged: (value) {
              model.setHarvestUnit(value);
            },
            selectedValue: model.harvestUnit.index,
            values: [...HarvestUnit.values.map((a) => Text(a.displayTitle))],
          ));
}
