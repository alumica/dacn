import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/modules/profile/show_profile_screen_model.dart';
import 'package:stage_1/widgets/stless/custom_text_field.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';

class ShowProfileScreen extends StatefulWidget {
  const ShowProfileScreen({Key? key}) : super(key: key);

  @override
  State<ShowProfileScreen> createState() => _ShowProfileScreenState();
}

class _ShowProfileScreenState extends State<ShowProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ShowProfileScreenModel>(
      create: (_) => ShowProfileScreenModel(),
      builder: (context, child) {
        return Consumer<ShowProfileScreenModel>(
            builder: (context, model, child) {
          model.initInfo();
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                model.readMode == true
                    ? "Thông tin cá nhân"
                    : "Cập nhật thông tin",
                style: CustomTextStyle.heading1BlackBold,
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              actions: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.userEdit),
                  onPressed: () {
                    model.setReadMode(false);
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    CustomInputField(
                      content: AppConstants.firstName,
                      description: AppConstants.enterFirstName,
                      size: size,
                      controller: model.firstName,
                      readOnly: model.readMode,
                    ),
                    blank(),
                    CustomInputField(
                      content: AppConstants.lastName,
                      description: AppConstants.enterLastName,
                      size: size,
                      controller: model.lastName,
                      readOnly: model.readMode,
                    ),
                    blank(),
                    CustomInputField(
                      content: AppConstants.phoneNumber,
                      description: AppConstants.enterPhoneNumber,
                      size: size,
                      keyboardType: TextInputType.number,
                      controller: model.phoneNumber,
                      hasLimit: true,
                      readOnly: model.readMode,
                    ),
                    blank(),
                    CustomInputField(
                      content: AppConstants.cicNumber,
                      description: AppConstants.enterCicNumber,
                      size: size,
                      controller: model.cicNumber,
                      readOnly: model.readMode,
                    ),
                    blank(),
                    model.readMode == false
                        ? GradientButton(
                            content: AppConstants.update,
                            size: size,
                            onTap: () {
                              model.updateInfo();
                            },
                          )
                        : Container(),
                    blank()
                    // Container(
                    //   color: LightTheme.grey,
                    //   height: 100,
                    //   width: 100,
                    //   alignment: Alignment.center,
                    //   child: Text(
                    //     model.readMode ? "ReadMode" : "Edit mode",
                    //     style: CustomTextStyle.heading3BlackBold,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  SizedBox blank() {
    return const SizedBox(
      height: AppConstants.primaryPadding,
    );
  }
}
