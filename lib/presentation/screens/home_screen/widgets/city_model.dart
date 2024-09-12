import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart';

class CityBottomSheet extends StatefulWidget {
  const CityBottomSheet({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CityBottomSheetState createState() => _CityBottomSheetState();
}

class _CityBottomSheetState extends State<CityBottomSheet> {
  String _searchText = '';
  final List<String> categories = [
    'Fitness',
    'Yoga',
    'Psychologues',
    'Nutritionniste',
    'Cardi',
  ];
  List<String> filtered = [];

  @override
  Widget build(BuildContext context) {
    filtered = categories
        .where((categorie) =>
            categorie.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Search a category",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
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
                hintText: 'Search ',
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
                _searchText.isEmpty ? categories.length : filtered.length,
            itemBuilder: (context, index) {
              final city =
                  _searchText.isEmpty ? categories[index] : filtered[index];
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
