import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isSentBySupport;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.isSentBySupport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Align(
        alignment:
            isSentBySupport ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            color: isSentBySupport ? Colors.grey[300] : AppColors.seGreen,
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            message,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
