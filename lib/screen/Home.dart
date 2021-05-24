import 'package:dvt_weather_app/bloc/location/location_bloc.dart';
import 'package:dvt_weather_app/bloc/location/location_event.dart';
import 'package:dvt_weather_app/bloc/result_state.dart';
import 'package:dvt_weather_app/bloc/weather/weather_bloc.dart';
import 'package:dvt_weather_app/bloc/weather/weather_event.dart';
import 'package:dvt_weather_app/data/db_helper.dart';
import 'package:dvt_weather_app/data/network_exceptions.dart';
import 'package:dvt_weather_app/location/LocationHelper.dart';
import 'package:dvt_weather_app/model/cities_response/CitiesResponse.dart';
import 'package:dvt_weather_app/model/cities_response/city.dart';
import 'package:dvt_weather_app/utils/DataResolver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Color bgColor;
  late CurrentWeatherBloc currentWeatherBloc;
  late TextEditingController citySearchController;
  late SearchCityBloc searchCityBloc;
  late bool searchResultsVisible;
  late DBHelper dbHelper;
  City? selectedCity;

  @override
  void initState() {
    bgColor = Colors.white;
    dbHelper = DBHelper();
    BlocProvider.of<CurrentLocationBloc>(context).add(GetCurrentLocation());
    searchCityBloc = SearchCityBloc(locationHelper: LocationHelper());
    searchResultsVisible = false;
    citySearchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(listeners: [
        ///Current location listener
        BlocListener<CurrentLocationBloc, ResultState<Position>>(
            listener: (BuildContext context, ResultState<Position> state) {
          state.when(loading: () {
            return Center(child: CircularProgressIndicator());
          }, idle: () {
            return Container();
          }, data: (Position position) {
            /// Get the current weather based on current location
            BlocProvider.of<CurrentWeatherBloc>(context)
                .add(GetCurrentWeather(position.latitude, position.longitude));

            /// Get the forecast weather based on current location
            BlocProvider.of<ForecastWeatherBloc>(context)
                .add(GetForecast(position.latitude, position.longitude));
          }, error: (dynamic error) {
            return Text(error);
          });
        }),

        ///Current weather listener
        BlocListener<CurrentWeatherBloc, ResultState<ResolvedData>>(
          listener: (BuildContext context, ResultState<ResolvedData> state) {
            state.when(
                idle: () {
                  return Container();
                },
                loading: () {
                  return Container();
                },
                data: (ResolvedData resolvedData) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    setState(() {
                      bgColor = resolvedData.ui!
                          .color; //Change background color based on current weather
                      citySearchController.text = resolvedData.cityName!;
                    });
                  });
                },
                error: (dynamic error) {});
          },
        ),

        /// City search listener
        BlocListener<SearchCityBloc, ResultState<CitiesResponse>>(
          bloc: searchCityBloc,
          listener: (BuildContext context, ResultState<CitiesResponse> state) {
            state.when(
                idle: () {},
                loading: () {
                  setState(() {
                    searchResultsVisible = false;
                  });
                },
                data: (CitiesResponse cities) {
                  setState(() {
                    searchResultsVisible = true;
                  });
                },
                error: (dynamic error) {});
          },
        ),

        BlocListener<SaveCityBloc, ResultState<String>>(
          listener: (BuildContext context, ResultState<String> state) {
            state.when(
                idle: () {},
                loading: () {},
                data: (String successMessage) {
                  Fluttertoast.showToast(
                      msg: successMessage,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white);
                },
                error: (dynamic error) {
                  Fluttertoast.showToast(
                      msg: error.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white);
                });
          },
        )
      ], child: _buildHomeScreen());

  /// Build the home screen
  _buildHomeScreen() {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [_buildCurrentWeather(), _buildForecastWeather()],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          if (selectedCity != null) {
            BlocProvider.of<SaveCityBloc>(context).add(SaveCity(selectedCity!));
          } else {
            Fluttertoast.showToast(
                msg: "Search for a city first to save it",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.blue,
                textColor: Colors.white);
          }
        },
      ),
    );
  }

  ///Build Current Weather Widget
  _buildCurrentWeather() {
    return BlocBuilder<CurrentWeatherBloc, ResultState<ResolvedData>>(
      builder: (BuildContext context, ResultState<ResolvedData> state) {
        return state.when(
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
          idle: () {
            return Container();
          },
          data: (ResolvedData resolvedData) {
            return Column(
              children: [
                Container(
                  color: bgColor,
                  child: Stack(children: [
                    Container(
                      child: Image.asset(
                        resolvedData.ui!.imageAsset,
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            resolvedData.weatherMain.temp.toStringAsFixed(0) +
                                String.fromCharCode(0x00B0),
                            // Round temperature of to the nearest whole number and add degree symbol
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(resolvedData.weather.main,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                              )),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          height: 50,
                          child: (Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  controller: citySearchController,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  onPressed: () {
                                    searchCityBloc.add(
                                        SearchCity(citySearchController.text));
                                  },
                                  icon: Icon(Icons.search),
                                ),
                              )
                            ],
                          )),
                        ),
                        BlocBuilder<SearchCityBloc,
                                ResultState<CitiesResponse>>(
                            bloc: searchCityBloc,
                            builder: (BuildContext context,
                                ResultState<CitiesResponse> state) {
                              return state.when(idle: () {
                                return Container();
                              }, loading: () {
                                return CircularProgressIndicator();
                              }, data: (CitiesResponse cities) {
                                return _buildSearchResults(cities);
                              }, error: (dynamic error) {
                                return Container();
                              });
                            }),
                      ],
                    ),
                  ]),
                  height: MediaQuery.of(context).size.height / 2.2,
                ),
                Container(
                  height: 50,
                  color: resolvedData.ui!.color,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            resolvedData.weatherMain.tempMin
                                    .toStringAsFixed(0) +
                                String.fromCharCode(0x00B0),
                            // Round temperature of to the nearest whole number and add degree symbol
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Min",
                            // Round temperature of to the nearest whole number
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            resolvedData.weatherMain.temp.toStringAsFixed(0) +
                                String.fromCharCode(0x00B0),
                            // Round temperature of to the nearest whole number and add degree symbol, // Round temperature of to the nearest whole number
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Current",
                            // Round temperature of to the nearest whole number
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            resolvedData.weatherMain.tempMax
                                    .toStringAsFixed(0) +
                                String.fromCharCode(0x00B0),
                            // Round temperature of to the nearest whole number and add degree symbol, // Round temperature of to the nearest whole number
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Max",
                            // Round temperature of to the nearest whole number
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          error: (dynamic error) {
            return Text(NetworkExceptions.getErrorMessage(error));
          },
        );
      },
    );
  }

  ///Build Forecast weather widget
  _buildForecastWeather() {
    return Expanded(
      child: Container(
        child:
            BlocBuilder<ForecastWeatherBloc, ResultState<List<ResolvedData>>>(
          // Five day forecast section
          builder:
              (BuildContext context, ResultState<List<ResolvedData>> state) {
            return state.when(
              loading: () {
                return Center(child: CircularProgressIndicator());
              },
              idle: () {
                return Container();
              },
              data: (List<ResolvedData> forecastWeather) {
                return ListView.builder(
                    itemCount: forecastWeather.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: forecastWeather[index].ui!.color,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  forecastWeather[index].day!,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Image.asset(
                                    forecastWeather[index].ui!.icon)),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  forecastWeather[index]
                                          .weatherMain
                                          .tempMax
                                          .toStringAsFixed(0) +
                                      String.fromCharCode(
                                          0x00B0), // Round temperature of to the nearest whole number and add degree symbol,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              error: (dynamic error) {
                return Text(NetworkExceptions.getErrorMessage(error));
              },
            );
          },
        ),
      ),
    );
  }

  ///Build City Search results
  _buildSearchResults(CitiesResponse citiesResponse) {
    return Visibility(
      visible: searchResultsVisible,
      child: Card(
        elevation: 10,
        child: Container(
          margin: EdgeInsets.only(right: 12, left: 12),
          height: MediaQuery.of(context).size.height / 3,
          color: Colors.white,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: citiesResponse.cities.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(citiesResponse.cities[index].name +
                      "," +
                      citiesResponse.cities[index].countryCode),
                  onTap: () {
                    /// Get the current weather based on SELECTED location
                    BlocProvider.of<CurrentWeatherBloc>(context).add(
                        GetCurrentWeather(citiesResponse.cities[index].latitude,
                            citiesResponse.cities[index].longitude));

                    /// Get the forecast weather based on SELECTED location
                    BlocProvider.of<ForecastWeatherBloc>(context).add(
                        GetForecast(citiesResponse.cities[index].latitude,
                            citiesResponse.cities[index].longitude));
                    setState(() {
                      searchResultsVisible = false;
                      selectedCity = citiesResponse.cities[index];
                    });
                  },
                );
              }),
        ),
      ),
    );
  }
}
