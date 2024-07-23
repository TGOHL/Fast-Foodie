import 'package:fast_foodie/shared/helpers/get_it.dart';
import 'package:fast_foodie/shared/services/network/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_foodie/shared/config/observer.dart';

class InitializationHelper {
  static Future<void> initialize() async {
    Bloc.observer = MyBlocObserver();
    DioServices.init();
    GetItHelper().getItInitialization();
  }
}
