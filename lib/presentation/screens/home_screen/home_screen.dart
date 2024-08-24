import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/presentation/controllers/home_controller.dart';

import '../../../data/models/room_molel.dart';
import '../../../generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

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
  String _searchText = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openSubscriptioSheet(context, homeController);
    });
  }

  void _openSubscriptioSheet(
    BuildContext context,
    HomeController homeController,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 200,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "List",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall!.color,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                homeController.updateList();
              },
              child: Container(
                height: 80,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                            image: AssetImage('assets/Images/jim.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "signle Subscription",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodySmall!.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "subtitle",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodySmall!.color,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openCityBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Search field with OutlineBorde
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          S.of(context).chooseCity,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.black.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                  child: Icon(
                                Icons.close,
                                size: 20,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                              ))),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodySmall!.color),
                      decoration: InputDecoration(
                        hintText: 'Search City',
                        hintStyle: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onChanged: (text) {
                        setState(() {
                          _searchText = text;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _searchText.isEmpty
                        ? allCities.length
                        : filteredCities.length,
                    itemBuilder: (context, index) {
                      final city = _searchText.isEmpty
                          ? allCities[index]
                          : filteredCities[index];
                      return ListTile(
                        title: Text(
                          city,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

// Function to filter cities based on search text
  List<String> get filteredCities => allCities
      .where((city) => city.toLowerCase().contains(_searchText.toLowerCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: Platform.isIOS ? 50.h : 30.h),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        homeController.lat.value, homeController.long.value),
                    zoom: 15,
                  ),
                  onMapCreated: (controller) {
                    setState(() {
                      mapController = controller;
                      // Get the location at index 0
                      var firstLocation = homeController.pageViewModel.first;
                      var latLng = LatLng(
                        double.parse(firstLocation.lat.toString()),
                        double.parse(firstLocation.long.toString()),
                      );
                      // Animate camera to the marker at index 0
                      mapController?.animateCamera(
                        CameraUpdate.newLatLngZoom(latLng, 10),
                      );
                    });
                  },
                  markers: _createMarkers(
                      gymName: "newGym", context, homeController),
                  onTap: (latLng) {
                    homeController.changeLatAdnLong(
                      latitude: latLng.latitude.toString(),
                      longitude: latLng.longitude.toString(),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 405.w,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 270.w,
                              margin: EdgeInsets.only(left: 5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color),
                                onTap: () async {
                                  var place = await PlacesAutocomplete.show(
                                    context: context,
                                    apiKey: googleApikey,
                                    mode: Mode.overlay,
                                    types: [],
                                    strictbounds: false,
                                    components: [],
                                    onError: (err) {
                                      print(err);
                                    },
                                  );

                                  if (place != null) {
                                    setState(() {
                                      startLocationDescription =
                                          place.description.toString();
                                    });

                                    final plist = GoogleMapsPlaces(
                                      apiKey: googleApikey,
                                      apiHeaders: await const GoogleApiHeaders()
                                          .getHeaders(),
                                    );
                                    String placeid = place.placeId ?? "0";
                                    final detail = await plist
                                        .getDetailsByPlaceId(placeid);
                                    final geometry = detail.result.geometry!;
                                    final lat = geometry.location.lat;
                                    final lang = geometry.location.lng;
                                    var newlatlang = LatLng(lat, lang);

                                    mapController?.animateCamera(
                                      CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                            target: newlatlang, zoom: 17),
                                      ),
                                    );
                                  }
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Theme.of(context).primaryColor,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
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
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                  semanticsLabel: 'Acme Logo',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          height: 40.h,
                          child: ListView.builder(
                            itemCount: model.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ActionChip(
                                  onPressed: () {
                                    // Add your action here
                                  },
                                  avatar: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      // color: Colors.white,
                                    ),
                                    child: SvgPicture.asset(
                                      model[index].image,
                                      height: 20,
                                      width: 20,
                                      color: index == 0
                                          ? Theme.of(context).splashColor
                                          : Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .color, // Change the color as needed
                                    ),
                                  ),
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
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
                                          .color, // Change the color as needed
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
                homeController.showList.value
                    ? SizedBox(
                        height: 380.h,
                        child: PageView.builder(
                          onPageChanged: (newIndex) {
                            var newLatLng = LatLng(
                              double.parse(homeController
                                  .pageViewModel[newIndex].lat
                                  .toString()),
                              double.parse(homeController
                                  .pageViewModel[newIndex].long
                                  .toString()),
                            );
                            mapController?.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(target: newLatLng, zoom: 10),
                              ),
                            );
                            Future.microtask(
                                () => homeController.setCurrentIndex(newIndex));
                          },
                          itemCount: homeController.pageViewModel.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 40),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 70),
                                width: double.infinity,
                                height: 200.h,
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 150.h,
                                      width: double.infinity,
                                      margin: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/Images/jim.png'),
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            S.of(context).nameGyms,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .color,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            S.of(context).addressGyms,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .color),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Container()
              ],
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
            homeController.currentIndex == i
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
