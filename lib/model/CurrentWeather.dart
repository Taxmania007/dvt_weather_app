import 'Weather.dart';
import 'WeatherMain.dart';

class CurrentWeather {
  late Coord coord;
  late List<Weather> weather;
  late String base;
  late Main main;
  late int visibility;
  late Wind wind;
  late Clouds clouds;
  late int dt;
  late Sys sys;
  late int timezone;
  late int id;
  late String name;
  late int cod;

  CurrentWeather(
      {required this.coord,
      required this.weather,
      required this.base,
      required this.main,
      required this.visibility,
      required this.wind,
      required this.clouds,
      required this.dt,
      required this.sys,
      required this.timezone,
      required this.id,
      required this.name,
      required this.cod});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    coord = (json['coord'] != null ? new Coord.fromJson(json['coord']) : null)!;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = (json['main'] != null ? new Main.fromJson(json['main']) : null)!;
    visibility = json['visibility'];
    wind = (json['wind'] != null ? new Wind.fromJson(json['wind']) : null)!;
    clouds =
        (json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null)!;
    dt = json['dt'];
    sys = (json['sys'] != null ? new Sys.fromJson(json['sys']) : null)!;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coord'] = this.coord.toJson();
    data['weather'] = this.weather.map((v) => v.toJson()).toList();
    data['base'] = this.base;
    data['main'] = this.main.toJson();
    data['visibility'] = this.visibility;
    data['wind'] = this.wind.toJson();
    data['clouds'] = this.clouds.toJson();
    data['dt'] = this.dt;
    data['sys'] = this.sys.toJson();
    data['timezone'] = this.timezone;
    data['id'] = this.id;
    data['name'] = this.name;
    data['cod'] = this.cod;
    return data;
  }
}

class Coord {
  late double lon;
  late double lat;

  Coord({required this.lon, required this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}

class Wind {
  late double speed;
  late int deg;

  Wind({required this.speed, required this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    return data;
  }
}

class Clouds {
  late int all;

  Clouds({required this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this.all;
    return data;
  }
}

class Sys {
  int? type;
  int? id;
  late String country;
  late int sunrise;
  late int sunset;

  Sys(
      {required this.type,
      required this.id,
      required this.country,
      required this.sunrise,
      required this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['country'] = this.country;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}
