import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

mixin Message {
  void showMessage(String msg, context,
      {int duration = Toast.lengthLong, int gravity = Toast.center}) {
    ToastContext().init(context);
    Toast.show(
      msg,
      duration: duration,
      gravity: gravity,
      backgroundColor: Colors.orangeAccent,
      backgroundRadius: 3.0,
      textStyle: const TextStyle(fontSize: 15, color: Colors.black),
    );
  }
}
