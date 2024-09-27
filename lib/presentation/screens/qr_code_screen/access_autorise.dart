import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import 'widgets/custom_access_page.dart';
import 'widgets/custom_app_bar.dart';

class AccessAutorise extends StatelessWidget {
  const AccessAutorise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Accès autorisé',
      ),
      body: CustomAccessPage(
        color: AppColors.seGreen,
        onPressed: () {
          Navigator.pop(context);
        },
        imagePath: "assets/Images/image2.png",
        name: 'Mohamed ben rekaya',
        status: "Votre session a été validée avec succès !",
        date: "03/03/2024 14:32",
        time: 'Time',
        details:
            "ll tape dans la main de singe et montre l'écran a la presonne a l'accueil.",
        id: "#LI7687SDL",
        label: "Vas-y bébé...allez !",
      ),
    );
  }
}
