import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color,
      this.textColor,
      this.iconBefore,
      this.iconAfter,
      this.width,
      this.height,
      this.padding,
      this.buttonTextStyle,
      this.buttonBorderRadius,
      this.mainAxisAlignment});

  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final Icon? iconBefore;
  final Icon? iconAfter;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final TextStyle? buttonTextStyle;
  final BorderRadius? buttonBorderRadius;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(borderRadius: buttonBorderRadius, color: color),
      padding: padding ?? const EdgeInsets.all(8),
      child: Row(
          mainAxisAlignment:
              mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
          children: [
            iconBefore ?? const SizedBox(),
            Text(
              text,
              style: buttonTextStyle,
              //   textAlign: TextAlign.center,
            ),
            iconAfter ?? const SizedBox()
          ]),
    );
  }
}
