import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_app/weather_api.dart';
import 'package:weather_app/weather_app/weather_view_model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

enum City { Seoul, Ulsan, Daejeon, Daegu, Busan, Gwangju, Incheon }

class _WeatherScreenState extends State<WeatherScreen> {
  final weatherViewmodel = WeatherViewModel();
  final weatherApi = WeatherApi();
  String selectedCity = '';

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = context.watch<WeatherViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: <Widget>[
          // This button presents popup menu items.
          PopupMenuButton<City>(
              // Callback that sets the selected popup menu item.
              onSelected: (City item) {
                setState(() {
                  selectedCity = item.name;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<City>>[
                    const PopupMenuItem<City>(
                      value: City.Seoul,
                      child: Text('Seoul'),
                    ),
                    const PopupMenuItem<City>(
                      value: City.Ulsan,
                      child: Text('Ulsan'),
                    ),
                    const PopupMenuItem<City>(
                      value: City.Daejeon,
                      child: Text('Daejeon'),
                    ),
                    const PopupMenuItem<City>(
                      value: City.Daegu,
                      child: Text('Daegu'),
                    ),
                    const PopupMenuItem<City>(
                      value: City.Busan,
                      child: Text('Busan'),
                    ),
                    const PopupMenuItem<City>(
                      value: City.Gwangju,
                      child: Text('Gwangju'),
                    ),
                    const PopupMenuItem<City>(
                      value: City.Incheon,
                      child: Text('Incheon'),
                    ),
                  ])
        ],
      ),
      body: weatherViewModel.isLoading == true
          ? const CircularProgressIndicator()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('날씨'),
                        const SizedBox(
                          width: 4,
                        ),
                        Text('${weatherViewmodel.myModel.weather?[0].main}'),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('현재 온도'),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(weatherViewmodel
                            .getCel(weatherViewmodel.myModel.main!.temp!)
                            .toStringAsFixed(2)),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('체감 온도'),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(weatherViewmodel
                            .getCel(weatherViewmodel.myModel.main!.feelsLike)
                            .toStringAsFixed(2)),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('최고 온도'),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(weatherViewmodel
                            .getCel(weatherViewmodel.myModel.main!.tempMax)
                            .toStringAsFixed(2)),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('최저 온도'),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(weatherViewmodel
                            .getCel(weatherViewmodel.myModel.main!.tempMin)
                            .toStringAsFixed(2)),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('습도'),
                        const SizedBox(
                          width: 4,
                        ),
                        Text('${weatherViewmodel.myModel.main!.humidity}%'),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('풍속'),
                      const SizedBox(
                        width: 4,
                      ),
                      Text('${weatherViewmodel.myModel.wind!.speed}'),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
