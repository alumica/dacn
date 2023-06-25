import 'package:flutter/cupertino.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/shared/helper/datetime_helper.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    Key? key,
    required this.value,
    required this.setValue,
    required this.hintText,
    required this.title,
  }) : super(key: key);

  final String value;
  final Function setValue;
  final String hintText;
  final String title;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextStyle.heading2,
        ),
        GestureDetector(
          onTap: () {
            setValue(
                DateTimeHelper.getDate(DateTime.now(), format: 'dd-MM-yyyy'));
            showCustomDatePicker(context, onDateTimeChanged: (value) {
              setValue(DateTimeHelper.getDate(value, format: 'dd-MM-yyyy'));
            });
          },
          child: Container(
            height: size.height / 24,
            width: (size.width - 48),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: LightTheme.grey,
                width: 2,
              )),
            ),
            child: Text(value == '' ? hintText : value.toString(),
                style: value == ''
                    ? CustomTextStyle.heading4Grey
                    : CustomTextStyle.heading4),
          ),
        )
      ],
    );
  }
}

void showCustomDatePicker(
  context, {
  required Function(DateTime) onDateTimeChanged,
}) {
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
                onDateTimeChanged: onDateTimeChanged,
              ),
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
