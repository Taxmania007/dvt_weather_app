import 'dart:ui';

import 'package:dvt_weather_app/constants.dart';
import 'package:dvt_weather_app/model/ForecastWeather.dart';
import 'package:dvt_weather_app/model/Weather.dart';
import 'package:dvt_weather_app/model/WeatherMain.dart';
import 'package:intl/intl.dart';

///Resolve data from the api and add UI configuration to make it UI ready
class DataResolver {
  ///Resolve current weather
  Future<ResolvedData> resolveCurrentWeather(
      Weather weather, Main weatherMain, String cityName) async {
    late final ResolvedData resolvedData;
    try {
      switch (weather.main) {
        case "Clear":
          resolvedData = ResolvedData(
              cityName: cityName,
              ui: UI(
                  color: kSunny,
                  imageAsset: "assets/images/forest_sunny.png",
                  icon: "assets/icons/clear@3x.png"),
              weather: weather,
              weatherMain: weatherMain);
          break;
        case "Clouds":
          resolvedData = ResolvedData(
              cityName: cityName,
              ui: UI(
                  color: kCloudy,
                  imageAsset: "assets/images/forest_cloudy.png",
                  icon: "assets/icons/rain@3x.png"),
              weatherMain: weatherMain,
              weather: weather);
          break;
        case "Rain":
          resolvedData = ResolvedData(
            cityName: cityName,
            ui: UI(
                color: kRainy,
                imageAsset: "assets/images/forest_rainy.png",
                icon: "assets/icons/rain@3x.png"),
            weatherMain: weatherMain,
            weather: weather,
          );
          break;
      }

      return resolvedData;
    } catch (e) {}
    throw '';
  }

  /// Resolve forecast weather, take the days list as parameter
  Future<List<ResolvedData>> resolveForecast(List<Days> days) async {
    late final List<ResolvedData> resolvedData = [];
    DateFormat format = DateFormat("yyyy-MM-dd");
    String time;
    for (var day in days) {
      time = DateFormat.Hms().format(DateTime.parse(day.dtTxt));
      print(time);
      if (time == "12:00:00") {
        print("TIME IS 12:00:00");
        try {
          switch (day.weather[0].main) {
            case "Clear":
              var date = format.parse(day.dtTxt);
              resolvedData.add(ResolvedData(
                  ui: UI(
                      color: kSunny,
                      imageAsset: "assets/images/forest_sunny.png",
                      icon: "assets/icons/clear@3x.png"),
                  weather: day.weather[0],
                  weatherMain: day.main,
                  day: DateFormat('EEEE').format(date)));

              break;
            case "Clouds":
              var date = format.parse(day.dtTxt);
              resolvedData.add(ResolvedData(
                  ui: UI(
                      color: kCloudy,
                      imageAsset: "assets/images/forest_cloudy.png",
                      icon: "assets/icons/partlysunny@3x.png"),
                  weatherMain: day.main,
                  weather: day.weather[0],
                  day: DateFormat('EEEE').format(date)));
              break;
            case "Rain":
              var date = format.parse(day.dtTxt);
              resolvedData.add(ResolvedData(
                  ui: UI(
                      color: kRainy,
                      imageAsset: "assets/images/forest_rainy.png",
                      icon: "assets/icons/rain@3x.png"),
                  weatherMain: day.main,
                  weather: day.weather[0],
                  day: DateFormat('EEEE').format(date)));
              break;
          }
        } catch (e) {}
      }
    }
    return resolvedData;
  }
}

class ResolvedData {
  late final UI? ui;
  late final Weather weather;
  late final Main weatherMain;
  late final String? day;
  late final String? cityName;

  ResolvedData(
      {this.ui,
      required this.weather,
      required this.weatherMain,
      this.day,
      this.cityName});
}

class UI {
  late final String imageAsset;
  late final Color color;
  late final String icon;

  UI({required this.color, required this.imageAsset, required this.icon});
}
