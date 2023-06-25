import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';



class PlantTechTile extends StatelessWidget {
  const PlantTechTile({
    required this.title, 
    required this.description,
    this.onTap,
    Key? key }) : super(key: key);

  final String title;
  final String description;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        color: LightTheme.greyBackground,
        child: Column(
          children: [
            Card(
              shape: const Border(
                bottom: BorderSide(
                  color: LightTheme.darkGreen
                )
              ),
              child: ListTile(
                title: Text(title, 
                  style: CustomTextStyle.heading3BlackBold,),
                trailing: 
                const Icon(FontAwesomeIcons.chevronDown, size: 16,),
                onTap: onTap),
              ),
              Container(
              color: LightTheme.greyBackground,
              child: ListTile(
                title: Text(description),
              ),

            )
            ],
        ),
      ),
  );
  }
}

