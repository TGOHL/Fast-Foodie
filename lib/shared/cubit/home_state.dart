part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeInitializedState extends HomeState {}

class HomeFavouriteChangedState extends HomeState {}

class HomeErrorState extends HomeState {
  final Exception error;

  HomeErrorState(this.error);
}

class HomeGeolocatorErrorState extends HomeState {
  final GeoLocatorPermissionExeption error;

  HomeGeolocatorErrorState(this.error);
}
