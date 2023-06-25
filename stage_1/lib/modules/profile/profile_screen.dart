import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/models/user.dart';
import 'package:stage_1/shared/helper/restart_helper.dart';

import 'package:stage_1/shared/helper/shared_refs.dart';
import 'package:stage_1/shared/provider/app_storage.dart';
import 'package:stage_1/widgets/stless/custom_appbar.dart';
import 'package:stage_1/widgets/stless/profile_list_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User user = AppStorage().user;
    final String _fullName =
        '${user.lastName ?? 'Undefined'} ${user.firstName ?? 'Undefined'}';
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppConstants.personalManagement,
        hideBack: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    _navigateAndReload(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        // backgroundColor: LightTheme.lightGreen,
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.userAlt,
                            color: LightTheme.white,
                          ),
                        ),
                      ),
                      title: Text(
                        _fullName,
                        style: CustomTextStyle.heading3
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                // ProfileListTile(
                //   icon: FontAwesomeIcons.accusoft,
                //   title: AppConstants.farmManagement,
                //   onTap: () {
                //     Navigator.pushNamed(context, 'temp');
                //   },
                // ),
                // const ProfileListTile(
                //   icon: FontAwesomeIcons.carrot,
                //   title: AppConstants.productManagement,
                // ),
                // const ProfileListTile(
                //   icon: FontAwesomeIcons.cashRegister,
                //   title: AppConstants.harvesting,
                // ),
                ProfileListTile(
                  icon: FontAwesomeIcons.addressBook,
                  title: 'Hỗ trợ: lacduong@dlu.edu.vn',
                  onTap: () {},
                ),
                ProfileListTile(
                  icon: FontAwesomeIcons.addressBook,
                  title: 'Vị trí: Lạc Dương',
                  onTap: () {},
                ),
                ProfileListTile(
                  icon: FontAwesomeIcons.signOutAlt,
                  title: 'Đăng xuất',
                  onTap: () {
                    SharedPrefs.instance.clear();
                    RestartApp.restartApp(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateAndReload(BuildContext context) async {
    final result = await Navigator.pushNamed(
      context,
      Routes.showProfileScreen,
    );

    if (result == true) {
      setState(() {});
    }
  }
}
