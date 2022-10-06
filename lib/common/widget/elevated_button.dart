import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final double? width;
  final double? margin;
  final double textSize;
  final double borderRadius;

  const CommonElevatedButton({
  super.key,
    this.text,
    this.textColor,
    this.buttonColor,
    this.onPressed,
    this.width,
    this.margin,
    this.borderRadius = 9,
    this.textSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,top: 30,right: 25),
      child: Container(

        width: width ?? double.infinity,
        height: 44,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text!,
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}