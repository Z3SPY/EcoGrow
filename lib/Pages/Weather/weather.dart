import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
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
        _weather = w as Weather?;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (_weather == null) {
      return const Center(child: CircularProgressIndicator(),);
    }
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          _dateTimeInfo(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
          ),
          _weatherIcon(),
        ],
      ),
    );
  }

  Widget _dateTimeInfo() {
    DateTime now = DateTime.now();
    return Column(
      children: [
        Text(DateFormat("h:mm a").format(now),
            style: const TextStyle(fontSize: 35)),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(DateFormat("EEEE").format(now),
                style: const TextStyle(fontSize: 35)),
            Text(" ${DateFormat("d.m.y").format(now)}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ))
          ],
        )
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "http://openweathermap.org/img/wn/"))),
        )
      ],
    );
  }
}
