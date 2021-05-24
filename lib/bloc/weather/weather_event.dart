import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_event.freezed.dart';

@freezed
abstract class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.getCurrentWeather(double lat, double lng) =
      GetCurrentWeather;
  const factory WeatherEvent.getForecast(double lat, double lng) = GetForecast;
}
