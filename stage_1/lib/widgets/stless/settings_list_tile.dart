import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/themes.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          tileColor: onTap == null ? Colors.grey[300] : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          leading: Icon(
            icon,
            color: onTap == null ? Colors.grey : LightTheme.lightGreen,
          ),
          title: Text(title),
        ),
      ),
    );
  }
}
