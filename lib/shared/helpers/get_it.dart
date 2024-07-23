import 'package:fast_foodie/shared/cubit/favourite_cubit.dart';
import 'package:fast_foodie/shared/cubit/home_cubit.dart';
import 'package:fast_foodie/shared/cubit/main_cubit.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
MainCubit get mainCubit => locator();
FavouriteCubit get favouriteCubit => locator();
HomeCubit get homeCubit => locator();

class GetItHelper {
  void getItInitialization() {
    locator.registerSingleton<MainCubit>(MainCubit());
    locator.registerSingleton<HomeCubit>(HomeCubit());
    locator.registerSingleton<FavouriteCubit>(FavouriteCubit());
  }
}
