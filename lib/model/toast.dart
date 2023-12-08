

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message, required MaterialColor backgroundColor, required List<MaterialAccentColor> textColor}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

const finishedOnBoardingConst = 'finishedOnBoarding';
const colorPrimary = 0xFF4549BC;
const facebookButtonColor = 0xFF415893;
const facebookAppID = '285315185217069';
const usersCollection = 'User';
const eula = 'https://alxnderneurvoe.carrd.co/';
