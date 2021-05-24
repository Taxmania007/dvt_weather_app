import 'Weather.dart';
import 'WeatherMain.dart';

class ForecastWeather {
  late String cod;
  late num message;
  late num cnt;
  late List<Days> days;
  late City city;

  ForecastWeather(
      {required this.cod,
      required this.message,
      required this.cnt,
      required this.days,
      required this.city});

  ForecastWeather.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      days = [];
      json['list'].forEach((v) {
        days.add(new Days.fromJson(v));
      });
    }
    city = (json['city'] != null ? new City.fromJson(json['city']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = this.cod;
    data['message'] = this.message;
    data['cnt'] = this.cnt;
    data['list'] = this.days.map((v) => v.toJson()).toList();
    data['city'] = this.city.toJson();
    return data;
  }
}

class Days {
  late num dt;
  late Main main;
  late List<Weather> weather;
  late Clouds clouds;
  late Wind wind;
  late num visibility;
  late num pop;
  late Sys sys;
  late String dtTxt;

  Days(
      {required this.dt,
      required this.main,
      required this.weather,
      required this.clouds,
      required this.wind,
      required this.visibility,
      required this.pop,
      required this.sys,
      required this.dtTxt});

  Days.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = (json['main'] != null ? new Main.fromJson(json['main']) : null)!;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    clouds =
        (json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null)!;
    wind = (json['wind'] != null ? new Wind.fromJson(json['wind']) : null)!;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = (json['sys'] != null ? new Sys.fromJson(json['sys']) : null)!;
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['main'] = this.main.toJson();
    data['weather'] = this.weather.map((v) => v.toJson()).toList();
    data['clouds'] = this.clouds.toJson();
    data['wind'] = this.wind.toJson();
    data['visibility'] = this.visibility;
    data['pop'] = this.pop;
    data['sys'] = this.sys.toJson();
    data['dt_txt'] = this.dtTxt;
    return data;
  }
}

class Clouds {
  late num all;

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

class Wind {
  late num speed;
  late num deg;
  late num gust;

  Wind({required this.speed, required this.deg, required this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    data['gust'] = this.gust;
    return data;
  }
}

class Sys {
  late String pod;

  Sys({required this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pod'] = this.pod;
    return data;
  }
}

class City {
  late num id;
  late String name;
  late Coord coord;
  late String country;
  late num population;
  late num timezone;
  late num sunrise;
  late num sunset;

  City(
      {required this.id,
      required this.name,
      required this.coord,
      required this.country,
      required this.population,
      required this.timezone,
      required this.sunrise,
      required this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = (json['coord'] != null ? new Coord.fromJson(json['coord']) : null)!;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.coord != null) {
      data['coord'] = this.coord.toJson();
    }
    data['country'] = this.country;
    data['population'] = this.population;
    data['timezone'] = this.timezone;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}

class Coord {
  late num lat;
  late num lon;

  Coord({required this.lat, required this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}
