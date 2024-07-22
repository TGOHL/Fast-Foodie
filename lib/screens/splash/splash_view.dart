part of 'splash_layout.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<SplashCubit, SplashState>(
        buildWhen: (_, current) {
          return true;
        },
        builder: (context, state) {
          return Center();
        },
      ),
    );
  }
}
