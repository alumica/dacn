import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage_1/config/themes/themes.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
    this.radius = 120,
    this.imageUrl =
        'https://2sao.vietnamnetjsc.vn/images/2020/08/17/12/27/namdienvienleeminho.jpg',
    this.onTap,
  }) : super(key: key);

  final double radius;
  final Function()? onTap;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: radius,
          width: radius,
          decoration: BoxDecoration(
            color: Colors.pink,
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
          child: Container(
            alignment: Alignment.bottomRight,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onTap,
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: LightTheme.lightGreen,
                child: CircleAvatar(
                  radius: 16 - 1,
                  backgroundColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.cameraRetro,
                    color: LightTheme.lightGreen,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
