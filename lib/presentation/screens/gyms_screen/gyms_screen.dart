import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/routes/route_names.dart';
import '../../../data/models/room_molel.dart';

class GymsScreen extends StatefulWidget {
  const GymsScreen({super.key});

  @override
  State<GymsScreen> createState() => _GymsScreenState();
}

class _GymsScreenState extends State<GymsScreen> {
  List<RoomModel> model = [
    RoomModel(image: 'assets/Images/pro.svg', name: 'Pro'),
    RoomModel(image: 'assets/Images/apptitide.svg', name: 'Aptitude'),
    RoomModel(image: 'assets/Images/cardio.svg', name: 'Cardio'),
    RoomModel(image: 'assets/Images/aerobique.svg', name: 'Aérobique'),
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
              padding: EdgeInsets.only(top: 55.h, left: 20.w, right: 20.w),
              child: Text(
                S.of(context).listOfGymsSausse,
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
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
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
                              // ignore: deprecated_member_use
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
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                height: 35.h,
                child: ListView.builder(
                  itemCount: model.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Theme.of(context).primaryColor),
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
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 580,
                child: ListView.builder(
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouteConstants.gymDetailScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: 240,
                              width: double.infinity,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).primaryColor),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).nameGyms,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .color),
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
                              ),
                            ),
                            Container(
                                height: 175,
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image:
                                          AssetImage('assets/Images/jim.png')),
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
