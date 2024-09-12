import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/generated/l10n.dart';

import '../../../core/app_colors.dart';
import '../../../core/routes/route_names.dart';

import '../login_screen/widgets/button.dart';
import '../login_screen/widgets/text_filed.dart';

class ChooseCityScreen extends StatefulWidget {
  const ChooseCityScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCityScreen> createState() => _ChooseCityScreenState();
}

class _ChooseCityScreenState extends State<ChooseCityScreen> {
  bool _isValid = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _countryController = TextEditingController();
  void _updateFormState() {
    setState(() {
      _isValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            // Handle back button tap
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.seGreen,
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
            ),
          ),
        ),
        title: Text(
          S.of(context).chooseCity,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'ClashDisplay',
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.h),
                Text(
                  textAlign: TextAlign.center,
                  ' ${S.of(context).weNeedYourLocationTo}',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodySmall!.color),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextField(
                  controller: _countryController,
                  ontap: _openCityBottomSheet,
                  hintText: S.of(context).chooseCity,
                  obsecure: false,
                  // onChanged: (_) => _updateFormState(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please choose or write country';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50.h),
                AuthButton(
                  fontcolor: _isValid
                      ? AppColors.black
                      : AppColors.black.withOpacity(.4),
                  text: S.of(context).proceed,
                  onTap: _isValid
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            // Handle button tap
                            context.go(AppRouteConstants.registerDone);
                          }
                        }
                      : null,
                  backgroundcolor: _isValid
                      ? AppColors.seGreen
                      : AppColors.seGreen.withOpacity(.3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final allCities = [
    'Paris',
    'Marseille',
    'Lyon',
    'Toulouse',
    'Bordeaux',
    'Nice',
  ];
  String _searchText = '';
  void _openCityBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          S.of(context).chooseCity,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color),
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
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                              ))),
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
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
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
                          _countryController.text = text;
                          _updateFormState();
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _searchText.isEmpty
                        ? allCities.length
                        : filteredCities.length,
                    itemBuilder: (context, index) {
                      final city = _searchText.isEmpty
                          ? allCities[index]
                          : filteredCities[index];
                      return ListTile(
                        title: Text(
                          city,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          _countryController.text = city,
                          _updateFormState(),
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

// Function to filter cities based on search text
  List<String> get filteredCities => allCities
      .where((city) => city.toLowerCase().contains(_searchText.toLowerCase()))
      .toList();
}
