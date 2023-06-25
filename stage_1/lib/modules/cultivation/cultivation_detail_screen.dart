import 'package:flutter/material.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/modules/product_management/screens/product_details_screen.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/custom_card.dart';

class CultivationDetailsScreen extends StatelessWidget {
  const CultivationDetailsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'Chi tiết canh tác',
      ),
      body: Material(
        color: LightTheme.greyBackground,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children:[
                  Row(
                    children: [
                      Expanded(
                        child: 
                        CustomCardView(
                          value: '',
                          title: 'Bón phân', 
                          img: 'https://cdn-icons-png.flaticon.com/512/2674/2674326.png', 
                          onTap: (){
                            Navigator.pushNamed(context, Routes.createCultivationFertilizerScreen);
                          },),
                            ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: 
                        CustomCardView(
                          value: '',
                          title: 'Sâu bệnh', 
                          img: 'https://cdn-icons-png.flaticon.com/512/6591/6591142.png', 
                          onTap: (){
                            Navigator.pushNamed(context, Routes.createCultivationDiseaseScreen);
                          },),
                            ),
                    ],
                  ),
                  const Blank(),
                  Row(
                    children: [
                      Expanded(
                        child: 
                        CustomCardView(
                          value: '',
                          title: 'Tưới nước', 
                          img: 'https://cdn-icons-png.flaticon.com/512/4293/4293272.png', 
                          onTap: (){
                            Navigator.pushNamed(context, Routes.createCultivationDetailsScreen);
                          },),
                            ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: 
                        CustomCardView(
                          value: '',
                          title: 'Thuốc bảo vệ thực vật', 
                          img: 'https://cdn-icons-png.flaticon.com/512/2855/2855889.png', 
                          onTap: (){
                            Navigator.pushNamed(context, Routes.createCultivationPesticideScreen);
                          },),
                            ),
                    ],
                  ),
                  const Blank(),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      width: size.width,
                      decoration: BoxDecoration(
                         border: Border.all(color: LightTheme.grey, width: 1),
                                    borderRadius: BorderRadius.circular(8),
                                    color: LightTheme.white,),
                      child: Column(
                        children: [
                          Image.network('https://cdn-icons-png.flaticon.com/512/4689/4689777.png',
                                    width: size.width/8,
                                    height: size.height/8,),
                          Text('Thu hoạch',
                            style: CustomTextStyle.heading3.copyWith(color: LightTheme.darkGreen,),
                            textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, Routes.harvestManagementScreen);
                    },
                  )
                ]
              ),
            )
          ),
        ),
      ),
    );
  }
}