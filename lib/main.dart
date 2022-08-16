import 'package:flutter/material.dart';
import 'package:weather_app/weather_app/weather_screen.dart';

void main() {
  runApp(const MyApp());
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
