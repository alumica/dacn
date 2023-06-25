import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/constants/app_enums.dart';
import 'package:stage_1/modules/product_management/provider/create_aquatic_product_screen_model.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/custom_text_field.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';
import 'package:stage_1/widgets/stless/picker_modal.dart';

class CreateAquaticProductScreen extends StatefulWidget {
  const CreateAquaticProductScreen({Key? key}) : super(key: key);

  @override
  _CreateAquaticProductScreenState createState() =>
      _CreateAquaticProductScreenState();
}

class _CreateAquaticProductScreenState
    extends State<CreateAquaticProductScreen> {
  //Animal categories
  static final List<AnimalCategory> _animalcaterogries = [
    AnimalCategory('Cá'),
    AnimalCategory('Giáp xác'),
    AnimalCategory('Động vật thân mềm'),
    AnimalCategory('Rong'),
    AnimalCategory('Bò sát và lưỡng cư'),
  ];

  final _items = _animalcaterogries
      .map((animalcaterogries) => MultiSelectItem<AnimalCategory>(
          animalcaterogries, animalcaterogries.name))
      .toList();

  final List<AnimalCategory> _selectedAnimalCategory = [];

  //crops
  static final List<Animals> _animals = [
    Animals('Cá tầm'),
    Animals('Tôm'),
    Animals('Nghêu'),
    Animals('Rong biển'),
    Animals('Ếch'),
    Animals('Rắn'),
  ];

  final _itemsAnimal = _animals
      .map((animals) => MultiSelectItem<Animals>(animals, animals.nameAnimals))
      .toList();

  final List<Animals> _selectedAnimals = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<CreateAquaticProductScreenModel>(
        create: (_) => CreateAquaticProductScreenModel(),
        builder: (context, child) {
          return Consumer<CreateAquaticProductScreenModel>(
              builder: (context, model, child) {
            return Scaffold(
                appBar: const CustomAppBar(
                  title: AppConstants.createAnimal,
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        //Crop Categories
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: (Text(
                              AppConstants.aquaticCategory,
                              style: CustomTextStyle.heading3,
                            ))),
                        // MultiSelectDialogField(
                        //   height: size.height / 4,
                        //   items: _items,
                        //   title: const Text(AppConstants.enterAquaticCategory),
                        //   selectedColor: LightTheme.lightGreen,
                        //   decoration: BoxDecoration(
                        //     borderRadius:
                        //         const BorderRadius.all(Radius.circular(8)),
                        //     border: Border.all(
                        //       color: LightTheme.grey,
                        //       width: 2,
                        //     ),
                        //   ),
                        //   buttonIcon: const Icon(
                        //     FontAwesomeIcons.mapPin,
                        //     color: LightTheme.grey,
                        //   ),
                        //   buttonText: const Text(
                        //     AppConstants.enterAquaticCategory,
                        //     style: TextStyle(
                        //       color: LightTheme.grey,
                        //       fontSize: 16,
                        //     ),
                        //   ),
                        //   onConfirm: (values) {
                        //     setState(() {
                        //       // _selectedCrops = values;
                        //     });
                        //   },
                        //   chipDisplay: MultiSelectChipDisplay(
                        //     onTap: (value) {
                        //       setState(() {
                        //         _selectedAnimalCategory.remove(value);
                        //       });
                        //     },
                        //   ),
                        // ),
                        // _selectedAnimalCategory == null ||
                        _selectedAnimalCategory.isEmpty
                            ? Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  " ",
                                  style: TextStyle(color: Colors.black54),
                                ))
                            : Container(),
                        //Crops
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: (Text(
                              AppConstants.aquaticAnimals,
                              style: CustomTextStyle.heading3,
                            ))),
                        // MultiSelectDialogField(
                        //   height: size.height / 4,
                        //   items: _itemsAnimal,
                        //   title: const Text(AppConstants.enterAquaticAnimals),
                        //   selectedColor: LightTheme.lightGreen,
                        //   decoration: BoxDecoration(
                        //     borderRadius:
                        //         const BorderRadius.all(Radius.circular(8)),
                        //     border: Border.all(
                        //       color: LightTheme.grey,
                        //       width: 2,
                        //     ),
                        //   ),
                        //   buttonIcon: const Icon(
                        //     FontAwesomeIcons.chevronDown,
                        //     color: LightTheme.grey,
                        //   ),
                        //   buttonText: const Text(
                        //     AppConstants.enterAquaticAnimals,
                        //     style: TextStyle(
                        //       color: LightTheme.grey,
                        //       fontSize: 16,
                        //     ),
                        //   ),
                        //   onConfirm: (values) {
                        //     setState(() {
                        //       // _selectedCrops = values;
                        //     });
                        //   },
                        //   chipDisplay: MultiSelectChipDisplay(
                        //     onTap: (value) {
                        //       setState(() {
                        //         _selectedAnimals.remove(value);
                        //       });
                        //     },
                        //   ),
                        // ),
                        // _selectedAnimals == null ||
                        _selectedAnimals.isEmpty
                            ? Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  " ",
                                  style: TextStyle(color: Colors.black54),
                                ))
                            : Container(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: (Text(
                                  AppConstants.startTime,
                                  style: CustomTextStyle.heading3,
                                ))),
                            GestureDetector(
                              onTap: () {
                                showStartTimePicker(context, model);
                              },
                              child: Container(
                                  height: size.height / 24,
                                  alignment: Alignment.centerLeft,
                                  child: Center(
                                      child: Text(
                                    model.st.toString(),
                                    style: CustomTextStyle.heading3,
                                  ))),
                            ),
                          ],
                        ),
                        blank(),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: CustomInputField(
                                  content: AppConstants.farmingTime,
                                  description: AppConstants.enterFarmingTime,
                                  keyboardType: TextInputType.number,
                                  size: size,
                                  controller: model.farmingTime),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  showUnitTimePicker(context, model);
                                },
                                child: Container(
                                    height: size.height / 24,
                                    alignment: Alignment.centerLeft,
                                    child: Center(
                                        child: Text(
                                      model.unitTime.displayTitle,
                                      style: CustomTextStyle.heading3,
                                    ))),
                              ),
                            )
                          ],
                        ),
                        blank(),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: CustomInputField(
                                  content: AppConstants.quantity,
                                  description: AppConstants.enterQuantity,
                                  keyboardType: TextInputType.number,
                                  size: size,
                                  controller: model.quantityController),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  showUnitQuantityPicker(context, model);
                                },
                                child: Container(
                                    height: size.height / 24,
                                    alignment: Alignment.centerLeft,
                                    child: Center(
                                        child: Text(
                                      model.unitQuantity.displayTitle,
                                      style: CustomTextStyle.heading3,
                                    ))),
                              ),
                            )
                          ],
                        ),
                        blank(),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: CustomInputField(
                                  content: AppConstants.area,
                                  description: AppConstants.enterArea,
                                  size: size,
                                  keyboardType: TextInputType.number,
                                  controller: model.areaController),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  showAreaPicker(context, model);
                                },
                                child: Container(
                                    height: size.height / 24,
                                    alignment: Alignment.centerLeft,
                                    child: Center(
                                        child: Text(
                                      model.area.displayTitle,
                                      style: CustomTextStyle.heading3,
                                    ))),
                              ),
                            )
                          ],
                        ),
                        blank(),
                        GradientButton(
                            size: size,
                            content: AppConstants.createPlants,
                            onTap: () {})
                      ],
                    ),
                  ),
                ));
          });
        });
  }
}

SizedBox blank() {
  return const SizedBox(
    height: AppConstants.primaryPadding,
  );
}

class Animals {
  final String nameAnimals;

  Animals(this.nameAnimals);
}

class AnimalCategory {
  final String name;

  AnimalCategory(
    this.name,
  );
}

void showStartTimePicker(context, CreateAquaticProductScreenModel model) {
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

void showUnitTimePicker(context, CreateAquaticProductScreenModel model) {
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

void showUnitQuantityPicker(context, CreateAquaticProductScreenModel model) {
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

void showAreaPicker(context, CreateAquaticProductScreenModel model) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => PickupModal(
      onSelectedItemChanged: (value) {
        model.setArea(value);
        // setState(() {
        //   model.setArea(value);
        // });
      },
      selectedValue: model.area.index,
      values: [...Area.values.map((a) => Text(a.displayTitle))],
    ),
  );
}
