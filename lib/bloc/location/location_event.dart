import 'package:dvt_weather_app/model/cities_response/city.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_event.freezed.dart';

@freezed
abstract class LocationEvent with _$LocationEvent {
  const factory LocationEvent.getCurrentLocation() = GetCurrentLocation;
  const factory LocationEvent.searchCity(String input) = SearchCity;
  const factory LocationEvent.saveCity(City city) = SaveCity;
  const factory LocationEvent.getFavoriteCities() = GetFavoriteCities;
  //const factory WeatherEvent.getForecast(String city) = GetForecast;
}
