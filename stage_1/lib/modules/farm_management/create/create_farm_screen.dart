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
import 'package:stage_1/modules/farm_management/create/create_farm_screen_model.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/custom_dropdown.dart';
import 'package:stage_1/widgets/stless/custom_text_field.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';
import 'package:stage_1/widgets/stless/picker_modal.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CreateFarmScreen extends StatefulWidget {
  const CreateFarmScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CreateFarmScreenState createState() => _CreateFarmScreenState();
}

class _CreateFarmScreenState extends State<CreateFarmScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<CreateFarmScreenModel>(
      create: (_) => CreateFarmScreenModel()..getSoils(),
      builder: (context, child) {
        return Consumer<CreateFarmScreenModel>(
            builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: const CustomAppBar(
              title: 'Thêm Nông trại',
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
                  // CustomDropDown(
                  //   title: 'Chọn tỉnh',
                  //   onTap: () => _showProvinces(context, model),
                  //   description: 'Chọn tỉnh',
                  //   content: VNProvinces()
                  //       .allProvince(keyword: '')[model.province]
                  //       .name,
                  // ),
                  // blank(),
                  // CustomDropDown(
                  //   title: 'Chọn quận',
                  //   onTap: () => _showDistricts(context, model),
                  //   description: 'Chọn huyện',
                  //   content: model.soilsField,
                  // ),
                  // blank(),
                  // CustomDropDown(
                  //   title: 'Chọn huyện',
                  //   onTap: () => _showWards(context, model),
                  //   description: 'Chọn tỉnh',
                  //   content: model.soilsField,
                  // ),
                  // blank(),
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
                    content: AppConstants.createFarm,
                    onTap: () {
                      _createFarm(model);
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

  _createFarm(CreateFarmScreenModel model) async {
    // _showLoadingDialog(context);
    // try {
    var farm = await model.createFarm();

    // Navigator.pop(context);
    _showSuccessDialog(context, farm);
    // } catch (e) {
    //   _showFailDialog(context);
    // }
  }

  void _showAddressPicker(context, Size size, CreateFarmScreenModel model,
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

  void _showAreaPicker(context, CreateFarmScreenModel model) {
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
              content: const Text('Đã thêm nông trại thành công!'),
              actions: [
                TextButton(
                    onPressed: () {
                      // widget.refresh();
                      Navigator.pop(context);
                      // Navigator.pop(context, farm);

                      Navigator.pushReplacementNamed(
                        context,
                        Routes.farmDetailsScreen,
                        arguments: farm,
                        result: farm,
                      );
                    },
                    child: const Text('Xác nhận'))
              ],
            ));
  }

  // Future<dynamic> _showFailDialog(BuildContext context) {
  //   return showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (_) => AlertDialog(
  //             title: const Text('Thất bại'),
  //             content: const Text('Thêm nông trại thất bại!'),
  //             actions: [
  //               TextButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text('Thử lại'))
  //             ],
  //           ));
  // }

  // Future<dynamic> _showLoadingDialog(BuildContext context) {
  //   return showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Scaffold(
  //         backgroundColor: Colors.red.withOpacity(0),
  //         body: const LoadingWidget(),
  //       );
  //     },
  //   );
  // }
  void _showSoilPicker(
      BuildContext context, CreateFarmScreenModel model) async {
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

  BoxDecoration selectDecoration() {
    return const BoxDecoration(
      border: Border(
          bottom: BorderSide(
        color: LightTheme.grey,
        width: 2,
      )),
    );
  }
}

SizedBox blank() {
  return const SizedBox(
    height: AppConstants.primaryPadding,
  );
}
