import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/widgets/stless/dialog_tile.dart';

class CustomDialogProduct extends StatelessWidget {
  const CustomDialogProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: 200,
        width: 150,
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text('Thêm mới', style: CustomTextStyle.heading1BlackBold),
            ),
            blank(),
            DialogTile(
                icon: FontAwesomeIcons.carrot,
                title: 'Nông sản',
                onTap: () {
                  Navigator.pushNamed(context, Routes.createFarmProductScreen);
                }),
            DialogTile(
                icon: FontAwesomeIcons.water,
                title: 'Thủy sản',
                onTap: () {
                  Navigator.pushNamed(
                      context, Routes.createAquaticProductScreen);
                }),
            DialogTile(
                icon: FontAwesomeIcons.tree,
                title: 'Lâm sản ',
                onTap: () {
                  Navigator.pushNamed(
                      context, Routes.createForestryProductScreen);
                })
          ],
        ),
      ),
    );
  }
}

SizedBox blank() {
  return const SizedBox(
    height: 4,
  );
}
