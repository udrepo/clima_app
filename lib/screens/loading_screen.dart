import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);
  }

  Future<void> getWeatherData() async{
    final response = await get(
        Uri.parse('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d829e10d714a6e88b30761fae22'));
    print(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    print('hi!!');
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
