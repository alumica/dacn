import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage_1/config/themes/text_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textIconColor;
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;

  const CustomAppBar({
    Key? key,
    this.backgroundColor = Colors.white,
    this.textIconColor = Colors.black,
    this.icon,
    this.title = '',
    this.menuItem,
    this.height = kToolbarHeight,
    this.hideBack = false,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: menuItem,
      toolbarHeight: preferredSize.height,
      leading: hideBack
          ? Container()
          : IconButton(
              icon: const Icon(FontAwesomeIcons.chevronLeft, size: 24),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      title: Text(
        title!,
        style: CustomTextStyle.heading1.copyWith(fontWeight: FontWeight.normal),
      ),
      backgroundColor: backgroundColor,
      centerTitle: true,
    );
  }
}
