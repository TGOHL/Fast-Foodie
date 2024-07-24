import 'package:fast_foodie/shared/config/styles.dart';
import 'package:fast_foodie/shared/cubit/favourite/favourite_cubit.dart';
import 'package:fast_foodie/shared/enums/list_style.dart';
import 'package:fast_foodie/shared/helpers/get_it.dart';
import 'package:fast_foodie/shared/widgets/list_style_icon.dart';
import 'package:fast_foodie/shared/widgets/loading.dart';
import 'package:fast_foodie/shared/widgets/place_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_foodie/shared/helpers/toast_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'favourite_view.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = '/favourite-screen';

  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        if (state is FavouriteErrorState) {
          ToastHelper.of(context).showError(state.error.toString());
        }
      },
      child: const FavouriteView(),
    );
  }
}
