
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComonTextButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  const ComonTextButton({super.key, this.text,this.onPressed,this.textSize,this.textColor,this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: double.infinity,
      child: TextButton(onPressed: onPressed, child: Text(text!,style: GoogleFonts.poppins(
        fontSize: textSize,
        color: textColor,
        fontWeight: fontWeight,
      ),)),
    );
  }
}
