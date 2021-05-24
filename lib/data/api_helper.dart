import 'package:dio/dio.dart';
import 'package:dvt_weather_app/model/CurrentWeather.dart';
import 'package:dvt_weather_app/model/ForecastWeather.dart';

import 'dio_handler.dart';
import 'network_exceptions.dart';
import 'result.dart';

/// Responsible for making Api Calls
class ApiHelper {
  late DioHandler dioHandler;
  String _baseUrl = Apis.BASE;

  // ignore: non_constant_identifier_names
  ApiHelper() {
    var _dio = Dio();

    dioHandler = DioHandler(_baseUrl, _dio);
  }

  ///Get the current weather, pass city name or city and ISO Country code e.g Gaborone,BW
  Future<Result<CurrentWeather>> getCurrentWeather(lat, lng) async {
    try {
      final response = await dioHandler.get(Apis.current, queryParameters: {
        "lat": lat,
        "lon": lng,
        'appid': 'c3d9c0d8ff634263a3ca2a6bb9dbf1bf',
        "units": "metric"
      });
      var currentWeather = CurrentWeather.fromJson(response);
      return Result.success(data: currentWeather);
    } catch (e) {
      return Result.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  ///Get the forecast weather for 5 days, pass city name or city and ISO Country code e.g Gaborone,BW
  Future<Result<ForecastWeather>> getForecastWeather(lat, lng) async {
    try {
      final response = await dioHandler.get(Apis.forecast5, queryParameters: {
        "lat": lat,
        "lon": lng,
        'appid': 'c3d9c0d8ff634263a3ca2a6bb9dbf1bf',
        "units": "metric"
      });
      var forecastWeather = ForecastWeather.fromJson(response);
      return Result.success(data: forecastWeather);
    } catch (e) {
      print(e.toString());
      return Result.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}

///APIs class is for api tags
class Apis {
  static const String BASE = 'https://api.openweathermap.org/data/2.5';
  static const String current = '/weather';
  static const String forecast5 = '/forecast';
}
