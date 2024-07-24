import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_foodie/shared/models/app/place.dart';
import 'package:flutter/material.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  late PlaceModel _placeModel;

  PlaceModel get placeModel => _placeModel;

  Future init(PlaceModel place) async {
    _placeModel = place;
  }

  DetailsCubit() : super(DetailsInitial());

  openInMaps() {}
}
