import 'package:fast_foodie/screens/details/cubit/details_cubit.dart';
import 'package:fast_foodie/shared/config/assets.dart';
import 'package:fast_foodie/shared/config/themes.dart';
import 'package:fast_foodie/shared/enums/direction.dart';
import 'package:fast_foodie/shared/helpers/get_it.dart';
import 'package:fast_foodie/shared/models/app/place.dart';
import 'package:fast_foodie/shared/widgets/custom_cached_image.dart';
import 'package:fast_foodie/shared/widgets/main_button.dart';
import 'package:fast_foodie/shared/widgets/piece_of_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_foodie/shared/helpers/toast_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'details_view.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details-screen';

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as List;
    final place = data[0] as PlaceModel;
    String? url;
    if (data.length > 1) {
      url = data[1] as String?;
    }
    return BlocProvider(
      create: (context) => DetailsCubit()..init(place, url),
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
