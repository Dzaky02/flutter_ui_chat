import 'package:flutter/material.dart';
import 'package:flutter_ui_chat/constants.dart';

class FillOutlineButton extends StatelessWidget {
  const FillOutlineButton({
    this.isFilled = true,
    required this.press,
    required this.text,
  });

  final bool isFilled;
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.white),
      ),
      color: isFilled ? Colors.white : Colors.transparent,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          color: isFilled ? mContentColorLightTheme : Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
