import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weather_app/weather_app/weather_api.dart';

import 'weather_model.dart';


class WeatherViewModel extends ChangeNotifier {
  final weatherApi = WeatherApi();
  WhetherModel myModel = WhetherModel();


  void fetchData() async {
    myModel = await weatherApi.getWeather();
    // notifyListeners();
  }

  String getMain(){
    return myModel.weather![0].main!;
  }
  double getCel(query){
    return query - 273.15 ;
  }
  // myModel.main!.temp!
}
