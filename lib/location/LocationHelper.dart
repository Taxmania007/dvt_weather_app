import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dvt_weather_app/data/dio_handler.dart';
import 'package:dvt_weather_app/data/network_exceptions.dart';
import 'package:dvt_weather_app/data/result.dart';
import 'package:dvt_weather_app/model/cities_response/CitiesResponse.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper {
  late DioHandler dioHandler;
  String _baseUrl = "https://wft-geo-db.p.rapidapi.com/v1/geo";

  // ignore: non_constant_identifier_names
  LocationHelper() {
    var _dio = Dio();

    dioHandler = DioHandler(_baseUrl, _dio);
  }

  //Get current location
  Future<Result<Position>> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return Result.success(data: position);
    } catch (e) {
      return Result.failure(error: e.toString());
    }
  }

  ///Search for a city/town
  Future<Result<CitiesResponse>> searchCity(String input) async {
    try {
      var response = await dioHandler.get("/cities",
          queryParameters: {"namePrefix": input},
          options: Options(headers: {
            "x-rapidapi-key":
                "9e71d1fe78msh522153a9f3bec80p169554jsn8ba3626771b8",
            "x-rapidapi-host": "wft-geo-db.p.rapidapi.com",
            "useQueryString": true
          }));
      var cities = CitiesResponse.fromJson(response);
      return Result.success(data: cities);
    } catch (e) {
      print(e);
      return Result.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
