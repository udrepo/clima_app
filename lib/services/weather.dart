import 'file:///C:/Users/User/flutter/projects/clima_app/lib/constants.dart';
import 'location.dart';

import 'networking.dart';

class WeatherModel {

  Future getCityWeather(String cityName) async{
    Networking networking = Networking('$siteAddress?q=$cityName&appid=$apiKey&units=metric');
    return await networking.getWeatherData();
  }


  Future getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation();
    Networking networking = Networking('$siteAddress?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    return await networking.getWeatherData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}
