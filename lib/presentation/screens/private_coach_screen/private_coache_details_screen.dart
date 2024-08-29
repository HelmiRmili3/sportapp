import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/app_colors.dart';
import '../../../data/models/appointment_model.dart';
import '../../../data/models/coach_model.dart';

class CoachDetailScreen extends StatefulWidget {
  CoachModel modelData;
  CoachDetailScreen({
    super.key,
    required this.modelData,
  });

  @override
  State<CoachDetailScreen> createState() => _CoachDetailScreenState();
}

class _CoachDetailScreenState extends State<CoachDetailScreen> {
  GoogleMapController? mapController;

  List<AppointmentModel> schedule = [
    AppointmentModel(booked: true, time: '15:50'),
    AppointmentModel(booked: false, time: '16:10'),
    AppointmentModel(booked: true, time: '17:30'),
    AppointmentModel(booked: false, time: '18:20'),
  ];
  @override
  Widget build(BuildContext context) {
    // GlobalKey<FormState> formState = GlobalKey<FormState>();
    // String googleApikey = "YOUR_GOOGLE_API_KEY";
    // CameraPosition? cameraPosition;
    // String startLocationDescription = "Destination Location";
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
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
                width: 350.w,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    widget.modelData.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 140.w, right: 5.w),
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColors.seGreen,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100)),
                      ),
                      child: Center(
                          child: Text(
                        widget.modelData.level,
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  Container(
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Theme.of(context).highlightColor, width: 2.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'Tarif',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                widget.modelData.rate,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ville ',
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  widget.modelData.city,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.modelData.name,
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
                widget.modelData.description,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).textTheme.bodySmall!.color),
              ),
              SizedBox(height: 10.h),
              Text(
                'Availability',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodySmall!.color),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Dim.\n',
                            style: TextStyle(
                                fontSize: 20, color: Colors.red.shade500),
                            children: <TextSpan>[
                              TextSpan(
                                text: '19/05',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 260.w,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: schedule.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  height: 45,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.seGreen,
                                  ),
                                  child: Center(
                                      child: Text(
                                    schedule[index].time,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )));
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ]),
          ),
        ));
  }
}
