import 'package:fast_foodie/shared/models/app/place.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageServices {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  Future addFavourite(PlaceModel place) async {
    await _storage.write(key: place.id, value: place.toJson());
  }

  Future removeFavourite(String id) async {
    await _storage.delete(key: id);
  }

  Future<PlaceModel> getFavouriteById(String id) async {
    String value = await _storage.read(key: id) ?? '{}';
    return PlaceModel.fromJson(value);
  }

  Future<List<PlaceModel>> getAllFavourites() async {
    Map<String, String> data = await _storage.readAll();
    return data.values.map((e) => PlaceModel.fromJson(e)).toList();
  }
}
