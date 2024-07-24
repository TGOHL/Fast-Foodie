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
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: placeModel.id,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CustomCachedImage(
                          imageUrl: cubit.imageUrl,
                          placeholderAsset: AppAssets.placePlaceHolder,
                          fit: BoxFit.cover,
                          width: ScreenUtil().screenWidth,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  color: Colors.orangeAccent.shade100.withOpacity(.2),
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: PlantPieceOfInfo(
                              title: 'Name',
                              value: placeModel.name,
                              overflow: TextOverflow.clip,
                              direction: Direction.vertical,
                            ),
                          ),
                          SizedBox(
                            width: 8.h,
                          ),
                          Expanded(
                            child: PlantPieceOfInfo(
                              title: 'Status',
                              value: placeModel.availability.label,
                              overflow: TextOverflow.clip,
                              direction: Direction.vertical,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: PlantPieceOfInfo(
                              title: 'Address',
                              value: placeModel.getAddress,
                              overflow: TextOverflow.clip,
                              direction: Direction.vertical,
                            ),
                          ),
                          SizedBox(
                            width: 8.h,
                          ),
                          Expanded(
                            child: PlantPieceOfInfo(
                              title: 'Distance',
                              value: placeModel.distanceFormated,
                              overflow: TextOverflow.clip,
                              direction: Direction.vertical,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220.h,
                    decoration: BoxDecoration(color: Colors.black12, border: Border.all(color: Colors.grey.shade300)),
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(homeCubit.myLocation.latitude, homeCubit.myLocation.longitude),
                        zoom: 12,
                      ),
                      markers: Set.from(cubit.allMarkers),
                      onMapCreated: (controller) async {
                        cubit.setGoogleController = controller;
                        cubit.addMarker();
                        await cubit.moveAnimateToAddress();
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: MainButton(
                    label: 'Open Maps',
                    onPressed: cubit.onMapTap,
                    width: ScreenUtil().screenWidth,
                    color: AppThemes.secondaryDark,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
