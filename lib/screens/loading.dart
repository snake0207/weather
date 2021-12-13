import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/location/location.dart';
import 'package:weather/network/network.dart';
import 'package:weather/screens/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? apiKey;

  @override
  void initState() {
    super.initState();
    loadAsset();
    getLocation();
  }

  Future<void> loadAsset() async {
    apiKey = await rootBundle.loadString('assets/weather.api');
    debugPrint('API_KEY : $apiKey');
  }

  void getLocation() async {
    Location location = Location();
    await location.getLocation();

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');

    var weatherData = await network.getWeatherJSON();
    var airPollutionData = await network.getAirPollutionJSON();
    debugPrint("weatherData: $weatherData");
    debugPrint("airPollutionData: $airPollutionData");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Weather(
          weatherData: weatherData, airPollutionData: airPollutionData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitThreeInOut(
          color: Colors.blue,
        ),
      ),
    );
  }
}
