import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

navigateWithRoute(receivecontext, route) {
  Navigator.pushAndRemoveUntil(
      receivecontext,
      PageTransition(
          duration: const Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child: route),
      (Route<dynamic> route) => true);
}
