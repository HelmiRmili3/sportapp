import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/presentation/controllers/home_controller.dart';
import 'package:sportapp/presentation/screens/home_screen/widgets/city_model.dart';

import '../../../core/routes/route_names.dart';
import '../../../data/models/room_molel.dart';
import '../../../generated/l10n.dart';
import 'widgets/custom_places_auto_complete.dart';
import 'widgets/gyms_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String googleApikey = "YOUR_GOOGLE_API_KEY";
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  String startLocationDescription = "Destination Location";
  List<RoomModel> model = [
    RoomModel(image: 'assets/Images/pro.svg', name: 'Pro'),
    RoomModel(image: 'assets/Images/apptitide.svg', name: 'Aptitude'),
    RoomModel(image: 'assets/Images/cardio.svg', name: 'Cardio'),
    RoomModel(image: 'assets/Images/aerobique.svg', name: 'Aérobique'),
  ];
  final allCities = [
    'Paris',
    'Marseille',
    'Lyon',
    'Toulouse',
    'Bordeaux',
    'Nice',
    // ... Add more cities
  ];
  final String _searchText = '';

  void _openCityBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      enableDrag: true,
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const SingleChildScrollView(
            child: CityBottomSheet(),
          ),
        );
      },
    );
  }

  void _openGymListBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      enableDrag: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: GymListBottomSheet(
              model: model,
            ),
          ),
        );
      },
    );
  }

  List<String> get filteredCities => allCities
      .where((city) => city.toLowerCase().contains(_searchText.toLowerCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                homeController.lat,
                homeController.long,
              ),
              zoom: 15,
            ),
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
                var firstLocation = homeController.pageViewModel.first;
                var latLng = LatLng(
                  double.parse(firstLocation.lat.toString()),
                  double.parse(firstLocation.long.toString()),
                );
                mapController?.animateCamera(
                  CameraUpdate.newLatLngZoom(latLng, 10),
                );
              });
            },
            markers: _createMarkers(gymName: "newGym", context, homeController),
            onTap: (latLng) {
              homeController.changeLatAdnLong(
                latitude: latLng.latitude.toString(),
                longitude: latLng.longitude.toString(),
              );
            },
            zoomControlsEnabled: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0.h,
              vertical: 50.0.w,
            ),
            child: SizedBox(
              width: 405.w,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 290.w,
                        margin: EdgeInsets.only(left: 5.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .color!
                                  .withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          readOnly: true,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color),
                          onTap: () async {
                            // _showPlacesAutocomplete(context);
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const LocationAutoComplete(),
                              ),
                            );
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).primaryColor,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0),
                            ),
                            prefixIcon: Icon(Icons.search,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color),
                            suffixIcon: Container(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                'assets/Images/map.svg',
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      // this is the the part that open the city model
                      GestureDetector(
                        onTap: () {
                          _openCityBottomSheet(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.seGreen,
                          ),
                          child: SvgPicture.asset(
                            height: 5.h,
                            width: 5.w,
                            fit: BoxFit.cover,
                            'assets/Images/filter.svg',
                            // ignore: deprecated_member_use
                            color: Theme.of(context).textTheme.bodySmall!.color,
                            semanticsLabel: 'Acme Logo',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  // this the part that have list of categorys
                  SizedBox(
                    height: 40.h,
                    child: ListView.builder(
                      itemCount: model.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: ActionChip(
                            onPressed: () {
                              // function call in here
                            },
                            avatar: Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                model[index].image,
                                height: 20.h,
                                width: 20.w,
                                // ignore: deprecated_member_use
                                color: index == 0
                                    ? Theme.of(context).splashColor
                                    : Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                              ),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Text(
                              model[index].name,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 40.w),
            child: Container(
              margin: EdgeInsets.only(bottom: 70.h),
              width: double.infinity,
              height: 140.h,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).listOfGymsSausse,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodySmall!.color,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _openGymListBottomSheet(context);
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_up_outlined,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: AppColors.seGreen,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.seGreen),
                            child: Image.asset(
                              'assets/Images/app_logo.png',
                              height: 44.h,
                              width: 35.w,
                              scale: 1,
                              fit: BoxFit.cover,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.push(AppRouteConstants.subscription);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.0.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).oneSubscription,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    S.of(context).accessTo132RoomToTunisie,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w200,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.close,
                              size: 15.sp,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> _createMarkers(
    BuildContext context,
    HomeController homeController, {
    required String gymName,
  }) {
    Set<Marker> markers = {};
    for (var i = 0; i < homeController.pageViewModel.length; i++) {
      var element = homeController.pageViewModel[i];
      var latLng = LatLng(
        double.parse(element.lat.toString()),
        double.parse(element.long.toString()),
      );
      markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: latLng,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            homeController.currentIndex.value == i
                ? BitmapDescriptor.hueRed
                : BitmapDescriptor.hueRed,
          ),
          infoWindow: InfoWindow(title: '$gymName $i'),
        ),
      );
    }
    return markers;
  }
}
