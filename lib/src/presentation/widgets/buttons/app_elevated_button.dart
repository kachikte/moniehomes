import 'package:flutter/material.dart';
import 'package:moniehomes/src/config/config.dart';

class AppElevatedButton extends StatelessWidget {
  final double width;
  final double height;
  final Color borderColor;
  final Color backgroundColor;
  final String buttonText;
  final VoidCallback func;
  final Color textColor;
  final Widget iconWidget;

  const AppElevatedButton(
      {required this.width,
      required this.height,
      this.borderColor = const Color(0xFF041F38),
      this.backgroundColor = const Color(0xFF041F38),
      required this.buttonText,
      this.textColor = const Color(0xFFFDFEFF),
      this.iconWidget = const SizedBox(),
      required this.func});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        fixedSize: MaterialStateProperty.all<Size>(Size(width, height)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                side: BorderSide(
                  width: 1,
                  color: borderColor,
                ))),
      ),
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconWidget != const SizedBox())
            ...[
              iconWidget,
              SizedBox(width: width * .05,)
            ],
            Text(
              buttonText,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
