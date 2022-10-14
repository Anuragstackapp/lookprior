import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';


Widget divderrow() {
  return Row(
    children: const [
      Expanded(
        flex: 4,
        child: Padding(
          padding: EdgeInsets.only(left: 74,top: 10),
          child: SizedBox(
            // width: 88,
            child: Divider(
              color: Colors.grey,
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Center(
            child: Text(
              'Or',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 4,
        child: Padding(
          padding: EdgeInsets.only(top: 10,right: 74),
          child: SizedBox(
            // width: 139,
            child: Divider(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    ],
  );
}

