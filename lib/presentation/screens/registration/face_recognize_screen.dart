import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/routes/route_names.dart';
import '../login_screen/widgets/button.dart';

class FaceRecognization1 extends StatefulWidget {
  const FaceRecognization1({super.key});

  @override
  State<FaceRecognization1> createState() => _FaceRecognization1State();
}

class _FaceRecognization1State extends State<FaceRecognization1> {
  @override
  void initState() {
    super.initState();
  }

  File? _image;
  final picker = ImagePicker();
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: 80,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        context.push(AppRouteConstants.facialrecognition, extra: _image);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            context.pop();
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
        title: Text(
          S.of(context).faicialRecoginization,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'ClashDisplay',
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: AuthButton(
            fontcolor: AppColors.black.withOpacity(.4),
            text: 'Commencer ',
            onTap: () {
              getImageFromCamera();
              // context.go(AppRouteConstants.chooseCity);
            },
            backgroundcolor: AppColors.seGreen),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.h),
                Image.asset(
                  'assets/Images/facer.png',
                  height: 200,
                  width: 200,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
                SizedBox(height: 350.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
