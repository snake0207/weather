class OpenWeather {
  final double? coordLon;
  final double? coordLat;
  final String? weatherDescription;
  final String? weatherIcon;
  final int? mainTemp;
  final int? mainHumidity;
  final double? windSpeed;
  final double? rain1Hour;
  final double? snow1Hour;
  final String? sysCountry;
  final int? timezone;
  final String? name;

  OpenWeather(
      {this.coordLon,
      this.coordLat,
      this.weatherDescription,
      this.weatherIcon,
      this.mainTemp,
      this.mainHumidity,
      this.windSpeed,
      // this.rain1Hour = 0.0,
      // this.snow1Hour = 0.0,
      this.sysCountry,
      this.timezone,
      this.name})
      : rain1Hour = null,
        snow1Hour = null;

  OpenWeather.fromJSON(
      Map<String, dynamic> json, this.rain1Hour, this.snow1Hour)
      : coordLon = json['coord']['lon'],
        coordLat = json['coord']['lat'],
        weatherDescription = json['weather'][0]['description'],
        weatherIcon = json['weather'][0]['icon'],
        mainTemp = json['main']['temp'].round(),
        mainHumidity = json['main']['humidity'],
        windSpeed = json['wind']['speed'],
        // rain1Hour = json['rain']['1h'],
        // snow1Hour = json['snow']['1h'],
        sysCountry = json['sys']['country'],
        timezone = json['timezone'],
        name = json['timezone'];
}
