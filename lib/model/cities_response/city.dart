class City {
  late int id;
  late String wikiDataId;
  late String type;
  late String city;
  late String name;
  late String country;
  late String countryCode;
  late String region;
  late String regionCode;
  late double latitude;
  late double longitude;
  late int population;

  City(
      {required this.id,
      required this.wikiDataId,
      required this.type,
      required this.city,
      required this.name,
      required this.country,
      required this.countryCode,
      required this.region,
      required this.regionCode,
      required this.latitude,
      required this.longitude,
      required this.population});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wikiDataId = json['wikiDataId'];
    type = json['type'];
    city = json['city'];
    name = json['name'];
    country = json['country'];
    countryCode = json['countryCode'];
    region = json['region'];
    regionCode = json['regionCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    population = json['population'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'wikiDataId': wikiDataId,
      'type': type,
      'city': city,
      'name': name,
      'country': country,
      'countryCode': countryCode,
      'region': region,
      'regionCode': regionCode,
      'latitude': latitude,
      'longitude': longitude,
      'population': population
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wikiDataId'] = this.wikiDataId;
    data['type'] = this.type;
    data['city'] = this.city;
    data['name'] = this.name;
    data['country'] = this.country;
    data['countryCode'] = this.countryCode;
    data['region'] = this.region;
    data['regionCode'] = this.regionCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['population'] = this.population;
    return data;
  }
}
