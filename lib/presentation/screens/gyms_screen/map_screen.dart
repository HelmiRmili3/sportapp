import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/app_colors.dart';
import '../../../core/routes/route_names.dart';
import '../../controllers/home_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  HomeController homeController = Get.find();
  GoogleMapController? mapController;
  String startLocationDescription = "Destination Location";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "Location",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
        elevation: 0,
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
      body: GoogleMap(
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
    );
  }
}
