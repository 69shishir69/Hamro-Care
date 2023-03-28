import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

void displaySuccessMessage(BuildContext context, String msg) {
  MotionToast.success(
    enableAnimation: true,
    description: Text(msg),
    toastDuration: const Duration(seconds: 1),
  ).show(context);
}

void displayErrorMessage(BuildContext context, String msg) {
  MotionToast.error(
    enableAnimation: true,
    description: Text(msg),
    toastDuration: const Duration(seconds: 1),
  ).show(context);
}
