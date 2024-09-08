import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_colors.dart';
import 'widgets/custom_progress_bar.dart';
import 'widgets/step_one_widget.dart';
import 'widgets/step_three_widget.dart';
import 'widgets/step_two_widget.dart';

class ThreeStepProgressScreen extends StatefulWidget {
  const ThreeStepProgressScreen({super.key});

  @override
  ThreeStepProgressScreenState createState() => ThreeStepProgressScreenState();
}

class ThreeStepProgressScreenState extends State<ThreeStepProgressScreen> {
  int _currentStep = 0;
  List<Widget> steps = [
    const StepOne(),
    const StepTwo(),
    const StepThree(),
  ];

  @override
  Widget build(BuildContext context) {
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
            height: 5.h,
            width: 5.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.seGreen),
            child: Center(
                child: Icon(
              Icons.arrow_back_ios,
              size: 15.sp,
            )),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0.h),
            child: CustomProgressBar(currentStep: _currentStep),
          ),
          Expanded(
            child: Center(
              child: steps[_currentStep],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (_currentStep > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentStep -= 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentStep < 2) {
                      setState(() {
                        _currentStep += 1;
                      });
                    } else {
                      GoRouter.of(context).pushNamed('/payment2');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.seGreen,
                  ),
                  child: _currentStep < 2
                      ? const Icon(Icons.arrow_forward)
                      : const Text('Continue'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
