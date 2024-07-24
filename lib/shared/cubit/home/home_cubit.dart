import 'package:fast_foodie/shared/enums/list_style.dart';
import 'package:fast_foodie/shared/helpers/geolocator.dart';
import 'package:fast_foodie/shared/models/app/place.dart';
import 'package:fast_foodie/shared/models/exeptions/custom_exeption.dart';
import 'package:fast_foodie/shared/models/exeptions/geolocator_permission.dart';
import 'package:fast_foodie/shared/services/network/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../models/exeptions/went_wrong.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ScrollController scrollController = ScrollController();
  final List<PlaceModel> _restaurants = [];

  late final Position myLocation;

  bool _isInitailized = false;
  ListStyle _listStyel = ListStyle.large;
  ListStyle get listStyel => _listStyel;
  bool get isInitailized => _isInitailized;
  List<PlaceModel> get restaurants => [..._restaurants];

  HomeCubit() : super(HomeInitial());

  Future init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      myLocation = await GeoLocatorHelper().determinePosition();
      _restaurants.addAll(await DioServices().getRestaurants(myLocation.latitude, myLocation.longitude));
      _isInitailized = true;
      emit(HomeInitializedState());
    } on CustomExeption catch (e) {
      emit(HomeErrorState(e));
    } on GeoLocatorPermissionExeption catch (e) {
      emit(HomeGeolocatorErrorState(e));
    } catch (e) {
      emit(HomeErrorState(WentWrongExeption()));
    }
  }

  void onFavouriteChanged() {
    emit(HomeFavouriteChangedState());
  }

  void changeListStyle(ListStyle s) {
    _listStyel = s;
    emit(HomeStyleChangedState());
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
