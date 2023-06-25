import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/modules/cultivation_provider/create_cultivation_model.dart';
import 'package:stage_1/modules/product_management/screens/product_details_screen.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/custom_datepicker.dart';
import 'package:stage_1/widgets/stless/custom_text_field.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';

class CreateCultivationDetails extends StatefulWidget {
  const CreateCultivationDetails({ 
    Key? key }) : super(key: key);

  @override
  _CreateCultivationDetailsState createState() => _CreateCultivationDetailsState();
}

class _CreateCultivationDetailsState extends State<CreateCultivationDetails> {
  // late CreateCultivationDetailModel _model;
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(now);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<CreateCultivationDetailModel>
    (create: (_)=> CreateCultivationDetailModel(),
    builder: (context, child) {
      return Consumer<CreateCultivationDetailModel>(
        builder: (context, model, child){
          return Scaffold(
            resizeToAvoidBottomInset : false,
            appBar: const CustomAppBar(
            title: 'Thêm chi tiết canh tác',
            ),
      body: Padding(
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
                content: 'Định lượng',
                description: 'Nhập định lượng',
                size: size,
                keyboardType: TextInputType.number,
                controller: model.quantity,
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
    });
    
    
  }
}


