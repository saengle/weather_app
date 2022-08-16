import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weather_app/weather_app/weather_api.dart';
import 'package:weather_app/weather_app/weather_model.dart';

class WeatherViewModel extends ChangeNotifier {
  final weatherApi = WeatherApi();
  bool isLoading = true;
  WhetherModel myModel = WhetherModel();
  String seleectedCity = '';

  WeatherViewModel() {
    fetchData();
  }

  void setSelectedCity(String query) async {
    seleectedCity = query;
    notifyListeners();
    isLoading = true;
    notifyListeners();
    myModel = await weatherApi.getWeather(seleectedCity);
    notifyListeners();
    isLoading = false;
    notifyListeners();
  }

  void fetchData() async {
    isLoading = true;
    notifyListeners();
    myModel = await weatherApi.getfirstWeather();
    notifyListeners();
    isLoading = false;
    notifyListeners();
  }

  double getCel(query) {
    return query - 273.15;
  }
}
