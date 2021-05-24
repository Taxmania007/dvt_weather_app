import 'dart:async';

import 'package:dvt_weather_app/bloc/location/location_bloc.dart';
import 'package:dvt_weather_app/bloc/location/location_event.dart';
import 'package:dvt_weather_app/bloc/result_state.dart';
import 'package:dvt_weather_app/model/cities_response/city.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FavLocationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavLocationsState();
}

class FavLocationsState extends State<FavLocationsPage> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    BlocProvider.of<GetFavCitiesBloc>(context).add(GetFavoriteCities());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: BlocConsumer<GetFavCitiesBloc, ResultState<List<City>>>(
        listener: (BuildContext context, ResultState<List<City>> state) {
          state.when(
              idle: () {},
              loading: () {},
              data: (List<City> cities) {
                for (City city in cities) {
                  var markerId = MarkerId(city.city);
                  final Marker marker = Marker(
                    markerId: markerId,
                    position: LatLng(
                      city.latitude,
                      city.longitude,
                    ),
                    infoWindow: InfoWindow(
                        title: city.city + "," + city.countryCode,
                        snippet: 'Population: ${city.population} '),
                    onTap: () {
                      // _onMarkerTapped(markerId);
                    },
                  );
                  setState(() {
                    markers[markerId] = marker;
                  });
                }
              },
              error: (dynamic error) {});
        },
        builder: (BuildContext context, ResultState<List<City>> state) {
          return state.when(idle: () {
            return Container();
          }, loading: () {
            return CircularProgressIndicator();
          }, data: (List<City> cities) {
            return GoogleMap(
                markers: Set<Marker>.of(markers.values),
                initialCameraPosition: CameraPosition(
                  target: LatLng(cities[0].latitude, cities[0].longitude),
                  zoom: 14.4746,
                ));
          }, error: (dynamic error) {
            return Center(
              child: Text(error),
            );
          });
        },
      ));
}
