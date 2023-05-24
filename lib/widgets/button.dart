import 'package:flutter/material.dart';

class UIButton extends StatelessWidget {
  final VoidCallback? onPressed;
  double? width;
  double elevation;
  String title;
  FontWeight titleFontWeight;
  double? fontSize;
  bool smallButton;
  bool disableButton;
  Color buttonBgColor;
  UIButton({
    required this.onPressed,
    this.width,
    this.elevation = 2,
    required this.title,
    required this.buttonBgColor,
    this.fontSize,
    this.smallButton = false,
    this.disableButton = false,
    this.titleFontWeight = FontWeight.bold,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ??
          MediaQuery.of(context).size.width * (smallButton ? 0.4 : 0.9),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBgColor,
          elevation: disableButton ? 0 : elevation,
        ),
        onPressed: disableButton ? () {} : onPressed,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
