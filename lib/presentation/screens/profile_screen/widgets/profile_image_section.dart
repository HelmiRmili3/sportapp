import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_sizes.dart';

class ProfileImageSection extends StatelessWidget {
  final VoidCallback onBackPressed;

  const ProfileImageSection({
    Key? key,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          UnconstrainedBox(
            child: Container(
              padding: EdgeInsets.only(
                top: 45.h,
                left: 20.w,
                right: 20.w,
              ),
              color: AppColors.seGreen,
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: onBackPressed,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        fontFamily: 'ClashDisplay',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                width: 140.w,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white, width: 4.w),
                        shape: BoxShape.circle,
                      ),
                      child: SizedBox(
                        width: AppSizes.size140,
                        height: AppSizes.size140,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppSizes.size100),
                          child: const Image(
                            image: NetworkImage(
                                "https://picsum.photos/250?image=9"),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 1,
                      child: Container(
                        height: 46.h,
                        width: 46.w,
                        decoration: BoxDecoration(
                          color: AppColors.seGreen,
                          border:
                              Border.all(color: AppColors.white, width: 4.w),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: UnconstrainedBox(
                            child: Image.asset(
                              'assets/Images/edit_icon.png',
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
