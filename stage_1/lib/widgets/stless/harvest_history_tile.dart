import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';

class HarvestHistoryTile extends StatelessWidget {
  const HarvestHistoryTile({ 
    Key? key, 
    required this.title, 
    this.onTap, 
    required this.subTitle }) : super(key: key);

  final Function()? onTap;
  final String subTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: RichText(
              text: TextSpan(
                text: AppConstants.harvestDate+': ',
                style: CustomTextStyle.heading3,
                children: <TextSpan>[
                  TextSpan(text: title, style: CustomTextStyle.heading3Grey),
                ],
              )),
            subtitle: RichText(
              text: TextSpan(
                text: AppConstants.amountOfHarvesting+': ',
                style: CustomTextStyle.heading3,
                children: <TextSpan>[
                  TextSpan(text: subTitle, style: CustomTextStyle.heading3Grey),
                ],
              )),
            trailing: const Icon(FontAwesomeIcons.edit,
            color: LightTheme.darkGreen,),
          ),
        ),
      ),);
  }
}