part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

class DetailsErrorState extends DetailsState {
  final Exception error;

  DetailsErrorState(this.error);
}

final class DetailsInitial extends DetailsState {}
