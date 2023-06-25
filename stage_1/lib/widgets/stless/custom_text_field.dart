import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stage_1/config/themes/text_theme.dart';

class CustomInputField extends StatelessWidget {
  final String content;
  final String? description;
  final Size size;
  final bool? isObsecure;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Function(String)? onChange;
  final TextStyle style;
  final bool? hasLimit;
  final bool readOnly;
  final String? Function(String?)? validator;
  const CustomInputField({
    Key? key,
    required this.content,
    this.description,
    required this.size,
    this.isObsecure,
    this.keyboardType,
    this.onChange,
    required this.controller,
    this.hasLimit,
    this.validator,
    this.style = CustomTextStyle.heading2,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          content,
          style: style,
        ),
        TextFormField(
          validator: validator,
          readOnly: readOnly,
          onChanged: onChange,
          keyboardType: keyboardType,
          controller: controller,
          obscureText: isObsecure == null ? false : true,
          inputFormatters: hasLimit == null
              ? null
              : [
                  LengthLimitingTextInputFormatter(10),
                ],
          decoration: InputDecoration(
            hintText: description,
            hintStyle: CustomTextStyle.heading4Grey,
          ),
        ),
        // decoration: const BoxDecoration(
        //   // color: Colors.red,
        //   border: Border(
        //     bottom: BorderSide(color: LightTheme.grey, width: 2),
        //   ),
        // ),
        // )
      ],
    );
  }
}
