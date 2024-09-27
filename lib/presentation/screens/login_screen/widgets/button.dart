import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AuthButton extends StatelessWidget {
  void Function()? onTap;
  Color? backgroundcolor;
  Color? fontcolor;
  String text;
  AuthButton({
    super.key,
    required this.text,
    required this.fontcolor,
    required this.backgroundcolor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: backgroundcolor, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyle(fontWeight: FontWeight.bold, color: fontcolor),
          ),
        ),
      ),
    );
  }
}
