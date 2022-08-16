import 'package:flutter/material.dart';
import 'package:weather_app/weather_app/weather_api.dart';
import 'package:weather_app/weather_app/weather_view_model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final weatherViewmodel = WeatherViewModel();
  final weatherApi = WeatherApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seoul Weather'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  weatherViewmodel.fetchData();
                  print(weatherViewmodel.myModel.main!.temp);
                  // print(weatherViewmodel.getCel());
                });
              },
              icon: Icon(Icons.refresh)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text('현재 온도'),
              SizedBox(width: 4,),
              Text(
                  '${weatherViewmodel.getCel(weatherViewmodel.myModel.main!.temp!).toStringAsFixed(2)}'),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Text('체감 온도'), SizedBox(width: 4,),
              Text(
                  '${weatherViewmodel.getCel(weatherViewmodel.myModel.main!.feelsLike).toStringAsFixed(2)}'),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Text('최고 온도'), SizedBox(width: 4,),
              Text(
                  '${weatherViewmodel.getCel(weatherViewmodel.myModel.main!.tempMax).toStringAsFixed(2)}'),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Text('최저 온도'), SizedBox(width: 4,),
              Text(
                  '${weatherViewmodel.getCel(weatherViewmodel.myModel.main!.tempMin).toStringAsFixed(2)}'),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Text('습도'), SizedBox(width: 4,),
              Text('${weatherViewmodel.myModel.main!.humidity}'),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Text('날씨'), SizedBox(width: 4,),
              Text('${weatherViewmodel.myModel.weather![0].main}'),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Text('풍속'), SizedBox(width: 4,),
                Text('${weatherViewmodel.myModel.wind!.speed}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
