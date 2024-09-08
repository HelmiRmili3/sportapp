import 'package:flutter/material.dart';

class CostomTextWidget extends StatelessWidget {
  String day;
  CostomTextWidget({
    required this.day,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      day,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Theme.of(context).textTheme.bodySmall!.color),
    );
  }
}
