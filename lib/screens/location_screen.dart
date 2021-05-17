import 'package:flutter/material.dart';
import 'package:weather/screens/city_screen.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({@required this.weatherData});
  final weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String cityName;
  String weatherIcon;
  String weatherMsg;
  WeatherModel weatherModel = WeatherModel();
  @override
  void initState() {
    super.initState();
    updateUi(widget.weatherData);
  }

  void updateUi(dynamic weatherData) {
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = 'Error';
      weatherMsg = 'We can\'t get weather data now';
      cityName = '';
      return;
    }
    setState(() {
      int condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherMsg = weatherModel.getMessage(temperature);
      cityName = weatherData['name'];
    });
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUi(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 40.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedNamed = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen()));
                      if (typedNamed != null) {
                        var weatherData =
                            await weatherModel.getCityWeather(typedNamed);
                        updateUi(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  "$weatherMsg in $cityName!",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
