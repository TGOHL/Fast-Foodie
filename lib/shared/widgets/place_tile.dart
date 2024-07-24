import 'package:fast_foodie/screens/details/details_layout.dart';
import 'package:fast_foodie/shared/config/assets.dart';
import 'package:fast_foodie/shared/config/themes.dart';
import 'package:fast_foodie/shared/enums/list_style.dart';
import 'package:fast_foodie/shared/helpers/maps.dart';
import 'package:fast_foodie/shared/models/app/place.dart';
import 'package:fast_foodie/shared/widgets/custom_cached_image.dart';
import 'package:fast_foodie/shared/widgets/main_button.dart';
import 'package:fast_foodie/shared/widgets/piece_of_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceTile extends StatelessWidget {
  final PlaceModel placeModel;
  final bool isFavourite;
  final ListStyle listStyle;
  final VoidCallback onChangeFavouriteTap;
  const PlaceTile({
    super.key,
    required this.placeModel,
    required this.isFavourite,
    required this.onChangeFavouriteTap,
    this.listStyle = ListStyle.large,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DetailsScreen.routeName, arguments: placeModel);
      },
      child: Card(
        color: Colors.white,
        child: listStyle == ListStyle.large
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CustomCachedImage(
                        imageUrl: null,
                        placeholderAsset: AppAssets.placePlaceHolder,
                        fit: BoxFit.cover,
                        width: ScreenUtil().screenWidth,
                        height: 160.h,
                      ),
                      Positioned(
                        top: 6.w,
                        right: 6.w,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white54),
                          child: IconButton(
                            onPressed: onChangeFavouriteTap,
                            icon: Icon(
                              isFavourite ? Icons.favorite_outlined : Icons.favorite_border_rounded,
                              color: AppThemes.secondaryLight,
                              size: 26.w,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PlantPieceOfInfo(
                          title: 'Name:',
                          value: placeModel.name,
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(height: 6.h),
                        PlantPieceOfInfo(
                          title: 'Address:',
                          value: placeModel.getAddress,
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(height: 6.h),
                        PlantPieceOfInfo(
                          title: 'Distance:',
                          value: placeModel.distance,
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(height: 12.h),
                        MainButton(
                          label: 'Open Maps',
                          onPressed: () {
                            MapHelper.openMap(placeModel.locationModel.latitude, placeModel.locationModel.longitude);
                          },
                          filled: false,
                          width: ScreenUtil().screenWidth,
                          color: AppThemes.secondaryDark,
                        )
                      ],
                    ),
                  ),
                ],
              )
            : Row(
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
