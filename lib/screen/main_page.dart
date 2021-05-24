import 'package:dvt_weather_app/constants.dart';
import 'package:dvt_weather_app/screen/Home.dart';
import 'package:dvt_weather_app/screen/fav_locations_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainScreenState();

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => MainScreen());
  }
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> pages = [HomePage(), FavLocationsPage()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: kRainy,
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_sharp), label: "Favorite Places"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kSunny,
          onTap: _onItemTapped,
        ),
      );
}
