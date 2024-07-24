import 'package:fast_foodie/shared/cubit/favourite/favourite_cubit.dart';
import 'package:fast_foodie/shared/cubit/home/home_cubit.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
FavouriteCubit get favouriteCubit => locator();
HomeCubit get homeCubit => locator();

class GetItHelper {
  void getItInitialization() {
    locator.registerSingleton<HomeCubit>(HomeCubit());
    locator.registerSingleton<FavouriteCubit>(FavouriteCubit());
  }
}
