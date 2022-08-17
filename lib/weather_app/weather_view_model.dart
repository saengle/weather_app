import 'package:flutter/material.dart';
import 'package:weather_app/weather_app/weather_api.dart';
import 'package:weather_app/weather_app/weather_model.dart';

class WeatherViewModel extends ChangeNotifier {
  final _weatherApi = WeatherApi();
  bool isLoading = true;
  WeatherModel myModel = WeatherModel();


  WeatherViewModel() {
    setSelectedCity('Seoul');
  }

  void setSelectedCity(String query) async {
    isLoading = true;
    notifyListeners();
    myModel = await _weatherApi.getWeather(query);
    isLoading = false;
    notifyListeners();
  }


  double getCelsius(temp) {
    return temp - 273.15;
  }
}
