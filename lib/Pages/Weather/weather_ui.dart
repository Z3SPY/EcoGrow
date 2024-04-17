import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Weather/weather_model.dart';
import '../Weather/weather_service.dart';
import 'package:lottie/lottie.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //  API Key
  final _weatherService = WeatherService('42ca9411f5b9e03f21664874e3d171be');
  Weather? _weather;

  // Fetch weather data
  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimations(String? mainCondition) {
    if (mainCondition == null) return 'assets/weather/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'thunderstorm':
        return 'assets/weather/thunderstorm.json';
      case 'drizzle':
        return 'assets/weather/drizzle.json';
      case 'rain':
        return 'assets/weather/thunderstorm.json';
      case 'snow':
        return 'assets/weather/snow.json';
      case 'atmosphere':
        return 'assets/weather/atmosphere.json';
      case 'clear':
        return 'assets/weather/sunny.json';
      case 'clouds':
        return 'assets/weather/cloud.json';

      default: return 'assets/weather/sunny.json';
    }

  }

  @override
  void initState() {
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
              width: 150, // Adjust width as needed
              height: 150, // Adjust height as needed
              child: Lottie.asset(getWeatherAnimations(_weather?.mainCondition)),
              
            ), 
            
            Container(
              child: Column(children: [
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_weather?.temperature.round() ?? 'Loading...'}°',
                        style: TextStyle(fontSize: 24), // Adjust font size as needed
                      ),
                      Icon(
                        Icons.thermostat,
                        size: 24, // Adjust size as needed
                      ),
                    ],
                  ),

                  Text(_weather?.mainCondition ?? "")

              ],),
            )
          ],),
          //Text(_weather?.cityName ?? 'Loading...'),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  
                  child: Column (children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Lottie.asset(getWeatherAnimations('Sunny')),
                    ),
                    
                  ],)

                  
                ),
                Expanded(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Lottie.asset(getWeatherAnimations('Sunny')),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Lottie.asset(getWeatherAnimations('atmosphere')),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Lottie.asset(getWeatherAnimations('drizzle')),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Lottie.asset(getWeatherAnimations('atmosphere')),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Lottie.asset(getWeatherAnimations('clear')),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Lottie.asset(getWeatherAnimations('clouds')),
                  ),
                ),
              ],
            ),
          ),
                
        ],
      ),
    ));
  }
}
