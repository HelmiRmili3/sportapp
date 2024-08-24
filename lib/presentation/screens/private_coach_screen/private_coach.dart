import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';

import '../../../core/routes/route_names.dart';
import '../../../data/models/appointment_model.dart';
import '../../../data/models/coach_model.dart';

class PrivateCoach extends StatefulWidget {
  const PrivateCoach({super.key});

  @override
  State<PrivateCoach> createState() => _PrivateCoachState();
}

class _PrivateCoachState extends State<PrivateCoach> {
  List<CoachModel> model = [
    CoachModel(
        image: 'assets/Images/coach1.jpeg',
        name: 'Marie-Claire Martin',
        description:
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries''',
        level: 'Third-party',
        rate: '25€. Secteur 1',
        city: 'Bordeaux Wine Region - Bordeaux'),
    CoachModel(
        image: 'assets/Images/coach2.jpeg',
        name: 'Nicolas Dubois',
        description:
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries''',
        level: 'advance fees',
        rate: '35€. Secteur 1',
        city: 'Chamonix-Mont-Blanc - French Alps'),
    CoachModel(
        image: 'assets/Images/coach3.jpeg',
        name: 'Sophie Leclerc',
        description:
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries''',
        level: 'bank transfer',
        rate: '50€. Secteur 1',
        city: 'Mont Saint-Michel - Normandy'),
  ];

  List<AppointmentModel> schedule = [
    AppointmentModel(booked: true, time: '15:50'),
    AppointmentModel(booked: false, time: '16:10'),
    AppointmentModel(booked: true, time: '17:30'),
    AppointmentModel(booked: false, time: '18:20'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 55),
              child: Text(
                'Liste des entraîneurs',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).textTheme.bodySmall!.color),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 405,
                child: Row(
                  children: [
                    Container(
                      width: 270,
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 2, // Spread radius
                            blurRadius: 8, // Blur radius
                            offset:
                                const Offset(0, 3), // Offset position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                        decoration: InputDecoration(
                          filled: true,
                          // Makes the background color visible
                          fillColor: Theme.of(context).primaryColor,
                          // Set background color to white
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          // Add padding
                          enabledBorder: OutlineInputBorder(
                            // Define a border without color
                            borderRadius: BorderRadius.circular(40.0),
                            // Set rounded corners
                            borderSide: BorderSide.none, // Remove border color
                          ),
                          focusedBorder: OutlineInputBorder(
                            // Define green border for focus
                            borderRadius: BorderRadius.circular(40.0),
                            borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2.0), // Green border
                          ),
                          prefixIcon: Icon(Icons.search,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color),
                          // Add prefix icon
                          suffixIcon: Container(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/Images/map.svg',
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              // semanticsLabel: 'Acme Logo'
                            ),
                          ), // Add suffix icon
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
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
                          color: Theme.of(context).textTheme.bodySmall!.color,
                          semanticsLabel: 'Acme Logo'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                height: 700,
                child: ListView.builder(
                  itemCount: model.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          context.push(AppRouteConstants.coachDetail,
                              extra: model[index]);
                        },
                        child: Container(
                          //height: 270,
                          width: 350, margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 8, // Blur radius
                                  offset: const Offset(
                                      0, 2), // Offset position of shadow
                                ),
                              ],
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(15)),

                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.seGreen,
                                  radius: 28,
                                  backgroundImage:
                                      AssetImage(model[index].image),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  model[index].name,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  model[index].description,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(left: 100),
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: AppColors.seGreen,
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(100),
                                              bottomLeft: Radius.circular(100)),
                                        ),
                                        child: Center(
                                            child: Text(
                                          model[index].level,
                                          style:
                                              TextStyle(color: AppColors.white),
                                        )),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Colors.grey.shade400,
                                            width: 2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Tarif',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade500,
                                                      fontSize: 14),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  model[index].rate,
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .color,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ville ',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade500,
                                                      fontSize: 14),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    model[index].city,
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .color,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                  height: 15,
                                ),
                                ListView.builder(
                                  itemCount: 2,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'Dim.\n',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red.shade500),
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
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 5),
                                                    height: 45,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: AppColors.seGreen,
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      schedule[index].time,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )));
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
