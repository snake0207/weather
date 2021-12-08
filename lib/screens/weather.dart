import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  Weather({Key? key, this.weatherData}) : super(key: key);
  final weatherData;
  // const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String? city;
  int temperature = 0;

  @override
  void initState() {
    super.initState();
    debugPrint(widget.weatherData.toString());
    city = widget.weatherData['name'];
    double temp = widget.weatherData['main']['temp'];
    temperature = temp.round();

    debugPrint("$city $temperature");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$city',
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              '$temperature',
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
