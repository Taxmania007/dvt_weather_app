import 'city.dart';

class CitiesResponse {
  late List<City> cities;
  late Metadata metadata;

  CitiesResponse({required this.cities, required this.metadata});

  CitiesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      cities = [];
      json['data'].forEach((v) {
        cities.add(new City.fromJson(v));
      });
    }
    metadata = (json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.cities.map((v) => v.toJson()).toList();
    data['metadata'] = this.metadata.toJson();
    return data;
  }
}

class Links {
  late String rel;
  late String href;

  Links({required this.rel, required this.href});

  Links.fromJson(Map<String, dynamic> json) {
    rel = json['rel'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rel'] = this.rel;
    data['href'] = this.href;
    return data;
  }
}

class Metadata {
  late int currentOffset;
  late int totalCount;

  Metadata({required this.currentOffset, required this.totalCount});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentOffset = json['currentOffset'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentOffset'] = this.currentOffset;
    data['totalCount'] = this.totalCount;
    return data;
  }
}
