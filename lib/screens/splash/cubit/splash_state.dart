part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashErrorState extends SplashState {
  final Exception error;

  SplashErrorState(this.error);
}
