import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/constant/string_const.dart';

Widget divderrow() {
  return Row(
    children: const [
      SizedBox(
        width: 145,
        child: Divider(
          color: Colors.grey,
        ),
      ),
      Text(
        'Or',
        style: TextStyle(color: Colors.grey),
      ),
      SizedBox(
        width: 139,
        child: Divider(
          color: Colors.grey,
        ),
      ),
    ],
  );
}