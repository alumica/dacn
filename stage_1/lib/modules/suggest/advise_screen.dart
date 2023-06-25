import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/custom_text_field.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';

import '../../config/routes/routes.dart';
import '../../widgets/stless/custom_datepicker.dart';
import 'advise_screen_model.dart';

class AdviseScreen extends StatelessWidget {
  const AdviseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<AdviseScreenProvider>(
      create: (_) => AdviseScreenProvider()..initModel(),
      builder: (context, child) {
        return Consumer<AdviseScreenProvider>(
          builder: (context, model, child) {
            return Scaffold(
              appBar: const CustomAppBar(
                title: 'Tư vấn cây trồng',
                hideBack: true,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //nuôi trồng cái gì
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: CustomInputField(
                          content: 'Nhập diện tích (m2)',
                          description: AppConstants.enterArea,
                          size: size,
                          keyboardType: TextInputType.number,
                          controller: model.areaController,
                        ),
                      ),
                      //button
                      GradientButton(
                          size: size,
                          content: 'Tư vấn cây trồng',
                          onTap: () {
                            model.setDataForResultPage();
                            Navigator.pushNamed(
                                context, Routes.suggestResultScreen);
                          })
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showVarietyPicker(context, Size size, AdviseScreenProvider model) {
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

  SizedBox blank() {
    return const SizedBox(
      height: 24,
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
