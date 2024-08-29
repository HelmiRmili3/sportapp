import 'package:flutter/material.dart';
import 'package:sportapp/core/app_sizes.dart';
import 'package:sportapp/generated/l10n.dart';

class CustomBottomNavBar extends StatefulWidget {
  int currentIndex;
  final Function(int) onTap;

  CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle:
          TextStyle(fontSize: AppSizes.size14, color: Colors.black),
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: AppSizes.size18,
      selectedItemColor: Colors.blue,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "History",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: S.of(context).profile,
        ),
      ],
    );
  }
}
