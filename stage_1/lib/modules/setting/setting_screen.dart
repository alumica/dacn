import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/settings_list_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cài đặt',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: const [
              SettingsListTile(
                icon: FontAwesomeIcons.bell,
                title: 'Thông báo',
              ),
              SettingsListTile(
                icon: FontAwesomeIcons.infoCircle,
                title: 'Giới thiệu ứng dụng',
              ),
              SettingsListTile(
                icon: Icons.handyman,
                title: 'Phiên bản',
              ),
              SettingsListTile(
                icon: Icons.library_books,
                title: 'Chính sách bảo mật',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
