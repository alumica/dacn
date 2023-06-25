import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/constants/app_enums.dart';
import 'package:stage_1/core/auth/provider/sign_up_screen_model.dart';
import 'package:stage_1/widgets/stless/custom_text_field.dart';
import 'package:stage_1/widgets/stless/error_box.dart';
import 'package:stage_1/widgets/stless/gradient_button.dart';
import 'package:stage_1/widgets/stless/progress_hub.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<Widget> genders = const [
    Text('Nam'),
    Text('Nữ'),
  ];
  List<Widget> gdp = const [];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<SignUpScreenModel>(
      create: (_) => SignUpScreenModel(),
      builder: (context, child) {
        return Consumer<SignUpScreenModel>(builder: (context, model, child) {
          Future.delayed(Duration.zero, () {
            if (model.isSignUpSuccess != null) {
              if (model.isSignUpSuccess == true) {
                // Navigator.pushNamed(context, Routes.onboardingScreen);
                showWarningPopUp(context, model, size, 'Đăng ký thành công');
              } else {
                showWarningPopUp(
                    context, model, size, 'Vui lòng nhập đẩy đủ thông tin');
              }
            }
          });

          return ProgressHUD(
            inAsyncCall: model.isLoading,
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    model.currentIndex == 1
                        ? Navigator.pop(context)
                        : model.previousStep();
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.primaryPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getChild(size, context, model),
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }

  List<Widget> getChild(
      Size size, BuildContext context, SignUpScreenModel model) {
    List<Widget> stepsWidget = [];
    switch (model.currentIndex) {
      case 1:
        stepsWidget = step1(size, context, model);
        break;
      case 2:
        stepsWidget = step2(size, context, model);
        break;
      case 3:
        stepsWidget = step3(size, context, model);
        break;
      default:
    }

    stepsWidget.add(GradientButton(
      content:
          model.currentIndex == 3 ? AppConstants.signUp : AppConstants.next,
      size: size,
      onTap: () {
        model.realtimeCheck();
        if (model.isError) {
          showWarningPopUp(context, model, size, model.errorMessage);
        } else {
          model.currentIndex == 3 ? model.signUpDio() : model.nextStep();

          if (model.isSignUpSuccess == false) {
            showWarningPopUp(context, model, size, "Đăng ký không thành công");
          }
        }
        // Navigator.pushNamed(context, Routes.signInScreen);
      },
    ));
    return stepsWidget;
  }

  List<Widget> step1(Size size, BuildContext context, SignUpScreenModel model) {
    return <Widget>[
      SizedBox(
        height: size.height / 24,
        child: const Text(
          AppConstants.signUp,
          style: CustomTextStyle.heading1,
        ),
      ),
      SizedBox(
        height: size.height / 24,
        child: Row(
          children: [
            const Text(
              AppConstants.alreadyHave,
              style: CustomTextStyle.heading3,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                AppConstants.signIn,
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
        controller: model.phoneNumber,
        hasLimit: true,
      ),
      blank(),
      CustomInputField(
        content: AppConstants.password,
        description: AppConstants.registerPassword,
        size: size,
        isObsecure: true,
        controller: model.password,
      ),
      blank(),
      CustomInputField(
        content: AppConstants.confirmPassword,
        description: AppConstants.confirmPassword,
        size: size,
        isObsecure: true,
        controller: model.confirmPassword,
      ),
      SizedBox(
        height: size.height / 16,
      ),
    ];
  }

  List<Widget> step2(Size size, BuildContext context, SignUpScreenModel model) {
    return <Widget>[
      CustomInputField(
        content: AppConstants.firstName,
        description: AppConstants.enterFirstName,
        size: size,
        controller: model.firstName,
        onChange: (_) {
          model.realtimeCheck();
        },
      ),
      blank(),
      CustomInputField(
        content: AppConstants.lastName,
        description: AppConstants.enterLastName,
        size: size,
        controller: model.lastName,
      ),
      blank(),
      CustomInputField(
        content: AppConstants.cicNumber,
        description: AppConstants.enterCicNumber,
        size: size,
        controller: model.cicNumber,
      ),
      blank(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppConstants.gender,
                style: CustomTextStyle.heading3,
              ),
              GestureDetector(
                onTap: () {
                  showGenderPicker(context, model, size);
                },
                child: Container(
                    height: size.height / 24,
                    width: (size.width - 72) / 2,
                    alignment: Alignment.centerLeft,
                    decoration: selectDecoration(),
                    child: Text(
                      model.gender == Gender.male ? 'Nam' : 'Nữ',
                    )),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppConstants.dob,
                style: CustomTextStyle.heading3,
              ),
              GestureDetector(
                onTap: () {
                  showDatePicker(context, model);
                },
                child: Container(
                  height: size.height / 24,
                  width: (size.width - 72) / 2,
                  alignment: Alignment.centerLeft,
                  decoration: selectDecoration(),
                  child: Text(
                      model.dob == ''
                          ? AppConstants.enterDOB
                          : model.dob.toString(),
                      style: model.dob == ''
                          ? CustomTextStyle.heading4Grey
                          : CustomTextStyle.heading4),
                ),
              ),
            ],
          )
        ],
      ),
      blank(),
      const Text(
        AppConstants.gdp,
        style: CustomTextStyle.heading3,
      ),
      GestureDetector(
        onTap: () {
          showGdpPicker(model);
        },
        child: Container(
            height: size.height / 24,
            alignment: Alignment.centerLeft,
            decoration: selectDecoration(),
            child: Text(model.gdp == null ? AppConstants.gdp : model.gdp!)),
      ),
      SizedBox(
        height: size.height / 16,
      ),
    ];
  }

  List<Widget> step3(Size size, BuildContext context, SignUpScreenModel model) {
    return <Widget>[
      const Text(
        AppConstants.province,
        style: CustomTextStyle.heading3,
      ),
      GestureDetector(
        onTap: () {
          showAddressPicker(context, size, model, AddressLevel.province, null,
              model.provinces);
        },
        child: Container(
            height: size.height / 24,
            alignment: Alignment.centerLeft,
            decoration: selectDecoration(),
            child: Text(
                model.province == null
                    ? AppConstants.enterProvince
                    : model.province!.name,
                style: model.province == null
                    ? CustomTextStyle.heading4Grey
                    : CustomTextStyle.heading4)),
      ),
      blank(),
      const Text(
        AppConstants.district,
        style: CustomTextStyle.heading3,
      ),
      GestureDetector(
        onTap: () {
          if (model.province != null) {
            showAddressPicker(context, size, model, AddressLevel.district,
                model.province!.code, model.districts);
          } else {
            showWarningPopUp(
                context, model, size, "Vui lòng chọn tỉnh/thành phố");
          }
        },
        child: Container(
            height: size.height / 24,
            alignment: Alignment.centerLeft,
            decoration: selectDecoration(),
            child: Text(
                model.district == null
                    ? AppConstants.enterDistrict
                    : model.district!.name,
                style: model.district == null
                    ? CustomTextStyle.heading4Grey
                    : CustomTextStyle.heading4)),
      ),
      blank(),
      const Text(
        AppConstants.ward,
        style: CustomTextStyle.heading3,
      ),
      GestureDetector(
        onTap: () {
          if (model.district != null) {
            showAddressPicker(context, size, model, AddressLevel.ward,
                model.district!.code, model.wards);
          } else {
            showWarningPopUp(context, model, size, "Vui lòng chọn quận/ huyện");
          }
        },
        child: Container(
            height: size.height / 24,
            alignment: Alignment.centerLeft,
            decoration: selectDecoration(),
            child: Text(
                model.ward == null ? AppConstants.enterWard : model.ward!.name,
                style: model.ward == null
                    ? CustomTextStyle.heading4Grey
                    : CustomTextStyle.heading4)),
      ),
      blank(),
      CustomInputField(
        content: AppConstants.enterAddress,
        description: AppConstants.enterAddress,
        size: size,
        controller: model.street,
        onChange: (_) {
          model.realtimeCheck();
        },
      ),
      SizedBox(
        height: size.height / 16,
      ),
    ];
  }

  void showGenderPicker(context, SignUpScreenModel model, Size size) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Center(
        child: Container(
          margin: const EdgeInsets.all(AppConstants.primaryPadding),
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: LightTheme.white,
          ),
          child: Column(
            children: [
              SizedBox(
                  height: 180,
                  child: CupertinoPicker(
                    onSelectedItemChanged: (value) {
                      setState(() {
                        model.setGender(value);
                      });
                    },
                    itemExtent: 32.0,
                    children: genders,
                  )),
              // Close the modal
              CupertinoButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showDatePicker(context, SignUpScreenModel model) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: LightTheme.white,
          ),
          height: 460,
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    dateOrder: DatePickerDateOrder.dmy,
                    onDateTimeChanged: (val) {
                      setState(() {
                        model.setDOB(DateFormat('dd-MM-yyyy').format(val));
                      });
                    }),
              ),
              // Close the modal
              CupertinoButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showGdpPicker(SignUpScreenModel model) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Thu nhập bình quân'),
        message: const Text('Trung bình mỗi tháng bạn thu về bao nhiêu?'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: const Text('Dưới 10 triệu'),
            onPressed: () {
              model.setGDP('Dưới 10 triệu');
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('10 đến 20 triệu'),
            onPressed: () {
              model.setGDP('10 đến 20 triệu');
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Trên 20 triệu'),
            onPressed: () {
              model.setGDP('10 đến 20 triệu');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  SizedBox blank() {
    return const SizedBox(
      height: AppConstants.primaryPadding,
    );
  }

  BoxDecoration selectDecoration() {
    return const BoxDecoration(
      border: Border(
          bottom: BorderSide(
        color: LightTheme.grey,
        width: 2,
      )),
    );
  }

  void showWarningPopUp(
      context, SignUpScreenModel model, Size size, String error) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Center(
        child: ErrorBox(
            goSignIn: model.isSignUpSuccess,
            size: size,
            errorMessage: error,
            close: () {
              model.setSignUpStatus(null);
            }),
      ),
    );
  }

  void showAddressPicker(context, Size size, SignUpScreenModel model,
      AddressLevel lv, int? code, List<dynamic> listAddress) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Material(
        child: Container(
          padding: const EdgeInsets.only(left: 24),
          height: size.height - 88,
          width: size.width,
          child: ListView.builder(
            itemCount: listAddress.length,
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap: () {
                  model.setAddressData(lv: lv, value: listAddress[index]);
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: Text(
                    listAddress[index].name,
                    style: CustomTextStyle.heading4,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
