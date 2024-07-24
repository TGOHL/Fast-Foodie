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
            padding: EdgeInsets.all(16.w).copyWith(top: 8.w),
            itemCount: cubit.restaurants.length + 1,
            itemBuilder: (_, i) {
              if (i == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        '${homeCubit.restaurants.length} Restaurants',
                        style: AppStyles.mainTextStyle,
                      ),
                      const Spacer(),
                      ...ListStyle.values.map(
                        (e) => ListStyleIcon(
                          listStyle: e,
                          isSelected: e == homeCubit.listStyel,
                          onTap: () => homeCubit.changeListStyle(e),
                        ),
                      )
                    ],
                  ),
                );
              }
              final rest = cubit.restaurants[i - 1];
              return PlaceTile(
                placeModel: rest,
                isFavourite: favouriteCubit.isFavourite(rest.id),
                listStyle: homeCubit.listStyel,
                onChangeFavouriteTap: () {
                  favouriteCubit.toggleFavourite(rest);
                },
              );
            },
          ),
        );
      },
    );
  }
}
