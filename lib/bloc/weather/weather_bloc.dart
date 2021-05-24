import 'package:dvt_weather_app/bloc/result_state.dart';
import 'package:dvt_weather_app/bloc/weather/weather_event.dart';
import 'package:dvt_weather_app/data/api_helper.dart';
import 'package:dvt_weather_app/data/result.dart';
import 'package:dvt_weather_app/model/CurrentWeather.dart';
import 'package:dvt_weather_app/model/ForecastWeather.dart';
import 'package:dvt_weather_app/utils/DataResolver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentWeatherBloc extends Bloc<WeatherEvent, ResultState<ResolvedData>> {
  final ApiHelper apiHelper;

  CurrentWeatherBloc({required this.apiHelper}) : super(Idle());

  @override
  Stream<ResultState<ResolvedData>> mapEventToState(WeatherEvent event) async* {
    yield ResultState.loading();

    if (event is GetCurrentWeather) {
      Result<CurrentWeather> apiResult =
          await apiHelper.getCurrentWeather(event.lat, event.lng);

      yield* apiResult.when(success: (CurrentWeather currentWeather) async* {
        var resolvedUI = await DataResolver().resolveCurrentWeather(
            currentWeather.weather[0],
            currentWeather.main,
            currentWeather.name);
        yield ResultState.data(data: resolvedUI);
      }, failure: (dynamic error) async* {
        yield ResultState.error(error: error);
      });
    }
  }
}

class ForecastWeatherBloc
    extends Bloc<WeatherEvent, ResultState<List<ResolvedData>>> {
  final ApiHelper apiHelper;

  ForecastWeatherBloc({required this.apiHelper}) : super(Idle());

  @override
  Stream<ResultState<List<ResolvedData>>> mapEventToState(
      WeatherEvent event) async* {
    yield ResultState.loading();

    if (event is GetForecast) {
      Result<ForecastWeather> apiResult =
          await apiHelper.getForecastWeather(event.lat, event.lng);

      yield* apiResult.when(success: (ForecastWeather forecastWeather) async* {
        var resolvedUI =
            await DataResolver().resolveForecast(forecastWeather.days);
        yield ResultState.data(data: resolvedUI);
      }, failure: (dynamic error) async* {
        yield ResultState.error(error: error);
      });
    }
  }
}
