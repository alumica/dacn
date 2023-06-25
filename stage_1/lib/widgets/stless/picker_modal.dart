import 'package:flutter/cupertino.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';

class PickupModal extends StatelessWidget {
  const PickupModal(
      {Key? key,
      required this.selectedValue,
      required this.values,
      this.onSelectedItemChanged})
      : super(key: key);

  final int selectedValue;
  final List<Widget> values;
  final Function(int)? onSelectedItemChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(AppConstants.primaryPadding),
        height: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: LightTheme.white,
        ),
        child: Column(
          children: [
            SizedBox(
                height: 160,
                child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: selectedValue),
                  onSelectedItemChanged: onSelectedItemChanged,
                  itemExtent: 32.0,
                  children: values,
                )),
            // Close the modal
            CupertinoButton(
              child: const Text(
                'Xác nhận',
                style: CustomTextStyle.heading2Green,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}
