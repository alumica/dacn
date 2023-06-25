import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/themes.dart';

import 'loading_widget.dart';

class ProgressHUD extends StatelessWidget {
  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Animation<Color> valueColor;

  const ProgressHUD({
    Key? key,
    required this.child,
    required this.inAsyncCall,
    this.opacity = 0.5,
    this.color = Colors.grey,
    this.valueColor =
        const AlwaysStoppedAnimation<Color>(LightTheme.lightGreen),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          Scaffold(
            backgroundColor: Colors.red.withOpacity(0),
            body: const LoadingWidget(),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
