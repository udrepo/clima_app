import 'package:flutter/material.dart';

const apiKey = '';
const siteAddress = 'https://api.openweathermap.org/data/2.5/weather';

const kTempTextStyleMin5 = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60,
  color: Color(0xff636154),
);

const kTempTextStyle10 = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60,
  color: Color(0xff6ac6f9),
);
const kTempTextStyle20 = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60,
  color: Color(0xfffbed63),
);
const kTempTextStyle30 = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60,
  color: Color(0xffffb748),
);
const kTempTextStyle40 = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60,
  color: Color(0xfff0341f),
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 20,
);

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Spartan MB',
  backgroundColor: Colors.red
);

const kConditionTextStyle = TextStyle(
  fontSize: 60,
);

const inputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_pin, size: 40,
    color: Colors.redAccent,),
  hintText: 'Enter a city name',
  hintStyle: TextStyle(
      color: Colors.redAccent
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none
  ),

);