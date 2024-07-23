part of 'favourite_layout.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Favourites'),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<FavouriteCubit, FavouriteState>(
        buildWhen: (_, current) {
          return true;
        },
        builder: (context, state) {
          final cubit = context.read<FavouriteCubit>();

          if (!cubit.isInitailized) {
            return const Center(
              child: Loading(),
            );
          }
          if (cubit.restaurants.isEmpty) {
            return Center(
              child: Text(
                'You have no favaourite',
                style: AppStyles.mainTextStyle,
              ),
            );
          }
          return ListView.builder(
            controller: cubit.scrollController,
            padding: EdgeInsets.all(16.w),
            itemCount: cubit.restaurants.length,
            itemBuilder: (_, i) {
              return PlaceTile(
                placeModel: cubit.restaurants[i],
                isFavourite: true,
                onChangeFavouriteTap: () {
                  favouriteCubit.toggleFavourite(cubit.restaurants[i]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
