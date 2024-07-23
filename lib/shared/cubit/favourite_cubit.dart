import 'package:bloc/bloc.dart';
import 'package:fast_foodie/shared/models/app/place.dart';
import 'package:fast_foodie/shared/services/local/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final ScrollController scrollController = ScrollController();
  final List<PlaceModel> _restaurants = [];

  bool _isInitailized = false;

  bool get isInitailized => _isInitailized;
  List<PlaceModel> get restaurants => [..._restaurants];

  FavouriteCubit() : super(FavouriteInitial());

  Future init() async {
    _isInitailized = true;
    _restaurants.addAll(await SecureStorageServices().getAllFavourites());
    emit(FavouriteInitializedState());
  }

  void addFavourite(PlaceModel rest) {
    _restaurants.add(rest);
    SecureStorageServices().addFavourite(rest);
    emit(FavouriteAddState(rest));
  }

  void removeFavourite(String id) {
    _restaurants.removeWhere((e) => e.id == id);
    SecureStorageServices().removeFavourite(id);
    emit(FavouriteRemoveState(id));
  }

  void toggleFavourite(PlaceModel rest) {
    if (isFavourite(rest.id)) {
      removeFavourite(rest.id);
    } else {
      addFavourite(rest);
    }
  }

  bool isFavourite(String id) {
    int index = _restaurants.indexWhere((element) => element.id == id);
    return index != -1;
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
