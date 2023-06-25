import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/constants/app_enums.dart';
import 'package:stage_1/models/farm.dart';
import 'package:stage_1/models/placeholder.dart' as md;
import 'package:stage_1/modules/product_management/provider/create_farm_product_screen_model.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/custom_datepicker.dart';
import 'package:stage_1/widgets/stless/custom_dropdown.dart';
import 'package:stage_1/widgets/stless/custom_text_field.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';
import 'package:stage_1/widgets/stless/picker_modal.dart';

class CreateFarmProductScreen extends StatefulWidget {
  const CreateFarmProductScreen({Key? key, required this.farm})
      : super(key: key);

  final Farm farm;

  @override
  _CreateFarmProductScreenState createState() =>
      _CreateFarmProductScreenState();
}

class _CreateFarmProductScreenState extends State<CreateFarmProductScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<CreateFarmProductScreenModel>(
        create: (_) => CreateFarmProductScreenModel()..initModel(),
        builder: (context, child) {
          return Consumer<CreateFarmProductScreenModel>(
              builder: (context, model, child) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: const CustomAppBar(
                title: AppConstants.createPlants,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const Text(
                        //   'Loại canh tác',
                        //   style: CustomTextStyle.heading2,
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     showSpeciesPicker(context, size, model);
                        //   },
                        //   child: Container(
                        //       height: size.height / 24,
                        //       alignment: Alignment.centerLeft,
                        //       decoration: selectDecoration(),
                        //       child: Text(
                        //         model.selectedSpecies ??
                        //             'Chọn loại canh tác',
                        //         style: model.selectedSpecies == null
                        //             ? CustomTextStyle.heading4Grey
                        //             : CustomTextStyle.heading4,
                        //       )),
                        // ),
                        // blank(),
                        const Text(
                          'Giống cây trồng',
                          style: CustomTextStyle.heading2,
                        ),
                        GestureDetector(
                          onTap: () {
                            showVarietyPicker(context, size, model);
                          },
                          child: Container(
                              height: size.height / 24,
                              alignment: Alignment.centerLeft,
                              decoration: selectDecoration(),
                              child: Text(
                                model.selectedVariety?.name ??
                                    'Chọn giống cây trồng',
                                style: model.selectedVariety == null
                                    ? CustomTextStyle.heading4Grey
                                    : CustomTextStyle.heading4,
                              )),
                        ),
                        // blank(),
                        // const Text(
                        //   'Loại giống',
                        //   style: CustomTextStyle.heading2,
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     showSeedsPicker(context, size, model);
                        //   },
                        //   child: Container(
                        //       height: size.height / 24,
                        //       alignment: Alignment.centerLeft,
                        //       decoration: selectDecoration(),
                        //       child: Text(
                        //         model.selectedSeed?.name ?? 'Chọn giống',
                        //         style: model.selectedSeed == null
                        //             ? CustomTextStyle.heading4Grey
                        //             : CustomTextStyle.heading4,
                        //       )),
                        // ),
                        blank(),
                        CustomDatePicker(
                          hintText: 'Chọn ngày bắt đầu trồng',
                          title: 'Ngày trồng',
                          value: model.startedAt,
                          setValue: (value) {
                            model.setStartedAt(value);
                          },
                        ),
                        blank(),
                        CustomDatePicker(
                          hintText: 'Chọn ngày thu hoạch dự kiến',
                          title: 'Ngày thu hoạch',
                          value: model.releasedAt,
                          setValue: (value) {
                            model.setReleasedAt(value);
                          },
                        ),
                        blank(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 4,
                              child: CustomInputField(
                                  content: AppConstants.quantity,
                                  description: AppConstants.enterQuantity,
                                  keyboardType: TextInputType.number,
                                  size: size,
                                  controller: model.quantityController),
                            ),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CustomDropDown(
                                    description: 'Chọn loại cây trồng',
                                    textAlign: TextAlign.center,
                                    content: model.unitQuantity.displayTitle,
                                    onTap: () {
                                      showUnitQuantityPicker(context, model);
                                    },
                                  ),
                                ))
                          ],
                        ),
                        blank(),
                        CustomInputField(
                          content: AppConstants.area,
                          description: AppConstants.enterArea,
                          size: size,
                          keyboardType: TextInputType.number,
                          controller: model.areaController,
                          validator: (value) {
                            if (double.parse(value!) > widget.farm.areaLeft!) {
                              return 'Diện tích còn lại không đủ.';
                            }
                            return null;
                          },
                        ),
                        Text(
                          'Hiện đang có ${widget.farm.areaLeft} m2 diện tích trống.',
                          style: CustomTextStyle.heading4,
                        ),
                        blank(),
                        GradientButton(
                          size: size,
                          content: AppConstants.createPlants,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              // _showLoadingDialog(context);
                              // try {
                              // TODO
                              md.Placeholder? placeholder =
                                  model.getTempPlaceholder(widget.farm.id!);
                              _showSuccessDialog(context, placeholder!, model,
                                  widget.farm.id!);
                                  // model.createPlaceholder(widget.farm.id!);
                              // } catch (e) {
                              //   _showFailDialog(context);
                              // }
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}

SizedBox blank() {
  return const SizedBox(
    height: 24,
  );
}

class Crops {
  final String nameCrops;

  Crops(this.nameCrops);
}

class CropsCategory {
  final String name;

  CropsCategory(
    this.name,
  );
}

void showStartTimePicker(context, CreateFarmProductScreenModel model) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: LightTheme.white,
        ),
        height: 460,
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  dateOrder: DatePickerDateOrder.dmy,
                  onDateTimeChanged: (val) {
                    model.setST(DateFormat('dd-MM-yyyy').format(val));
                    // setState(() {

                    // });
                  }),
            ),
            // Close the modal
            CupertinoButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    ),
  );
}

