import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_app/weather_screen.dart';
import 'package:weather_app/weather_app/weather_view_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => WeatherViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherScreen(),
    );
  }
}
