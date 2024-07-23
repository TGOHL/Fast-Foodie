import 'package:fast_foodie/screens/favourite/favourite_layout.dart';
import 'package:fast_foodie/shared/config/styles.dart';
import 'package:fast_foodie/shared/cubit/favourite_cubit.dart';
import 'package:fast_foodie/shared/helpers/get_it.dart';
import 'package:fast_foodie/shared/widgets/loading.dart';
import 'package:fast_foodie/shared/widgets/main_button.dart';
import 'package:fast_foodie/shared/widgets/place_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_foodie/shared/helpers/toast_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

import '../../shared/cubit/home_cubit.dart';

part 'home_view.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<FavouriteCubit>().init().then((value) => context.read<HomeCubit>().init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeErrorState) {
              ToastHelper.of(context).showError(state.error.toString());
            }
          },
        ),
        BlocListener<FavouriteCubit, FavouriteState>(
          listenWhen: (previous, current) {
            if (current is FavouriteAddState) return true;
            if (current is FavouriteRemoveState) return true;
            return false;
          },
          listener: (context, state) {
            homeCubit.onFavouriteChanged();
          },
        ),
      ],
      child: const HomeView(),
    );
  }
}
