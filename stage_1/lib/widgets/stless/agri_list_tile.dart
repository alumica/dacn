import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgriListTile extends StatelessWidget {
  final String agriData;
  const AgriListTile({ Key? key, required this.agriData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        child: CupertinoContextMenu(
          // child: ListTile(
          //   title: Text(agriData),
          // ),
          child: SizedBox(
            height: 50,
            child: Text(agriData)),
          actions: [
            CupertinoContextMenuAction(
              child: const Text('Đã thu hoạch'),
              trailingIcon: FontAwesomeIcons.calendarCheck,
              onPressed: () => Navigator.pop(context),),
            CupertinoContextMenuAction(
              child: const Text('Nhân bản'),
              trailingIcon: FontAwesomeIcons.clone,
              onPressed: () => Navigator.pop(context),),
            CupertinoContextMenuAction(
              isDestructiveAction: true,
              child: const Text('Xóa hoàn toàn'),
              trailingIcon: FontAwesomeIcons.trashAlt,
              onPressed: () => Navigator.pop(context),)
          ], 
          ),
      ),
    );
  }
  }
