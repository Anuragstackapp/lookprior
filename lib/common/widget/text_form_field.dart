import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? lable;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final String? hintText;
  final Border? border;

  const AppTextField(
      {super.key,
        this.lable,
        this.textInputType,
        this.prefixIcon,
        this.textEditingController,
        this.hintText, this.border
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        keyboardType: textInputType,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon:prefixIcon ,
          contentPadding: EdgeInsets.only(top: 5.5),

          border: OutlineInputBorder(
            borderSide:
            const BorderSide(width: 1, color: Colors.grey,),
            borderRadius: BorderRadius.circular(10),

          ),
        ),
      ),
    );
  }
}