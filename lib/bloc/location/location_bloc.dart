import 'package:dvt_weather_app/bloc/location/location_event.dart';
import 'package:dvt_weather_app/data/db_helper.dart';
import 'package:dvt_weather_app/data/result.dart';
import 'package:dvt_weather_app/location/LocationHelper.dart';
import 'package:dvt_weather_app/model/cities_response/CitiesResponse.dart';
import 'package:dvt_weather_app/model/cities_response/city.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../result_state.dart';
import 'location_event.dart';

/// Build current location bloc
class CurrentLocationBloc extends Bloc<LocationEvent, ResultState<Position>> {
  CurrentLocationBloc({required this.locationHelper}) : super(Idle());

  final LocationHelper locationHelper;
  @override
  Stream<ResultState<Position>> mapEventToState(LocationEvent event) async* {
    yield ResultState.loading();

    if (event is GetCurrentLocation) {
      Result<Position> locationResult =
          await locationHelper.getCurrentLocation();

      yield* locationResult.when(success: (Position position) async* {
        yield ResultState.data(data: position);
      }, failure: (dynamic error) async* {
        yield ResultState.error(error: error);
      });
    }
  }
}

/// Build Search city bloc
class SearchCityBloc extends Bloc<LocationEvent, ResultState<CitiesResponse>> {
  SearchCityBloc({required this.locationHelper}) : super(Idle());

  final LocationHelper locationHelper;
  @override
  Stream<ResultState<CitiesResponse>> mapEventToState(
      LocationEvent event) async* {
    yield ResultState.loading();

    if (event is SearchCity) {
      Result<CitiesResponse> searchResult =
          await locationHelper.searchCity(event.input);

      yield* searchResult.when(success: (CitiesResponse cities) async* {
        yield ResultState.data(data: cities);
      }, failure: (dynamic error) async* {
        yield ResultState.error(error: error);
      });
    }
  }
}

class SaveCityBloc extends Bloc<LocationEvent, ResultState<String>> {
  SaveCityBloc({required this.dbHelper}) : super(Idle());

  final DBHelper dbHelper;
  @override
  Stream<ResultState<String>> mapEventToState(LocationEvent event) async* {
    yield ResultState.loading();
    if (event is SaveCity) {
      Result<String> result = await dbHelper.saveCity(event.city);

      yield* result.when(success: (String successMessage) async* {
        yield ResultState.data(data: successMessage);
      }, failure: (dynamic error) async* {
        yield ResultState.error(error: error);
      });
    }
  }
}

class GetFavCitiesBloc extends Bloc<LocationEvent, ResultState<List<City>>> {
  final DBHelper dbHelper;

  GetFavCitiesBloc({required this.dbHelper}) : super(Idle());

  @override
  Stream<ResultState<List<City>>> mapEventToState(LocationEvent event) async* {
    yield ResultState.loading();
    if (event is GetFavoriteCities) {
      Result<List<City>> result = await dbHelper.getAllCities();

      yield* result.when(success: (List<City> cities) async* {
        yield ResultState.data(data: cities);
      }, failure: (dynamic error) async* {
        yield ResultState.error(error: error);
      });
    }
  }
}
