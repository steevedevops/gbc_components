import 'package:flutter/material.dart';
import 'package:gbc_components/gbc_components.dart';
import 'package:toastification/toastification.dart';

void dialogToastMessage(
  BuildContext context,{
    required String message,
    DialogColorType dialogColorType = DialogColorType.DEFAULT,
    int duration = 4,
  }){
    toastification.show(
      context: context,
      type: dialogColorType == DialogColorType.SUCESS ? ToastificationType.success : dialogColorType == DialogColorType.WARNING ? ToastificationType.warning : ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(5.0),
      boxShadow: highModeShadow,
      showProgressBar: true,
    );
}

defineBgColorDialog(DialogColorType type){
  switch (type) {
    case DialogColorType.DANGER:
      return Colors.red[50];
    case DialogColorType.INFO:
      return Colors.blue[50];
    case DialogColorType.WARNING:
      return Colors.orange[50];
    default:
      return Colors.green[50];
  }
}
Color defineColorDialog(DialogColorType type){
  switch (type) {
    case DialogColorType.DANGER:
      return AppDefaultColor.erroColor;
    case DialogColorType.INFO:
      return AppDefaultColor.infoColor;
    case DialogColorType.WARNING:
      return AppDefaultColor.warningColor;
    default:
      return AppDefaultColor.sucessColor;
  }
}


IconData defineIconDialog(DialogColorType type){
  switch (type) {
    case DialogColorType.DANGER:
      return Icons.error_outline;
    case DialogColorType.INFO:
      return Icons.info_outlined;
    case DialogColorType.WARNING:
      return Icons.warning_amber_rounded;
    default:
      return Icons.check_circle_outline_rounded;
  }
}