part of 'details_layout.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DetailsCubit>();
    final placeModel = cubit.placeModel;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Restaurant Details'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<DetailsCubit, DetailsState>(
        buildWhen: (_, current) {
          return true;
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
            child: Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: placeModel.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CustomCachedImage(
                        imageUrl: null,
                        placeholderAsset: AppAssets.placePlaceHolder,
                        fit: BoxFit.cover,
                        width: ScreenUtil().screenWidth,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12.w, 24.h, 0, 24.h),
                  child: Column(
                    children: [
                      PlantPieceOfInfo(
                        title: 'Name:',
                        value: placeModel.name,
                        overflow: TextOverflow.clip,
                      ),
                      SizedBox(height: 8.h),
                      PlantPieceOfInfo(
                        title: 'Address:',
                        value: placeModel.getAddress,
                        overflow: TextOverflow.clip,
                      ),
                      SizedBox(height: 8.h),
                      PlantPieceOfInfo(
                        title: 'Distance:',
                        value: placeModel.distance,
                        overflow: TextOverflow.clip,
                      ),
                      SizedBox(height: 8.h),
                      PlantPieceOfInfo(
                        title: 'Status:',
                        value: placeModel.availability.label,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
                Line(
                  width: ScreenUtil().screenWidth,
                  color: Colors.black12,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.w),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250.h,
                    decoration: BoxDecoration(color: Colors.black12, border: Border.all(color: Colors.grey.shade300)),
                    child: GoogleMap(
                      initialCameraPosition: kGooglePlex,
                      markers: Set.from(cubit.allMarkers),
                      onMapCreated: (controller) async {
                        cubit.setGoogleController = controller;
                        await cubit.moveAnimateToAddress();
                        cubit.addMarker();
                      },
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      zoomGesturesEnabled: true,
                      scrollGesturesEnabled: false,
                      tiltGesturesEnabled: false,
                      rotateGesturesEnabled: false,
                      indoorViewEnabled: true,
                    ),
                  ),
                ),
                MainButton(
                  label: 'Open Maps',
                  onPressed: cubit.onMapTap,
                  width: ScreenUtil().screenWidth,
                  color: AppThemes.secondaryDark,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
