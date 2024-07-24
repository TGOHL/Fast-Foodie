import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_foodie/shared/enums/list_style.dart';
import 'package:fast_foodie/shared/models/app/place.dart';
import 'package:fast_foodie/shared/services/local/secure_storage.dart';
import 'package:flutter/material.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final ScrollController scrollController = ScrollController();
  final List<PlaceModel> _restaurants = [];

  bool _isInitailized = false;
  ListStyle _listStyel = ListStyle.large;

  bool get isInitailized => _isInitailized;
  ListStyle get listStyel => _listStyel;
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

  void changeListStyle(ListStyle s) {
    _listStyel = s;
    emit(FavouriteStyleChangedState());
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
