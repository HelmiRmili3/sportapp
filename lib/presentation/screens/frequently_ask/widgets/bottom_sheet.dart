import 'package:flutter/material.dart';
import 'package:sportapp/generated/l10n.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Container(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).termCondition,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodySmall!.color),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    ''' Ces conditions d'utilisation ("Conditions") représentent un contrat entre vous et ESX - Abonamente Săli ("ESX Abonamente Săli" ou "nous") et régissent l'accès à l'utilisation des services mis à disposition via le site Web www.esx.ro et / ou l'application mobile ESX - Abonnements Salles (iOS ou Android). Veuillez lire attentivement les termes et conditions car ils régissent la relation entre ESX – Abonnements aux salles et les membres de la communauté (« ESX – Abonnements aux salles » ou « vous ») et décrivent nos droits et obligations mutuels.
          
          Notre politique de confidentialité régit également l'utilisation du site (« www.esx.ro ») ; veuillez lire attentivement la politique de confidentialité pour obtenir des informations importantes sur nos pratiques de confidentialité ;
          
          Conditions d'utilisation
          
          1.1. Acceptation des conditions : En accédant et/ou en utilisant le site/l'application, vous acceptez et acceptez ces conditions par écrit. Si vous n'acceptez pas ces conditions,''',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).textTheme.bodySmall!.color),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
