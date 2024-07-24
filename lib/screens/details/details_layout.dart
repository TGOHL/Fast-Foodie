import 'package:fast_foodie/screens/details/cubit/details_cubit.dart';
import 'package:fast_foodie/shared/config/assets.dart';
import 'package:fast_foodie/shared/config/themes.dart';
import 'package:fast_foodie/shared/models/app/place.dart';
import 'package:fast_foodie/shared/widgets/custom_cached_image.dart';
import 'package:fast_foodie/shared/widgets/main_button.dart';
import 'package:fast_foodie/shared/widgets/piece_of_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_foodie/shared/helpers/toast_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'details_view.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details-screen';

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palce = ModalRoute.of(context)!.settings.arguments as PlaceModel;
    return BlocProvider(
      create: (context) => DetailsCubit()..init(palce),
      child: BlocListener<DetailsCubit, DetailsState>(
        listener: (context, state) {
          if (state is DetailsErrorState) {
            ToastHelper.of(context).showError(state.error.toString());
          }
        },
        child: const DetailsView(),
      ),
    );
  }
}
