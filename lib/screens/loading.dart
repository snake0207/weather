import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/location/location.dart';
import 'package:weather/network/network.dart';
import 'package:weather/screens/weather.dart';

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
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var parsedData = await network.getJSON();
    debugPrint("Parse: $parsedData");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Weather(weatherData: parsedData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
      ),
      body: const Center(
        child: ElevatedButton(
          onPressed: null,
          child: Text('Get My Location'),
        ),
      ),
    );
  }
}
