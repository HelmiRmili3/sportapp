import 'package:flutter/material.dart';

import 'widgets/custom_access_page.dart';
import 'widgets/custom_app_bar.dart';

class CheckInDejaFait extends StatelessWidget {
  const CheckInDejaFait({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Check In Deja Fait',
      ),
      body: CustomAccessPage(
        color: Colors.transparent,
        onPressed: () {
          Navigator.pop(context);
        },
        imagePath: "assets/Images/image3.png",
        name: 'Mohamed ben rekaya',
        status: "Votre session a expiré.",
        date: "03/03/2024 14:32",
        time: 'Time',
        details:
            "il tape dans la main de singe et montre l'écran a la presonne a l'accueil.",
        id: "#LI7687SDL",
        label: "Veuillez réessayer ultérieurement.",
      ),
    );
  }
}
