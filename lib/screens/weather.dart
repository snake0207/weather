import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:weather/model/model.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key, this.weatherData, this.airPollutionData})
      : super(key: key);
  final dynamic weatherData;
  final dynamic airPollutionData;
  // const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String? country;
  String? city;
  int temperature = 0;
  int timezone = 0;
  String? weatherDescription;
  String? weatherIcon;
  double? windSpeed;
  double? rain1Hour;
  double? snow1Hour;
  int? humidity;
  int sunrise = 0;
  int sunset = 0;

  int? aqi;
  double? pm2_5;
  double? pm10;
  late Widget aqiIcon;

  @override
  void initState() {
    super.initState();
    // debugPrint(widget.weatherData.toString());
    country = widget.weatherData['sys']['country'];
    sunrise = widget.weatherData['sys']['sunrise'];
    sunset = widget.weatherData['sys']['sunset'];
    city = widget.weatherData['name'];
    timezone = widget.weatherData['timezone'];
    temperature = widget.weatherData['main']['temp'].round();
    humidity = widget.weatherData['main']['humidity'];
    weatherDescription = widget.weatherData['weather'][0]['description'];
    weatherIcon = widget.weatherData['weather'][0]['icon'];
    weatherIcon = 'http://openweathermap.org/img/wn/$weatherIcon@2x.png';
    windSpeed = widget.weatherData['wind']['speed'];
    // rain1Hour = widget.weatherData['rain']('1h');
    // snow1Hour = widget.weatherData['snow']['1h'];
    // debugPrint("$city $temperature $timezone $weatherDescription");

    aqi = widget.airPollutionData['list'][0]['main']['aqi'];
    pm2_5 = widget.airPollutionData['list'][0]['components']['pm2_5'];
    pm10 = widget.airPollutionData['list'][0]['components']['pm10'];

    Model model = Model();
    aqiIcon = model.getIcon(aqi: aqi);
  }

  String getAqiString(int? aqi) {
    switch (aqi) {
      case 1:
        return 'Good';
      case 2:
        return 'Fair';
      case 3:
        return 'Moderate';
      case 4:
        return 'Poor';
      case 5:
        return 'Very Poor';
      default:
        return 'Unknown $aqi value';
    }
  }

  String getSuntime(int sunTime) {
    var rTime = DateTime.fromMillisecondsSinceEpoch((sunTime + timezone) * 1000,
        isUtc: true);
    return '${rTime.hour}:${rTime.minute}';
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
                    Text(
                      '$city ($country)',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TimerBuilder.periodic(
                      const Duration(seconds: 1),
                      builder: (context) {
                        return Text(
                          DateTime.now().format('g:i A l.j M, Y'),
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
                    Text(
                      '$temperature\u2103',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 85.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      children: [
                        Image.network('$weatherIcon'),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              '대기질지수',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            aqiIcon,
                            // Text(
                            //   '$aqi',
                            //   style: const TextStyle(
                            //     color: Colors.yellow,
                            //     fontSize: 30.0,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              getAqiString(aqi),
                              style: const TextStyle(
                                color: Colors.yellow,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              '미세먼지',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '$pm2_5',
                              style: const TextStyle(
                                color: Colors.yellow,
                                fontSize: 30.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              'μg/m3',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              '초미세먼지',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '$pm10',
                              style: const TextStyle(
                                color: Colors.yellow,
                                fontSize: 30.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              'μg/m3',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
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
