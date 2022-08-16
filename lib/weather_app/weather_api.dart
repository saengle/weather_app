import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/weather_app/weather_model.dart';

class WeatherApi {

  Future<WhetherModel> getWeather() async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=95114a1e948559e010396b4debdf1672');
    http.Response response = await http.get(url);
    String jsonData = response.body;
    Map<String, dynamic> jsonMap = jsonDecode(jsonData);
    WhetherModel myModel = WhetherModel.fromJson(jsonMap);
    return myModel;
  }
}
