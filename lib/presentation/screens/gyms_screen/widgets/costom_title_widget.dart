import 'package:flutter/material.dart';

class CostomTitleWidget extends StatelessWidget {
  String title;
  CostomTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).textTheme.bodySmall!.color,
      ),
    );
  }
}
