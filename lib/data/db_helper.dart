import 'package:dvt_weather_app/data/result.dart';
import 'package:dvt_weather_app/data/sqlf_client.dart';
import 'package:dvt_weather_app/model/cities_response/city.dart';

class DBHelper {
  /// Add favorite city to table
  Future<Result<String>> saveCity(City city) async {
    try {
      final dbClient = await SQLiteDB().db;
      await dbClient.insert("FavCities", city.toJson());
      return Result.success(data: "${city.city} successfully saved");
    } catch (e) {
      return Result.failure(error: e);
    }
  }

  /// Get all favorite cities using db client
  Future<Result<List<City>>> getAllCities() async {
    try {
      var dbClient = await SQLiteDB().db;
      final List<Map> res = await dbClient.query('FavCities');
      List<City> cities = List.generate(res.length, (i) {
        return City(
            id: res[i]['id'],
            wikiDataId: res[i]['wikiDataId'],
            type: res[i]['type'],
            city: res[i]['city'],
            name: res[i]['name'],
            country: res[i]['country'],
            countryCode: res[i]['countryCode'],
            region: res[i]['region'],
            regionCode: res[i]['regionCode'],
            latitude: res[i]['latitude'],
            longitude: res[i]['longitude'],
            population: res[i]['population']);
      });

      return Result.success(data: cities);
    } catch (e) {
      return Result.failure(error: e);
    }
  }
}
