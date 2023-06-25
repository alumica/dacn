import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/modules/cultivation_provider/create_cultivation_fertilizers_model.dart';
import 'package:stage_1/modules/product_management/screens/product_details_screen.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/custom_datepicker.dart';
import 'package:stage_1/widgets/stless/custom_text_field.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';

class CreateCultivationFertilizerScreen extends StatefulWidget {
  const CreateCultivationFertilizerScreen({ Key? key }) : super(key: key);

  @override
  _CreateCultivationFertilizerScreenState createState() => _CreateCultivationFertilizerScreenState();
}

class _CreateCultivationFertilizerScreenState extends State<CreateCultivationFertilizerScreen> {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(now);
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<CreateCultivationFertilizerModel>
    (create: (_)=> CreateCultivationFertilizerModel(),
    builder: (context, child) {
      return Consumer<CreateCultivationFertilizerModel>
      (builder: (context, model, child){
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
                      content: 'Tên phân bón',
                      description: 'Nhập tên phân bón',
                      size: size,
                      keyboardType: TextInputType.name,
                      controller: model.nameFertilizer,
                      hasLimit: true,
                    ),
                    const Blank(),
                    CustomInputField(
                      content: 'Định lượng',
                      description: 'Nhập định lượng',
                      size: size,
                      keyboardType: TextInputType.number,
                      controller: model.amountOfFertilizer,
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
      });
    },);
  }
}