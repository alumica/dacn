import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage_1/widgets/stless/farm_product_box.dart';
import 'package:stage_1/widgets/stless/number_box.dart';
import 'package:stage_1/widgets/stless/profile_avatar.dart';
import 'package:stage_1/widgets/stless/profile_avatar_box.dart';
import 'package:stage_1/widgets/stless/profile_list_tile.dart';
import 'package:stage_1/widgets/stless/settings_list_tile.dart';
import 'package:stage_1/widgets/stless/statistic_list_tile.dart';
import 'package:stage_1/widgets/stless/error_box.dart';

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ErrorBox(
                  size: size,
                  errorMessage: 'Just Error',
                ),
                const Text('Home'),
                const NumberBox(
                  title: 'Sản lượng dự kiến',
                  value: '8 tấn',
                ),
                const FarmProductBox(
                  title: 'Cải thìa',
                  time: '2 tháng tới',
                ),
                const Text('Profile'),
                const ProfileAvatarBox(),
                const ProfileListTile(
                  icon: FontAwesomeIcons.cog,
                  title: 'Cài đặt',
                ),
                const Text('Update Profile'),
                ProfileAvatar(
                  radius: size.height / 6,
                ),
                const Text('Statistics'),
                const StatisticListTile(
                  title: 'Tổng cái gì đó',
                  trailing: '8 tấn',
                ),
                const Text('Farm Details'),
                // SeedSownListTile(
                //   title: 'Cải thảo',
                //   date: DateTimeHelper.getDate(DateTime.now(),
                //       format: 'dd-MM-yyyy'),
                // ),
                const Text('Settings'),
                const SettingsListTile(
                  icon: FontAwesomeIcons.bell,
                  title: 'Thông báo',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
