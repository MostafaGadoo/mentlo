import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mentlo/core/utils/constants/contstants.dart';

void showToast({
  @required String? msg,
  @required ToastState? state,
}) => Fluttertoast.showToast(
  msg: msg!,
  gravity: ToastGravity.BOTTOM,
  toastLength: Toast.LENGTH_LONG,
  textColor: Colors.white,
  fontSize: 16,
  timeInSecForIosWeb: 3,
  backgroundColor: chooseToastColor(state!),
);

Color chooseToastColor(ToastState state){
  Color color;
  switch(state){
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
    case ToastState.INFO:
      color = Colors.blue;
      break;
  }
  return color;
}