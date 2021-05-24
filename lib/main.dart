import 'package:dvt_weather_app/bloc/location/location_bloc.dart';
import 'package:dvt_weather_app/bloc/weather/weather_bloc.dart';
import 'package:dvt_weather_app/data/db_helper.dart';
import 'package:dvt_weather_app/location/LocationHelper.dart';
import 'package:dvt_weather_app/screen/Home.dart';
import 'package:dvt_weather_app/screen/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/api_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrentWeatherBloc>(
          create: (BuildContext context) {
            return CurrentWeatherBloc(apiHelper: ApiHelper());
          },
          child: HomePage(),
        ),
        BlocProvider<ForecastWeatherBloc>(
          create: (BuildContext context) {
            return ForecastWeatherBloc(apiHelper: ApiHelper());
          },
          child: HomePage(),
        ),
        BlocProvider<CurrentLocationBloc>(
          create: (BuildContext context) {
            return CurrentLocationBloc(locationHelper: LocationHelper());
          },
          child: HomePage(),
        ),
        BlocProvider<GetFavCitiesBloc>(
          create: (BuildContext context) {
            return GetFavCitiesBloc(dbHelper: DBHelper());
          },
        ),
        BlocProvider<SaveCityBloc>(
          create: (BuildContext context) {
            return SaveCityBloc(dbHelper: DBHelper());
          },
        )
      ],
      child: MaterialApp(
        title: 'DVT Weather App',
        theme: ThemeData(
          fontFamily: 'Avenir',
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
      ),
    );
  }
}
