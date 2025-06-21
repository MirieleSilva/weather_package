import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const _apiKey = '628ffd2574436dfaa4d39afa3feeb05b';

  static Future<double?> getTemperature(double lat, double lon) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$_apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['main']?['temp'] as num?)?.toDouble();
    } else {
      print('Erro ao buscar temperatura: ${response.statusCode}');
      return null;
    }
  }
}

