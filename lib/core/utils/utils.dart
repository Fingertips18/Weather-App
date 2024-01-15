import 'package:flutter/material.dart';

import 'package:weather_app/core/constants/assets.dart';

Widget getWeatherImage(int code) {
  switch (code) {
    case >= 200 && < 300:
      return Image.asset(kImg1);
    case >= 300 && < 400:
      return Image.asset(kImg2);
    case >= 500 && < 600:
      return Image.asset(kImg3);
    case >= 600 && < 700:
      return Image.asset(kImg4);
    case >= 700 && < 800:
      return Image.asset(kImg5);
    case == 800:
      return Image.asset(kImg6);
    case > 800 && <= 804:
      return Image.asset(kImg7);
    default:
      return Image.asset(kImg7);
  }
}
