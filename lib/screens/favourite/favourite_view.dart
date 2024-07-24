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
                        '${favouriteCubit.restaurants.length} Restaurants',
                        style: AppStyles.mainTextStyle,
                      ),
                      const Spacer(),
                      ...ListStyle.values.map(
                        (e) => ListStyleIcon(
                          listStyle: e,
                          isSelected: e == favouriteCubit.listStyel,
                          onTap: () => favouriteCubit.changeListStyle(e),
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
                listStyle: favouriteCubit.listStyel,
                onChangeFavouriteTap: () {
                  favouriteCubit.toggleFavourite(rest);
                },
              );
            },
          );
        },
      ),
    );
  }
}
