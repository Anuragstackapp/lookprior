import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    this.borderRadius = 5,
    this.textSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 44,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: Text(
          text!,
          style: GoogleFonts.poppins(
                fontSize: textSize,
                color: textColor,
                fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}