import 'package:flutter/material.dart';
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
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'thunderstorm':
      case 'drizzle':
      case 'rain':
      case 'snow':
      case 'atmosphere':
      case 'clear':
      case 'clouds':

      default: return 'assets/sunny.json';
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
          Text(_weather?.cityName ?? 'Loading...'),
          Lottie.asset(getWeatherAnimations(_weather?.mainCondition)),
          Text('${_weather?.temperature.round() ?? 'Loading...'}°'),
          Text(_weather?.mainCondition ?? "")
        ],
      ),
    ));
  }
}
