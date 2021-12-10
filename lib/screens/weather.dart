import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:date_time_format/date_time_format.dart';
// import 'package:google_fonts/google_fonts.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key, this.weatherData}) : super(key: key);
  final dynamic weatherData;
  // const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String? city;
  int temperature = 0;
  int timezone = 0;
  String? weatherDescription;

  @override
  void initState() {
    super.initState();
    // debugPrint(widget.weatherData.toString());
    city = widget.weatherData['name'];
    timezone = widget.weatherData['timezone'];
    double temp = widget.weatherData['main']['temp'];
    temperature = temp.round();
    weatherDescription = widget.weatherData['weather'][0]['description'];

    // debugPrint("$city $temperature $timezone $weatherDescription");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(''),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.near_me,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.location_searching,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/back_ground.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 150.0,
                    ),
                    const Text(
                      'Seoul',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TimerBuilder.periodic(
                      const Duration(seconds: 1),
                      builder: (context) {
                        return Text(
                          DateTime.now().format('g:i A l,j M, Y'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100.0,
                    ),
                    const Text(
                      '18\u2103',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 85.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/sun.svg',
                          width: 30.0,
                          height: 30.0,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '$weatherDescription',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Divider(
                      height: 15.0,
                      color: Colors.white38,
                    ),
                    Row(
                      children: const [
                        Text('미세먼지'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
