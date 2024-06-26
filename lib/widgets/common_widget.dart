import 'package:flutter/material.dart';

import '../utils/colors.dart';

Widget textFieldWithLabel(labelText, nameText) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.all(8.0),
    child: Text("$labelText : $nameText",
        style: TextStyle(fontSize: 24, color: ColorTheme.textColor)),
  );
}
