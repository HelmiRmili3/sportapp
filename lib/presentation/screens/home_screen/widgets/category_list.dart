// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:sportapp/presentation/controllers/home_controller.dart';

// class CategoryList extends StatelessWidget {
//   const CategoryList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     HomeController homeController = Get.find();
//     return SizedBox(
//       height: 40.h,
//       child: ListView.builder(
//         itemCount: homeController.model.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 10,
//             ),
//             child: ActionChip(
//               onPressed: () {
//                 // Add your action here
//               },
//               avatar: Container(
//                 height: 30,
//                 width: 30,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                 ),
//                 child: SvgPicture.asset(
//                   homeController.model[index].image,
//                   height: 20,
//                   width: 20,
//                   // ignore: deprecated_member_use
//                   color: index == 0
//                       ? Theme.of(context).splashColor
//                       : Theme.of(context).textTheme.bodySmall!.color,
//                 ),
//               ),
//               backgroundColor: Theme.of(context).primaryColor,
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(color: Theme.of(context).primaryColor),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               label: Text(
//                 homeController.model[index].name,
//                 style: TextStyle(
//                   color: Theme.of(context).textTheme.bodySmall!.color,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
