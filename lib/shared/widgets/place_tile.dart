import 'package:fast_foodie/screens/details/details_layout.dart';
import 'package:fast_foodie/shared/config/assets.dart';
import 'package:fast_foodie/shared/config/themes.dart';
import 'package:fast_foodie/shared/models/app/place.dart';
import 'package:fast_foodie/shared/widgets/custom_cached_image.dart';
import 'package:fast_foodie/shared/widgets/piece_of_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceTile extends StatelessWidget {
  final PlaceModel placeModel;
  final bool isFavourite;
  final VoidCallback onChangeFavouriteTap;
  const PlaceTile({super.key, required this.placeModel, required this.isFavourite, required this.onChangeFavouriteTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DetailsScreen.routeName, arguments: placeModel);
      },
      child: Card(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(8)),
              child: CustomCachedImage(
                imageUrl: null,
                placeholderAsset: AppAssets.placePlaceHolder,
                fit: BoxFit.cover,
                width: 90.w,
                height: 90.w,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: SizedBox(
                height: 90.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlantPieceOfInfo(
                      title: 'Name:',
                      value: placeModel.name,
                    ),
                    SizedBox(height: 6.h),
                    PlantPieceOfInfo(
                      title: 'Address:',
                      value: placeModel.getAddress,
                    ),
                    SizedBox(height: 6.h),
                    PlantPieceOfInfo(
                      title: 'Distance:',
                      value: placeModel.distance,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              children: [
                IconButton(
                  onPressed: onChangeFavouriteTap,
                  icon: Icon(
                    isFavourite ? Icons.favorite_outlined : Icons.favorite_border_rounded,
                    color: AppThemes.secondaryLight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
