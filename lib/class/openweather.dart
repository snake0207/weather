class OpenWeather {
  final double? coordLon;
  final double? coordLat;
  final String? weatherDescription;
  final String? weatherIcon;
  final int? mainTemp;
  final int? mainHumidity;
  final double? windSpeed;
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
      this.sysCountry,
      this.timezone,
      this.name});

  OpenWeather.fromJSON(Map<String, dynamic> json)
      : coordLon = json['coord']['lon'],
        coordLat = json['coord']['lat'],
        weatherDescription = json['weather'][0]['description'],
        weatherIcon = json['weather'][0]['icon'],
        mainTemp = json['main']['temp'].round(),
        mainHumidity = json['main']['humidity'],
        windSpeed = json['wind']['speed'],
        sysCountry = json['sys']['country'],
        timezone = json['timezone'],
        name = json['name'];

  Map<String, dynamic> toJSON() => {
        'coord': {'lon': 127.9198, 'lat': 37.3333},
        'weather': [
          {
            'id': 803,
            'main': 'Clouds',
            'description': 'broken clouds',
            'icon': '04d'
          }
        ],
        'base': 'stations',
        'main': {
          'temp': 4.42,
          'feels_like': 4.42,
          'temp_min': 0.05,
          'temp_max': 4.42,
          'pressure': 1023,
          'humidity': 58,
          'sea_level': 1023,
          'grnd_level': 1005
        },
        'visibility': 10000,
        'wind': {'speed': 1.22, 'deg': 217, 'gust': 2.3},
        'clouds': {'all': 78},
        'dt': 1639445996,
        'sys': {
          'type': 1,
          'id': 5505,
          'country': 'KR',
          'sunrise': 1639434869,
          'sunset': 1639469484
        },
        'timezone': 32400,
        'id': 1833105,
        'name': 'Wŏnju',
        'cod': 200
      };
}
