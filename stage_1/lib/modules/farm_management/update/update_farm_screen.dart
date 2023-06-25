import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/constants/app_enums.dart';
import 'package:stage_1/models/farm.dart';
import 'package:stage_1/models/soil.dart';
import 'package:stage_1/modules/farm_management/update/update_farm_screen_model.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/custom_dropdown.dart';
import 'package:stage_1/widgets/stless/custom_text_field.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';
import 'package:stage_1/widgets/stless/picker_modal.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class UpdateFarmScreen extends StatefulWidget {
  const UpdateFarmScreen({Key? key, required this.farm}) : super(key: key);

  final Farm farm;

  @override
  _UpdateFarmScreenState createState() => _UpdateFarmScreenState();
}

class _UpdateFarmScreenState extends State<UpdateFarmScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<UpdateFarmScreenModel>(
      create: (_) => UpdateFarmScreenModel()..initModel(widget.farm),
      builder: (context, child) {
        return Consumer<UpdateFarmScreenModel>(
            builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: const CustomAppBar(
              title: 'Cập nhật nông trại',
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppConstants.province,
                    style: CustomTextStyle.heading2,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showAddressPicker(context, size, model,
                          AddressLevel.province, null, model.provinces);
                    },
                    child: Container(
                        height: size.height / 24,
                        alignment: Alignment.centerLeft,
                        decoration: selectDecoration(),
                        child: Text(
                            model.province == null
                                ? AppConstants.enterProvince
                                : model.province!.name,
                            style: model.province == null
                                ? CustomTextStyle.heading4Grey
                                : CustomTextStyle.heading4)),
                  ),
                  blank(),
                  const Text(
                    AppConstants.district,
                    style: CustomTextStyle.heading2,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (model.province != null) {
                        _showAddressPicker(
                            context,
                            size,
                            model,
                            AddressLevel.district,
                            model.province!.code,
                            model.districts);
                      } else {
                        // TODO Warning
                      }
                    },
                    child: Container(
                        height: size.height / 24,
                        alignment: Alignment.centerLeft,
                        decoration: selectDecoration(),
                        child: Text(
                            model.district == null
                                ? AppConstants.enterDistrict
                                : model.district!.name,
                            style: model.district == null
                                ? CustomTextStyle.heading4Grey
                                : CustomTextStyle.heading4)),
                  ),
                  blank(),
                  const Text(
                    AppConstants.ward,
                    style: CustomTextStyle.heading2,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (model.district != null) {
                        _showAddressPicker(
                            context,
                            size,
                            model,
                            AddressLevel.ward,
                            model.district!.code,
                            model.wards);
                      } else {
                        // TODO Warning
                      }
                    },
                    child: Container(
                        height: size.height / 24,
                        alignment: Alignment.centerLeft,
                        decoration: selectDecoration(),
                        child: Text(
                            model.ward == null
                                ? AppConstants.enterWard
                                : model.ward!.name,
                            style: model.ward == null
                                ? CustomTextStyle.heading4Grey
                                : CustomTextStyle.heading4)),
                  ),
                  blank(),
                  CustomInputField(
                    content: AppConstants.addressFarm,
                    description: AppConstants.enterAddress,
                    size: size,
                    keyboardType: TextInputType.text,
                    controller: model.streetController,
                  ),
                  blank(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 4,
                        child: CustomInputField(
                          content: AppConstants.area,
                          description: AppConstants.enterArea,
                          size: size,
                          keyboardType: TextInputType.number,
                          controller: model.areaController,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CustomDropDown(
                              onTap: () => _showAreaPicker(context, model),
                              description: '',
                              content: model.area.displayTitle,
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                  blank(),
                  CustomDropDown(
                    title: 'Chọn loại đất',
                    onTap: () => _showSoilPicker(context, model),
                    description: 'Chọn loại đất cho đất của bạn',
                    content: model.soilsField,
                  ),
                  blank(),
                  blank(),
                  GradientButton(
                    size: size,
                    content: AppConstants.updateFarm,
                    onTap: () {
                      _updateFarm(model);
                    },
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  _updateFarm(UpdateFarmScreenModel model) async {
    // _showLoadingDialog(context);
    // try {
    var farm = await model.updateFarm();

    // Navigator.pop(context);
    _showSuccessDialog(context, farm);
    // } catch (e) {
    //   _showFailDialog(context);
    // }
  }

  void _showAreaPicker(context, UpdateFarmScreenModel model) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => PickupModal(
        onSelectedItemChanged: (value) {
          setState(() {
            model.setArea(value);
          });
        },
        selectedValue: model.area.index,
        values: [...Area.values.map((a) => Text(a.displayTitle))],
      ),
    );
  }

  Future<dynamic> _showSuccessDialog(BuildContext context, Farm farm) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Thành công'),
              content: const Text('Đã cập nhật nông trại thành công!'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(
                          context, Routes.farmDetailsScreen,
                          arguments: farm);
                    },
                    child: const Text('Xác nhận'))
              ],
            ));
  }

  void _showSoilPicker(
      BuildContext context, UpdateFarmScreenModel model) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog<Soil>(
          title: const Text('Chọn loại đất'),
          items: model.soilItems,
          initialValue: model.selectedSoils,
          onConfirm: (values) {
            model.setSelectedSoils(values);
          },
        );
      },
    );
  }
}

void _showAddressPicker(context, Size size, UpdateFarmScreenModel model,
    AddressLevel lv, int? code, List<dynamic> listAddress) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => Material(
      child: Container(
        padding: const EdgeInsets.only(left: 24),
        height: size.height - 88,
        width: size.width,
        child: ListView.builder(
          itemCount: listAddress.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                model.setAddressData(lv: lv, value: listAddress[index]);
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 40,
                child: Text(
                  listAddress[index].name,
                  style: CustomTextStyle.heading4,
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}

BoxDecoration selectDecoration() {
  return const BoxDecoration(
    border: Border(
        bottom: BorderSide(
      color: LightTheme.grey,
      width: 2,
    )),
  );
}

SizedBox blank() {
  return const SizedBox(
    height: AppConstants.primaryPadding,
  );
}
