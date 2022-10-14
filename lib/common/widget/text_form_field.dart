import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final String? lable;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final String? hintText;
  final String? errorText;
  final FormFieldValidator? validator;
  final Border? border;

  const AppTextField(
      {super.key,
        this.lable,
        this.textInputType,
        this.prefixIcon,
        this.textEditingController,
        this.hintText,
        this.errorText,
        this.validator,
        this.border
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        validator: validator,
        keyboardType: textInputType,
        controller: textEditingController,
        decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          hintText: hintText,
          prefixIcon:prefixIcon ,
          errorText: errorText,
          contentPadding: EdgeInsets.only(top: 5.5),

          border: OutlineInputBorder(
            borderSide:
            const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10),

          ),
        ),
      ),
    );
  }
}