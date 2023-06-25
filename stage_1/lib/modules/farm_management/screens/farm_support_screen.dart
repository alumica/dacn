import 'package:flutter/material.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/modules/product_management/screens/product_details_screen.dart';
import 'package:stage_1/widgets/stless/common_diseases_tile.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';
import 'package:stage_1/widgets/stless/plant_tech_tile.dart';

// class FarmSupportScreen extends StatelessWidget {
//   const FarmSupportScreen({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         title: 'Hỗ trợ canh tác',
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text('data'),
//           AnimatedButtonBar(
//               radius: 8.0,
//               padding: const EdgeInsets.all(16.0),
//               children: [
//                 ButtonBarEntry(onTap: () => const Text('First item tapped'), child: const Text('Day')),
//                 ButtonBarEntry(onTap: () => const Text('Second item tapped'), child: const Text('Week')),
//                 ButtonBarEntry(onTap: () => const Text('Third item tapped'), child: const Text('Month')),
//                 ButtonBarEntry(onTap: () => const Text('Fourth item tapped'), child: const Text('Year'))
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }

class FarmSupportScreen extends StatefulWidget {
  const FarmSupportScreen({ Key? key }) : super(key: key);

  @override
  _FarmSupportScreenState createState() => _FarmSupportScreenState();
}

class _FarmSupportScreenState extends State<FarmSupportScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar:const CustomAppBar(
          title: AppConstants.farmSupport,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: LightTheme.grey
              ),
              height: size.height / 16,
              width: size.width,
              child: TabBar(
                unselectedLabelStyle: CustomTextStyle.heading4,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                // controller: ,
                tabs: const [
                  Tab(
                    text: AppConstants.plantTechniques,
                  ),
                  Tab(
                    text: AppConstants.fertilizerTechniques,
                  ),
                  Tab(
                    text: AppConstants.wateringTechniques,
                  ),
                  Tab(
                    text: AppConstants.commonDiseases,
                  ),
                ],
                indicator: BoxDecoration(
                    color: LightTheme.darkGreen,
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                        colors: [LightTheme.darkGreen, LightTheme.lightGreen])),
              ),
            ),
            SizedBox(
              height: 500,
              child: TabBarView(children: [
                SingleChildScrollView(
                  child: Column(
                    children: const [
                      Blank(),
                      PlantTechTile(
                        title: '1. Yêu cầu về đất',
                        description: 'today is present',
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const CommonDiseasesTile(
                          title: 'Bệnh đốm trắng',
                          date: '1/1/21',
                          imageUrl: AppConstants.imagePlaceholder),
                        GradientButton(
                          size: size, 
                          content: AppConstants.add +' bón phân', 
                          onTap: (){
                            Navigator.pushNamed(context, Routes.createCultivationFertilizerScreen);
                            })
                      ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const CommonDiseasesTile(
                          title: 'Bệnh đốm trắng',
                          date: '1/1/21',
                          imageUrl: AppConstants.imagePlaceholder),
                        GradientButton(
                          size: size, 
                          content: AppConstants.add +' thuốc bảo vệ thực vật', 
                          onTap: (){
                            Navigator.pushNamed(context, Routes.createCultivationPesticideScreen);
                          })
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const CommonDiseasesTile(
                          title: 'Bệnh đốm trắng',
                          date: '1/1/21',
                          imageUrl: AppConstants.imagePlaceholder),
                        GradientButton(
                          size: size, 
                          content: AppConstants.add +' sâu bệnh', 
                          onTap: (){
                            Navigator.pushNamed(context, Routes.createCultivationDiseaseScreen);
                          })
                    ],
                  ),
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
