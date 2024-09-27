import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';
import 'package:sportapp/presentation/controllers/home_controller.dart';
import 'package:sportapp/presentation/screens/gyms_screen/widgets/costom_text_widget.dart';

import '../../../core/routes/route_names.dart';
import '../../../data/models/package_model.dart';
import 'map_screen.dart';
import 'widgets/costom_title_widget.dart';

class GymDetailScreen extends StatefulWidget {
  const GymDetailScreen({super.key});

  @override
  State<GymDetailScreen> createState() => _GymDetailScreenState();
}

class _GymDetailScreenState extends State<GymDetailScreen> {
  HomeController homeController = Get.find();
  GoogleMapController? mapController;

  List<PackageModel> model = [
    PackageModel(
      name: 'Monthly',
      pkg: [
        '450 free Video call minutes',
        'Chat with Coach',
        'free Consultation',
      ],
    ),
    PackageModel(
      name: 'Yearly',
      pkg: [
        'Free Protien Shake daily',
        '5000 free Video call minutes',
        'free Consultation',
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        bottomNavigationBar: Container(
          height: 150.h,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              5.verticalSpace,
              Center(
                child: Text(
                  S.of(context).tryItFor7Day,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Theme.of(context).textTheme.bodySmall!.color),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                        size: 20.sp,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).oneSubscription,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            S.of(context).accessTo132RoomToTunisie,
                            style: const TextStyle(fontWeight: FontWeight.w200),
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Gym Details",
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodySmall!.color),
          ),
          leading: GestureDetector(
            onTap: () {
              context.go(
                AppRouteConstants.dashboardScreen,
                extra: 4,
              );
            },
            child: Container(
              margin: EdgeInsets.all(10.h),
              height: 5.h,
              width: 5.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.seGreen),
              child: Center(
                  child: Icon(
                Icons.arrow_back_ios,
                size: 15.sp,
              )),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 270.h,
                width: 350.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  'assets/Images/jim.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).nameGyms,
                    style: TextStyle(
                        fontSize: 16.sp,
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
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 10.h),
              const CostomTitleWidget(title: 'Location'),
              SizedBox(height: 10.h),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // context.go(
                    //   AppRouteConstants.mapScreen,
                    //   extra: 4,
                    // );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapScreen(),
                        ));
                  },
                  child: Container(
                    height: 150.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      child: Image.network(
                          fit: BoxFit.cover,
                          'https://media.istockphoto.com/id/1308342065/vector/folded-location-map-with-marker-city-map-with-pin-pointer-gps-navigation-map-with-city.jpg?s=612x612&w=0&k=20&c=E9DP4dIwSdwaveNwcYU2LzBeKuBoKLa7nsTxTWDHObw='),
                    ),
                    //   child: GoogleMap(
                    //     initialCameraPosition: CameraPosition(
                    //       target: LatLng(
                    //         homeController.lat,
                    //         homeController.long,
                    //       ),
                    //       zoom: 15,
                    //     ),
                    //     onMapCreated: (controller) {
                    //       setState(() {
                    //         mapController = controller;
                    //       });
                    //     },
                    //     markers: {
                    //       Marker(
                    //         markerId: const MarkerId("startLocation"),
                    //         position: LatLng(
                    //           homeController.lat,
                    //           homeController.long,
                    //         ),
                    //         infoWindow: InfoWindow(
                    //           title: startLocationDescription,
                    //         ),
                    //       ),
                    //     },
                    //     onTap: (latLng) {
                    //       homeController.changeLatAdnLong(
                    //         latitude: latLng.latitude.toString(),
                    //         longitude: latLng.longitude.toString(),
                    //       );
                    //     },
                    //   ),
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              const CostomTitleWidget(title: "Programs"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CostomTextWidget(day: 'Monday'),
                      CostomTextWidget(day: 'Tuesday'),
                      CostomTextWidget(day: 'Wednesday'),
                      CostomTextWidget(day: 'Thursday'),
                      CostomTextWidget(day: 'Friday'),
                      CostomTextWidget(day: 'Saturday'),
                      CostomTextWidget(day: 'Sunday'),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  const Column(
                    children: [
                      CostomTextWidget(day: '8:00am to 12:00pm'),
                      CostomTextWidget(day: '8:00am to 12:00pm'),
                      CostomTextWidget(day: '8:00am to 12:00pm'),
                      CostomTextWidget(day: '8:00am to 12:00pm'),
                      CostomTextWidget(day: '8:00am to 12:00pm'),
                      CostomTextWidget(day: '8:00am to 12:00pm'),
                      CostomTextWidget(day: 'Off'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              const CostomTitleWidget(title: "Plans"),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10.h),
                      width: 300.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.seGreen),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          Text(
                            model[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
                          ),
                          SizedBox(height: 10.h),
                          for (var coachName in model[index].pkg)
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5.w,
                                right: 5.w,
                                top: 5.h,
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.check),
                                  Text(coachName),
                                ],
                              ),
                            ),
                          SizedBox(height: 10.h),
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
