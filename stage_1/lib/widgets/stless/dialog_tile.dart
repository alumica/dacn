import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/themes.dart';

class DialogTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;

  const DialogTile({ 
    Key? key , 
    required this.icon,
    required this.title,
    this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Icon(
            icon,
            color: LightTheme.lightGreen,
          ),
          title: Text(title),
          tileColor: LightTheme.white,
        ),
      ),
      );
  }
}