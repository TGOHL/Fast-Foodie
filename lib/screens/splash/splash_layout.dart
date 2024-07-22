import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast_foodie/shared/helpers/toast_helper.dart';

import 'cubit/splash_cubit.dart';

part 'splash_view.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashErrorState) {
            ToastHelper.of(context).showError(state.error.toString());
          }
        },
        child: const SplashView(),
      ),
    );
  }
}
