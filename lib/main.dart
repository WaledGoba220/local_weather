import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) {
      return WeatherProvider();
    },
    child: MyApp(),
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context)
                .weatherData!
                .getThemeColor(),
      ),
      home: HomeScreen(),
    );
  }
}
