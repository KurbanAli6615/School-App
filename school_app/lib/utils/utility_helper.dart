import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilityHelper {
  static void showLog(String value) {
    log(value);
  }

  static void showToast({required String message, bool isBottom = true}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: isBottom ? ToastGravity.BOTTOM : ToastGravity.TOP,
      backgroundColor: Colors.black.withOpacity(0.7),
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}
