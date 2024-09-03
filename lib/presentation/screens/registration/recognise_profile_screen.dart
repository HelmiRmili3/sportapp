import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/generated/l10n.dart';

import '../../../core/routes/route_names.dart';
import '../login_screen/widgets/button.dart';

// ignore: must_be_immutable
class Facialrecognition extends StatefulWidget {
  File? image;
  Facialrecognition({super.key, required this.image});

  @override
  State<Facialrecognition> createState() => _FacialrecognitionState();
}

class _FacialrecognitionState extends State<Facialrecognition> {
  @override
  double _progress = 0;
  bool _isCompleted = false;
  bool faceRecongnize = false;

  @override
  void initState() {
    super.initState();
    // Start progress when images are properly loaded
    Future.delayed(const Duration(seconds: 3), () {
      if (widget.image != null) {
        startProgress();
      }
    });
  }

  void startProgress() {
    const oneSec = Duration(milliseconds: 100);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_progress >= 100) {
            timer.cancel();
            _isCompleted = true;
          } else {
            _progress += 1;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
            fontcolor: _isCompleted
                ? AppColors.black
                : AppColors.black.withOpacity(.4),
            text: 'Confirmer l\'identité  ',
            onTap: () {
              context.go(AppRouteConstants.chooseCity);
            },
            backgroundcolor: _isCompleted == false
                ? AppColors.seGreen.withOpacity(.4)
                : AppColors.seGreen),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              if (widget.image != null)
                Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                          File(widget.image!.path),
                          fit: BoxFit.fill,
                        ))),
              faceRecongnize == false && _isCompleted == false
                  ? CircularSeekBar(
                      width: double.infinity,
                      height: 230,
                      onEnd: () {
                        faceRecongnize = true;
                        setState(() {});
                      },
                      progress: _progress,
                      barWidth: 8,
                      startAngle: 0,
                      maxProgress: 100,
                      minProgress: 0,
                      sweepAngle: 360,
                      strokeCap: StrokeCap.butt,
                      progressGradientColors: [
                        AppColors.seGreen,
                        AppColors.seGreen
                      ],
                      dashWidth: .5,
                      dashGap: 3,
                      animation: false,
                    )
                  : Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        CircularSeekBar(
                          width: double.infinity,
                          height: 230,
                          progress: 100,
                          barWidth: 3,
                          startAngle: 0,
                          maxProgress: 100,
                          minProgress: 100,
                          sweepAngle: 2 * 360,
                          strokeCap: StrokeCap.round,
                          progressGradientColors: [
                            AppColors.seGreen,
                            AppColors.seGreen
                          ],
                          animation: true,
                        ),
                        Positioned(
                          bottom: -20,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.seGreen),
                            child: Center(
                                child: Icon(
                              Icons.check,
                              color: AppColors.white,
                              size: 15,
                            )),
                          ),
                        )
                      ],
                    ),
            ],
          ),
          if (faceRecongnize == true || _isCompleted)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    'Identité vérifiée',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: Theme.of(context).textTheme.bodySmall!.color),
                  ),
                  Text(
                    'En savoir plus sur vous..',
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                        color: Theme.of(context).textTheme.bodySmall!.color),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
