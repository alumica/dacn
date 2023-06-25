import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';

import '../home_page_model.dart';

class GreetingWidget extends StatefulWidget {
  const GreetingWidget({Key? key, required this.model}) : super(key: key);
  final HomePageProvider model;
  @override
  State<GreetingWidget> createState() => _GreetingWidgetState();
}

class _GreetingWidgetState extends State<GreetingWidget> {
  late HomePageProvider _model;
  @override
  void initState() {
    super.initState();
    _model = widget.model;
    _model.getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Xin chào 👋',
                  style: CustomTextStyle.heading1Green.copyWith(fontSize: 20)),
              Text(_model.userName!,
                  style:
                      CustomTextStyle.heading1GreenBold.copyWith(fontSize: 28)),
            ],
          ),
          const CircleAvatar(
            radius: 30,
            backgroundImage:
                NetworkImage('https://v.upanh.tv/2021/11/30/download.jpg'),
          ),
        ],
      ),
    );
  }
}
