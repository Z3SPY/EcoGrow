import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget{
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}


class _WeatherState extends State<Weather> {
  final WeatherFactory _wf = WeatherFactory("_apiKey");

  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _wf.currentWeatherByLocation(13, 122).then((w) {
      setState(() {
        _weather = w as Weather;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildUI(),);
  }

  Widget _buildUI() {
    if (_weather == null) {
      return const Center(child: CircularProgressIndicator(),);
    }
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [],
      ),
    );
  }

  Widget _dateTimeInfo() {
    DateTime now = DateTime.now();
    return Column(children: [
      Text(DateFormat)
    ],);
  }

}