void showUnitTimePicker(context, CreateFarmProductScreenModel model) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => PickupModal(
      onSelectedItemChanged: (value) {
        model.setUnitTime(value);
        // setState(() {
        //   model.setUnitTime(value);
        // });
      },
      selectedValue: model.unitTime.index,
      values: [...UnitTime.values.map((a) => Text(a.displayTitle))],
    ),
  );
}

void showUnitQuantityPicker(context, CreateFarmProductScreenModel model) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => PickupModal(
      onSelectedItemChanged: (value) {
        model.setUnitQuantity(value);
        // setState(() {
        //   model.setUnitQuantity(value);
        // });
      },
      selectedValue: model.unitQuantity.index,
      values: [...UnitQuantity.values.map((a) => Text(a.displayTitle))],
    ),
  );
}

Future<dynamic> _showSuccessDialog(
    BuildContext context,
    md.Placeholder placeholder,
    CreateFarmProductScreenModel model,
    String farmId) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
            title: const Text('Xác nhận'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${placeholder.variety!.name}'),
                Text(
                    'Trồng ${placeholder.seedQuantity} ${placeholder.seedQuantityUnit} giống trên ${placeholder.area} ${placeholder.areaUnit}.'),
                Text(
                  'Sản lượng trung bình: ${placeholder.variety!.averageYield} tạ/ha.',
                  // ${placeholder.seed!.standardUnit}
                ),
                Text(
                  'Thu nhập dự kiến: ${(placeholder.variety!.currentPrice ?? 0 * (placeholder.area ?? 0) * (placeholder.variety!.averageYield ?? 0)).toInt()} VNĐ.',
                  // ${placeholder.seed!.standardUnit}
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Hủy bỏ')),
              TextButton(
                  onPressed: () async {
                    md.Placeholder? placeholder =
                        await model.createPlaceholder(farmId);
                    Navigator.pop(context);

                    Navigator.pushReplacementNamed(
                        context, Routes.productDetailsScreen,
                        arguments: placeholder);
                  },
                  child: const Text('Xác nhận')),
            ],
          ));
}

void showSpeciesPicker(context, Size size, CreateFarmProductScreenModel model) {
  List<String> speciesType = ['Nông sản', 'Thuỷ sản'];
  showCupertinoModalPopup(
    context: context,
    builder: (_) => Material(
      child: Container(
        padding: const EdgeInsets.only(left: 24),
        height: size.height - 88,
        width: size.width,
        child: ListView.builder(
          itemCount: speciesType.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                model.setSpecies(speciesType[index]);
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 40,
                child: Text(
                  speciesType[index],
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

void showSeedsPicker(context, Size size, CreateFarmProductScreenModel model) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => Material(
      child: Container(
        padding: const EdgeInsets.only(left: 24),
        height: size.height - 88,
        width: size.width,
        child: ListView.builder(
          itemCount: model.seeds.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                model.setSeed(model.seeds[index]);
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 40,
                child: Text(
                  model.seeds[index].name!,
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

void showVarietyPicker(context, Size size, CreateFarmProductScreenModel model) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => Material(
      child: Container(
        padding: const EdgeInsets.only(left: 24),
        height: size.height - 88,
        width: size.width,
        child: ListView.builder(
          itemCount: model.varietyList.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                model.setVariety(model.varietyList[index]);
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 40,
                child: Text(
                  model.varietyList[index].name!,
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
