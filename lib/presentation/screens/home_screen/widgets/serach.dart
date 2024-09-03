// import 'package:flutter/material.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:google_api_headers/google_api_headers.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:sportapp/presentation/controllers/home_controller.dart';

// import '../../../../core/app_colors.dart';
// import '../../../../generated/l10n.dart';

// class Serach extends StatefulWidget {
//   const Serach({super.key});

//   @override
//   State<Serach> createState() => _SerachState();
// }

// class _SerachState extends State<Serach> {
//   HomeController homeController = Get.put(HomeController());

//   void _openCityBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState) => Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 10),
//                   // Search field with OutlineBorde
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Text(
//                           S.of(context).chooseCity,
//                           style: TextStyle(
//                               color:
//                                   Theme.of(context).textTheme.bodySmall!.color),
//                         ),
//                         const Spacer(),
//                         InkWell(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             height: 40,
//                             width: 40,
//                             decoration: BoxDecoration(
//                                 color: AppColors.black.withOpacity(.4),
//                                 borderRadius: BorderRadius.circular(50)),
//                             child: Center(
//                               child: Icon(
//                                 Icons.close,
//                                 size: 20,
//                                 color: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall!
//                                     .color,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: TextFormField(
//                       style: TextStyle(
//                           color: Theme.of(context).textTheme.bodySmall!.color),
//                       decoration: InputDecoration(
//                         hintText: 'Search City',
//                         hintStyle: TextStyle(
//                             color:
//                                 Theme.of(context).textTheme.bodySmall!.color),
//                         prefixIcon: Icon(
//                           Icons.search,
//                           color: Theme.of(context).textTheme.bodySmall!.color,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       onChanged: (text) {
//                         setState(() {
//                           homeController.searchText = text;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 10.0),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: homeController.searchText.isEmpty
//                         ? homeController.allCities.length
//                         : homeController.filteredCities.length,
//                     itemBuilder: (context, index) {
//                       final city = homeController.searchText.isEmpty
//                           ? homeController.allCities[index]
//                           : homeController.filteredCities[index];
//                       return ListTile(
//                         title: Text(
//                           city,
//                           style: TextStyle(
//                               color:
//                                   Theme.of(context).textTheme.bodySmall!.color),
//                         ),
//                         onTap: () => {
//                           Navigator.pop(context),
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 270.w,
//           margin: EdgeInsets.only(left: 5.w),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(40.0),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.5),
//                 spreadRadius: 1,
//                 blurRadius: 8,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           child: TextFormField(
//             style:
//                 TextStyle(color: Theme.of(context).textTheme.bodySmall!.color),
//             onTap: () async {
//               var place = await PlacesAutocomplete.show(
//                 context: context,
//                 apiKey: homeController.googleApikey,
//                 mode: Mode.overlay,
//                 types: [],
//                 strictbounds: false,
//                 components: [],
//                 onError: (err) {
//                   // print(err);
//                 },
//               );

//               if (place != null) {
//                 setState(() {
//                   homeController.startLocationDescription =
//                       place.description.toString();
//                 });

//                 final plist = GoogleMapsPlaces(
//                   apiKey: homeController.googleApikey,
//                   apiHeaders: await const GoogleApiHeaders().getHeaders(),
//                 );
//                 String placeid = place.placeId ?? "0";
//                 final detail = await plist.getDetailsByPlaceId(placeid);
//                 final geometry = detail.result.geometry!;
//                 final lat = geometry.location.lat;
//                 final lang = geometry.location.lng;
//                 var newlatlang = LatLng(lat, lang);

//                 homeController.mapController?.animateCamera(
//                   CameraUpdate.newCameraPosition(
//                     CameraPosition(target: newlatlang, zoom: 17),
//                   ),
//                 );
//               }
//             },
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Theme.of(context).primaryColor,
//               contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(40.0),
//                 borderSide: BorderSide.none,
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(40.0),
//                 borderSide: BorderSide(
//                     color: Theme.of(context).primaryColor, width: 2.0),
//               ),
//               prefixIcon: Icon(Icons.search,
//                   color: Theme.of(context).textTheme.bodySmall!.color),
//               suffixIcon: Container(
//                 padding: const EdgeInsets.all(10),
//                 child: SvgPicture.asset(
//                   'assets/Images/map.svg',
//                   color: Theme.of(context).textTheme.bodySmall!.color,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(width: 10.w),
//         GestureDetector(
//           onTap: () {
//             _openCityBottomSheet(context);
//           },
//           child: Container(
//             padding: const EdgeInsets.all(10),
//             height: 50.h,
//             width: 50.w,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: AppColors.seGreen,
//             ),
//             child: SvgPicture.asset(
//               height: 5.h,
//               width: 5.w,
//               fit: BoxFit.cover,
//               'assets/Images/filter.svg',
//               // ignore: deprecated_member_use
//               color: Theme.of(context).textTheme.bodySmall!.color,
//               semanticsLabel: 'Acme Logo',
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
