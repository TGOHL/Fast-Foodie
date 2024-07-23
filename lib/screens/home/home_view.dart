part of 'home_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        if (state is HomeGeolocatorErrorState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.error.toString(),
                textAlign: TextAlign.center,
                style: AppStyles.mainTextStyle,
              ),
              SizedBox(
                height: 12.h,
              ),
              if (state.error.state == LocationPermission.denied)
                MainButton(
                  label: 'Enable Permission',
                  filled: false,
                  onPressed: () {
                    context.read<HomeCubit>().init();
                  },
                )
            ],
          );
        }
        if (!cubit.isInitailized) {
          return const Scaffold(
            body: Center(
              child: Loading(),
            ),
          );
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Nearby Restaurants'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(FavouriteScreen.routeName);
                },
                icon: const Icon(
                  Icons.favorite_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: ListView.builder(
            controller: cubit.scrollController,
            padding: EdgeInsets.all(16.w),
            itemCount: cubit.restaurants.length,
            itemBuilder: (_, i) {
              return PlaceTile(
                placeModel: cubit.restaurants[i],
                isFavourite: favouriteCubit.isFavourite(cubit.restaurants[i].id),
                onChangeFavouriteTap: () {
                  favouriteCubit.toggleFavourite(cubit.restaurants[i]);
                },
              );
            },
          ),
        );
      },
    );
  }
}
