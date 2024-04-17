import 'package:fluttertoast/fluttertoast.dart';

import '../utils/colors.dart';

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorTheme.backgroundColor,
      textColor: ColorTheme.textColor);
}
