import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

Map<String, double> heightWidthRelativePercentage(
  {
    required context,
    double widthVal = 0,
    double heightVal = 0
  }
){

  // Timer(Duration(seconds: 0), () {

  /// generating matching percentage for specified width and height

  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;

  print("${widthVal}px/deviceWidthInPx: "
      "${((widthVal/deviceWidth) * 100).toStringAsFixed(2)}%");
  print("${heightVal}px/deviceHeightInPx: ${
      ((heightVal/deviceHeight) * 100).toStringAsFixed(2)}%");

  // });

  return {
      "width": widthVal/deviceWidth,
      "height": heightVal/deviceHeight
  };

}