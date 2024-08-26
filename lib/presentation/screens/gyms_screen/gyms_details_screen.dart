import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';
import 'package:sportapp/presentation/controllers/home_controller.dart';

import '../../../core/routes/route_names.dart';

class GymDetailScreen extends StatefulWidget {
  const GymDetailScreen({super.key});

  @override
  State<GymDetailScreen> createState() => _GymDetailScreenState();
}

class _GymDetailScreenState extends State<GymDetailScreen> {
  HomeController homeController = Get.find();
  List<PackageModel> model = [
    PackageModel(name: 'Monthly', pkg: [
      '450 free Video call minutes',
      'Chat with Coach',
      'free Consultation',
    ]),
    PackageModel(name: 'Yearly', pkg: [
      'Free Protien Shake daily',
      '5000 free Video call minutes',
      'free Consultation',
    ]),
  ];
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    String googleApikey = "YOUR_GOOGLE_API_KEY";
    GoogleMapController? mapController;
    CameraPosition? cameraPosition;
    String startLocationDescription = "Destination Location";
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        bottomNavigationBar: Container(
          height: 150,
          padding: const EdgeInsets.all(10),
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            padding: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Center(
                  child: Text(
                    S.of(context).tryItFor7Day,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodySmall!.color),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.seGreen,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                            color: Theme.of(context).primaryColor),
                        child: Icon(
                          Icons.sports_volleyball_rounded,
                          size: 20,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).oneSubscription,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              S.of(context).accessTo132RoomToTunisie,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w200),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              context.go(AppRouteConstants.dashboardScreen, extra: 4);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.seGreen),
              child: const Center(
                  child: Icon(
                Icons.arrow_back_ios,
                size: 15,
              )),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 270,
                width: 350,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/Images/jim.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).nameGyms,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodySmall!.color),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                      Text(
                        '233 Km',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 10.h),
              Text(
                'Location',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodySmall!.color),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Container(
                  height: 150.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: GoogleMap(
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
                      });
                    },
                    markers: {
                      Marker(
                        markerId: const MarkerId("startLocation"),
                        position: LatLng(
                          homeController.lat,
                          homeController.long,
                        ),
                        infoWindow: InfoWindow(
                          title: startLocationDescription,
                        ),
                      ),
                    },
                    onTap: (latLng) {
                      homeController.changeLatAdnLong(
                        latitude: latLng.latitude.toString(),
                        longitude: latLng.longitude.toString(),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              const Text(
                'Programs',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Monday',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        'Tuesday',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        'Wednesday',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        'Thursday',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        'Friday',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        'Saturday',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        'Sunday',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    children: [
                      Text(
                        '8:00am to 12:00pm',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        '8:00am to 12:00pm',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        '8:00am to 12:00pm',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        '8:00am to 12:00pm',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        '8:00am to 12:00pm',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        '8:00am to 12:00pm',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                      Text(
                        'off',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                'Plans',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodySmall!.color),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: 300.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.seGreen),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            model[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          for (var coachName in model[index].pkg)
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 5),
                              child: Row(
                                children: [
                                  const Icon(Icons.check),
                                  Text(coachName),
                                ],
                              ),
                            ),
                          const SizedBox(height: 10),
                          Container(
                            height: 35.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color),
                            child: Center(
                                child: Text(
                              'Subscribe',
                              style: TextStyle(color: AppColors.seGreen),
                            )),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ]),
          ),
        ));
  }
}

class PackageModel {
  String name;
  List<String> pkg;
  PackageModel({required this.name, required this.pkg});
}
