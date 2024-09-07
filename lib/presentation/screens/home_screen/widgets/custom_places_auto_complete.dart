import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sportapp/main.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import '../../../../core/app_colors.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../generated/l10n.dart';

class LocationAutoComplete extends StatefulWidget {
  const LocationAutoComplete({super.key});

  @override
  LocationAutoCompleteState createState() => LocationAutoCompleteState();
}

class LocationAutoCompleteState extends State<LocationAutoComplete> {
  final searchController = TextEditingController();
  final String token = '1234567890';
  var uuid = const Uuid();
  List<dynamic> listOfLocation = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      _onChange();
    });
  }

  _onChange() {
    placeSuggestion(searchController.text);
  }

  void placeSuggestion(String input) async {
    const String apiKey = "AIzaSyDQ2c_pOSOFYSjxGMwkFvCVWKjYOM9siow";
    try {
      String baseUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json";
      String request = '$baseUrl?input=$input&key=$apiKey&sessiontoken=$token';
      var response = await http.get(Uri.parse(request));
      var data = json.decode(response.body);
      if (kDebugMode) {
        print(data);
      }
      if (response.statusCode == 200) {
        setState(() {
          listOfLocation = json.decode(response.body)['predictions'];
        });
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // backgroundColor: const Color.fromARGB(179, 250, 250, 250),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search place...",
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .color!
                                  .withOpacity(.3)),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            5.horizontalSpace,
            Container(
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: IconButton(
                icon: Icon(Icons.close,
                    color: Theme.of(context).textTheme.bodySmall!.color),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text(
              "Resultat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodySmall!.color,
              ),
            ),
            10.verticalSpace,
            const Divider(
              thickness: .5,
            ),
            10.verticalSpace,
            Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.seGreen,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    // height: 40.h,
                    // width: 35.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // shape: BoxShape.rectangle,
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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
