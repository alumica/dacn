import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/models/user.dart';

class ProfileAvatarBox extends StatelessWidget {
  const ProfileAvatarBox({
    Key? key,
    this.onPressed,
    this.user,
  }) : super(key: key);

  final Function()? onPressed;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: LightTheme.darkGreen),
        ),
        color: Colors.white,
      ),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30,
          backgroundColor: LightTheme.lightGreen,
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.leaf,
            ),
          ),
        ),
        title: Text(
          '${user?.lastName ?? 'Undefined'} ${user?.firstName ?? 'Undefined'}',
          style: CustomTextStyle.heading3.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
