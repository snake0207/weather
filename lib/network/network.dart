import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Network {
  final String weatherUrl;
  final String airPollutionUrl;

  Network(this.weatherUrl, this.airPollutionUrl);

  Future<dynamic> getWeatherJSON() async {
    final http.Response response = await http.get(Uri.parse(weatherUrl));

    if (response.statusCode == 200) {
      debugPrint("Response: ${response.body}");
      return response.body;
      // return jsonDecode(response.body);
    }
  }

  Future<dynamic> getAirPollutionJSON() async {
    final http.Response response = await http.get(Uri.parse(airPollutionUrl));

    if (response.statusCode == 200) {
      debugPrint("Response: ${response.body}");
      return response.body;
    }
  }
}
