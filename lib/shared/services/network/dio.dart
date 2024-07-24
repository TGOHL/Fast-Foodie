import 'package:dio/dio.dart';
import 'package:fast_foodie/shared/config/constants.dart';
import 'package:fast_foodie/shared/models/app/place.dart';
import 'package:fast_foodie/shared/models/exeptions/went_wrong.dart';

class DioServices {
  static final Dio _dio = Dio();

  static void init() {
    // Set default configs
    _dio.options.baseUrl = 'https://api.foursquare.com';
    _dio.options.headers = {'Authorization': kFoursquareAPIKey, 'accept': 'application/json'};
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Future<List<PlaceModel>> getRestaurants(double lat, double long) async {
    try {
      final response = await _dio.get(
        '/v3/places/search',
        queryParameters: {
          'query': 'restaurant',
          'sort': 'DISTANCE',
          'll': '$lat,$long',
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> list = (response.data as Map<String, dynamic>)['results'];
        return list.map((e) => PlaceModel.fromMap(e)).toList();
      }
      throw WentWrongExeption();
    } catch (e) {
      throw WentWrongExeption();
    }
  }
}
