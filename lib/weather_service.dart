import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';
import 'secrets.dart';

class WeatherService {
  Future<Weather> fetchWeather(String cityName) async {
    final response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey',
      ),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Weather.fromJson(json);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
