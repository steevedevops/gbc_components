import 'package:flutter/material.dart';
import 'package:gbc_components/src/utils/colors.dart';
import 'package:gbc_components/src/utils/enums.dart';

InputDecoration inputThemeDecoration(
  BuildContext context,
  {
    StatusTextField? statusTextField,
    String? hintText, 
    String? title, 
    Widget? suffixIcon, 
    Widget? prefix
}){
  return InputDecoration(
    isDense: true, 
    contentPadding: const EdgeInsets.fromLTRB(0, 7, 0, 10),
    hintText: hintText,
    suffixIcon: suffixIcon,
    labelText: title,
    prefixIcon: prefix,
    border: InputBorder.none,
    errorStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: 0,
      height: 1.3,
      color: AppDefaultColor.ti03Color
    ),
    floatingLabelStyle: TextStyle(
      color: statusTextField == StatusTextField.desabilitado ? AppDefaultColor.ti04Color :
      statusTextField != StatusTextField.valided ? AppDefaultColor.erroColor : AppDefaultColor.ti00Color
    ),
    labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: AppDefaultColor.ti02Color
    ),
    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: AppDefaultColor.ti02Color
    )
  );
}