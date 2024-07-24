import 'package:fast_foodie/shared/helpers/maps.dart';
import 'package:fast_foodie/shared/services/network/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_foodie/shared/models/app/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  late PlaceModel _placeModel;
  GoogleMapController? _controller;
  final List<Marker> _allMarkers = [];

  PlaceModel get placeModel => _placeModel;
  List<Marker> get allMarkers => [..._allMarkers];
  GoogleMapController? get controller => _controller;

  String? _imageUrl;

  String? get imageUrl => _imageUrl;

  set setGoogleController(GoogleMapController c) => _controller = c;

  Future<void> moveAnimateToAddress() async {
    final latLong = LatLng(_placeModel.locationModel.latitude, _placeModel.locationModel.longitude);
    await _controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 92.8334901395799,
          target: latLong,
          tilt: 9.440717697143555,
          zoom: 18.151926040649414,
        ),
      ),
    );
  }

  void addMarker() {
    final position = LatLng(_placeModel.locationModel.latitude, _placeModel.locationModel.longitude);
    _allMarkers.add(Marker(markerId: MarkerId(_placeModel.id), position: position));
    emit(DetailsMarkerAddedState());
  }

  Future init(PlaceModel place, String? imageUrl) async {
    _placeModel = place;
    _imageUrl = imageUrl ?? (await DioServices().getOutdoorPicture(_placeModel.id))?.imageUrl;
    if (_imageUrl != null) emit(DetailsImageUpdateState());
  }

  DetailsCubit() : super(DetailsInitial());

  void onMapTap() {
    MapHelper.openMap(_placeModel.locationModel.latitude, _placeModel.locationModel.longitude);
  }
}
