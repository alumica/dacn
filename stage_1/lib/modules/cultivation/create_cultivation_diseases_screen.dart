import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/modules/cultivation_provider/create_cultivation_diaseases_model.dart';
import 'package:stage_1/modules/product_management/screens/product_details_screen.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/custom_datepicker.dart';
import 'package:stage_1/widgets/stless/custom_text_field.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';

class CreateCultivationDiseasesScreen extends StatefulWidget {
  const CreateCultivationDiseasesScreen({ Key? key }) : super(key: key);

  @override
  _CreateCultivationDiseasesScreenState createState() => _CreateCultivationDiseasesScreenState();
}

class _CreateCultivationDiseasesScreenState extends State<CreateCultivationDiseasesScreen> {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(now);
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<CreateCultivationDiseasesModel>
    (create: (_) => CreateCultivationDiseasesModel(),
    builder: (context, child){
      return Consumer<CreateCultivationDiseasesModel>(
        builder: (context, model, child) {
          return Scaffold(
            resizeToAvoidBottomInset : false,
            appBar: const CustomAppBar(
            title: 'Thêm chi tiết canh tác',
            ),
            body: 
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  CustomDatePicker(
                    value: model.date, 
                    setValue: (value) {
                                  model.setDate(value);
                                }, 
                    hintText: formatted, 
                    title: 'Thời gian'),
                    const Blank(),
                     CustomInputField(
                      content: 'Tên bệnh',
                      description: 'Nhập tên bệnh',
                      size: size,
                      keyboardType: TextInputType.name,
                      controller: model.nameDisease,
                      hasLimit: true,
                    ),
                    const Blank(),
                    CustomInputField(
                      content: 'Số lượng thiệt hại',
                      description: 'Nhập số lượng thiệt hại cho cây trồng',
                      size: size,
                      keyboardType: TextInputType.number,
                      controller: model.amountOfDamage,
                      hasLimit: true,
                    ),
                    const Blank(),
                    GradientButton(
                      size: size, 
                      content: AppConstants.add +' mới', 
                      onTap: (){})
                ]
        ),
      ),
          );
        },
      );
    });
  }
}