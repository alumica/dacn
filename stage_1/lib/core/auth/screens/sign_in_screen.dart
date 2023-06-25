import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/routes/routes.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/core/auth/provider/sign_in_screen_model.dart';
import 'package:stage_1/widgets/stless/custom_text_field.dart';
import 'package:stage_1/widgets/stless/error_box.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';
import 'package:stage_1/widgets/stless/progress_hub.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<SignInScreenModel>(
        create: (_) => SignInScreenModel(),
        builder: (context, child) {
          return Consumer<SignInScreenModel>(builder: (context, model, child) {
            Future.delayed(Duration.zero, () {
              if (model.isLoginSuccess != null) {
                if (model.isLoginSuccess!) {
                  Navigator.pushReplacementNamed(context, Routes.rootScreen);
                } else {
                  showErrorPopUp(
                      context, model, size, 'Thông tin không chính xác');
                }
              }
            });
            return ProgressHUD(
              inAsyncCall: model.isLoading,
              child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                  ),
                  body: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: size.height / 24,
                          child: const Text(
                            AppConstants.signIn,
                            style: CustomTextStyle.heading1,
                          ),
                        ),
                        SizedBox(
                          height: size.height / 24,
                          child: Row(
                            children: [
                              const Text(
                                AppConstants.dontHaveAccount,
                                style: CustomTextStyle.heading3,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context, Routes.signUpScreen);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Scaffold(
                                        body: SafeArea(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              'Chức năng bị giới hạn',
                                              style: CustomTextStyle.heading2,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              'Vui lòng liên hệ trực tiếp tại:',
                                              style: CustomTextStyle.heading2,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              'it@dlu.edu.vn',
                                              style:
                                                  CustomTextStyle.heading2Green,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              '(+84)263.3552540',
                                              style:
                                                  CustomTextStyle.heading2Green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                                  }));
                                },
                                child: const Text(
                                  AppConstants.signUp,
                                  style: CustomTextStyle.heading3Green,
                                ),
                              )
                            ],
                          ),
                        ),
                        blank(),
                        CustomInputField(
                          content: AppConstants.phoneNumber,
                          description: AppConstants.enterPhoneNumber,
                          size: size,
                          keyboardType: TextInputType.number,
                          controller: model.username,
                        ),
                        blank(),
                        CustomInputField(
                          content: AppConstants.password,
                          description: AppConstants.enterPassword,
                          size: size,
                          isObsecure: true,
                          controller: model.password,
                        ),
                        SizedBox(
                          height: size.height / 16,
                        ),
                        GradientButton(
                          content: AppConstants.signIn,
                          size: size,
                          onTap: () async {
                            model.checkInput();
                            if (!model.isError) {
                              try {
                                await model.signInDio();
                                Navigator.pushNamed(context, Routes.rootScreen);
                              } catch (e) {
                                showErrorPopUp(
                                    context, model, size, "Đăng nhập thất bại");
                              }
                            } else {
                              showErrorPopUp(
                                  context, model, size, model.errorMessage);
                            }
                          },
                        ),
                      ],
                    ),
                  )),
            );
          });
        });
  }

  SizedBox blank() {
    return const SizedBox(
      height: AppConstants.primaryPadding,
    );
  }

  void showErrorPopUp(
      context, SignInScreenModel model, Size size, String error) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Center(
        child: ErrorBox(
            size: size,
            errorMessage: error,
            close: () {
              model.setLoginStatus(null);
            }),
      ),
    );
  }
}
