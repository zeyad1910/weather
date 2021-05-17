import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const String kApiKey = '61a9d6538f4135af8ed58e72065bb572';
const String kOpenWeatherMap =
    'https://api.openweathermap.org/data/2.5/weather';
const kInputDecorationTextField = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
);
