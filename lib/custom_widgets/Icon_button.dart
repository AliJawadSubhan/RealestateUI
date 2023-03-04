import 'package:flutter/material.dart';
import 'package:realestateapp/utils/constants.dart';

class IconBorder extends StatelessWidget {
  const IconBorder(
      {super.key,
      required this.child,
      this.padding,
      required this.height,
      required this.width});

  final Widget child;
  final EdgeInsets? padding;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: colorGrey.withAlpha(40), width: 2),
      ),
      padding: padding ?? const EdgeInsets.all(8.0),
      child: child,
    );
  }
}
