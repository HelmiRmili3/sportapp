import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
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
            color: AppColors.seGreen,
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios,
              size: 15,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          fontFamily: 'ClashDisplay',
          color: Theme.of(context).textTheme.bodySmall!.color,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
