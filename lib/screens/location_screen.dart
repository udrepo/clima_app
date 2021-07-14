import 'package:clima_app/screens/city_screen.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen(this.locationWeather);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  num temperature;
  String weatherIcon;
  String weatherMessage;
  String cityName;
  num feelsLike;
  num windSpeed;
  num humidity;

  TextStyle setTemperatureStyle() {
    if (temperature > 30) return kTempTextStyle40;
    if (temperature > 20) return kTempTextStyle30;
    if (temperature > 10) return kTempTextStyle20;
    if (temperature > -5) return kTempTextStyle10;
    return kTempTextStyleMin5;
  }

  void updateUI(weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = '';
        weatherMessage = 'Turn on location!';
        cityName = '';
        return;
      }
      temperature = weatherData['main']['temp'].toInt();
      feelsLike = weatherData['main']['feels_like'].toInt();
      windSpeed = weatherData['wind']['speed'].toInt();
      humidity = weatherData['main']['humidity'].toInt();
      weatherIcon =
          weatherModel.getWeatherIcon(weatherData['weather'][0]['id']);
      cityName = weatherData['name'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
    print(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      print('it is relocation button');
                      var weatherData = await weatherModel.getLocationData();
                      updateUI(weatherData);
                    },
                    child:  IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.locationArrow,
                          size: 30,
                        ),
                        onPressed: null)
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      print(typedName);
                      if (typedName != null) {
                        var weatherData =
                            await weatherModel.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child:  IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.search,
                          size: 40,
                        ),
                        onPressed: null)
                  ),
                ],
              ),
              Column(
                children: [

                  Text(
                    '$cityName',
                    style: setTemperatureStyle(),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: setTemperatureStyle(),
                      ),
                      Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Feels like",
                        style: kMessageTextStyle,),
                        IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(
                              FontAwesomeIcons.temperatureHigh,
                              size: 40,
                            ),
                            onPressed: () {
                              print("Pressed");
                            }),
                        Text('$feelsLike°', style: kMessageTextStyle,)
                      ],
                    ),
                    Column(
                      children: [
                        Text("Wind speed", style: kMessageTextStyle,),
                        IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(
                              FontAwesomeIcons.wind,
                              size: 40,
                            ),
                            onPressed: () {
                              print("Pressed");
                            }),
                        Text('$windSpeed m/s', style: kMessageTextStyle,)
                      ],
                    ),
                    Column(
                      children: [
                        Text("Humidity", style: kMessageTextStyle,),
                        IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.water,
                              size: 40,
                            ),
                            onPressed: () {
                              print("Pressed");
                            }),
                        Text('$humidity%', style: kMessageTextStyle,)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
