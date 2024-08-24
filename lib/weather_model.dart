class Weather {
  final String cityName;
  final double temperature;
  final String description;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'],
      description: json['weather'][0]['description'],
    );
  }

  String getWeatherIcon() {
    if (description.contains('clear')) {
      return 'assets/sun.png';
    } else if (description.contains('cloud') && description.contains('day')) {
      return 'assets/cloud_cloudy_day_forecast_sun_icon.png';
    } else if (description.contains('cloud') && description.contains('rain')) {
      return 'assets/cloud_cloudy_forecast_rain_sun_icon.png';
    } else if (description.contains('rain')) {
      return 'assets/cloud_cloudy_forecast_precipitation_rain_icon.png';
    } else if (description.contains('snow')) {
      return 'assets/cloud_day_precipitation_rain_snow_icon.png';
    } else {
      return 'assets/cloud_cloudy_forecast_precipitation_rain_icon.png'; // Default icon
    }
  }
}
