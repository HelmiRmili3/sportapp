import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../generated/l10n.dart';

// void _openCityBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState) => Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             child:
//           ),
//         );
//       },
//     );
//   }

class CityBottomSheet extends StatefulWidget {
  const CityBottomSheet({Key? key}) : super(key: key);

  @override
  _CityBottomSheetState createState() => _CityBottomSheetState();
}

class _CityBottomSheetState extends State<CityBottomSheet> {
  String _searchText = '';
  final List<String> allCities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix'
  ]; // Example city list
  List<String> filteredCities = [];

  @override
  Widget build(BuildContext context) {
    // Filter cities based on search text
    filteredCities = allCities
        .where((city) => city.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          // Search field with OutlineBorde
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  S.of(context).chooseCity,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodySmall!.color),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(.4),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodySmall!.color),
              decoration: InputDecoration(
                hintText: 'Search City',
                hintStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall!.color),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  _searchText = text;
                });
              },
            ),
          ),
          const SizedBox(height: 10.0),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:
                _searchText.isEmpty ? allCities.length : filteredCities.length,
            itemBuilder: (context, index) {
              final city = _searchText.isEmpty
                  ? allCities[index]
                  : filteredCities[index];
              return ListTile(
                title: Text(
                  city,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodySmall!.color),
                ),
                onTap: () => {
                  Navigator.pop(context),
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
