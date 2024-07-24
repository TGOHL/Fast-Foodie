part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteInitializedState extends FavouriteState {}

class FavouriteStyleChangedState extends FavouriteState {}

class FavouriteAddState extends FavouriteState {
  final PlaceModel place;

  FavouriteAddState(this.place);
}

class FavouriteRemoveState extends FavouriteState {
  final String id;

  FavouriteRemoveState(this.id);
}

class FavouriteNewPageState extends FavouriteState {}

class FavouriteErrorState extends FavouriteState {
  final Exception error;

  FavouriteErrorState(this.error);
}
