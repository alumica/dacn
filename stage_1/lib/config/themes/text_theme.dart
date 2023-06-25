import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/themes.dart';

class CustomTextStyle {
  static const TextStyle heading1 =
      TextStyle(fontSize: 24, color: Colors.black);
  static const TextStyle heading1BlackBold =
      TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w600);
  static const TextStyle heading1Green =
      TextStyle(fontSize: 24, color: LightTheme.darkGreen);
  static const TextStyle heading1GreenBold = TextStyle(
      fontSize: 24, color: LightTheme.darkGreen, fontWeight: FontWeight.w600);

  static const TextStyle heading2 =
      TextStyle(fontSize: 20, color: Colors.black);
  static const TextStyle heading2Green =
      TextStyle(fontSize: 20, color: LightTheme.darkGreen);
  static const TextStyle heading2BlackBold =
      TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
  static const TextStyle heading2Grey = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w300, color: LightTheme.greyText);

  static const TextStyle heading3White = TextStyle(
      fontSize: 16, color: LightTheme.white, fontWeight: FontWeight.w300);
  static const TextStyle heading3BlackBold =
      TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600);
  static const TextStyle heading3GreenBold = TextStyle(
      fontSize: 16, color: LightTheme.darkGreen, fontWeight: FontWeight.bold);
  static const TextStyle heading3Green = TextStyle(
      fontSize: 16, color: LightTheme.darkGreen, fontWeight: FontWeight.w300);
  static const TextStyle heading3 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Colors.black,
      decoration: TextDecoration.none);
  static const TextStyle heading3Grey = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: LightTheme.greyText,
      decoration: TextDecoration.none);
  static const TextStyle heading4 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w300, color: LightTheme.black);
  static const TextStyle heading4Grey =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey);

  CustomTextStyle(String s);
}
