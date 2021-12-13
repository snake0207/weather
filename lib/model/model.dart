import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Model {
  int? aqi;
  Widget getIcon({int? aqi}) {
    switch (aqi) {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        return SvgPicture.asset(
          'assets/aqi_$aqi.svg',
          color: Colors.yellow,
          width: 30.0,
          height: 30.0,
        );
      default:
        return SvgPicture.asset(
          'assets/aqi_empty.svg',
          color: Colors.red,
          width: 30.0,
          height: 30.0,
        );
    }
  }
}
