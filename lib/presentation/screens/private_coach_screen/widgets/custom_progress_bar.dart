import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class CustomProgressBar extends StatelessWidget {
  final int currentStep;

  const CustomProgressBar({Key? key, required this.currentStep})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        // double progress = (index + 2) / 3.0;
        return Expanded(
          child: Container(
            height: 5,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            color: index < currentStep ? AppColors.seGreen : Colors.grey[200],
            width: MediaQuery.of(context).size.width * (1 / 3.0),
          ),
        );
      }),
    );
  }
}
