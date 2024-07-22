import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/models/exeptions/went_wrong.dart';


part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {

  SplashCubit(

  ) : super(SplashInitial());

  Future init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

    } on Exception catch (e) {
      emit(SplashErrorState(e));
    } catch (e) {
      emit(SplashErrorState(WentWrongExeption()));
    }
  }
}
