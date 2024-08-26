import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:sportapp/core/app_colors.dart';
import 'package:sportapp/core/app_sizes.dart';

import '../../../generated/l10n.dart';
import '../profile_screen/widgets/profile_container.dart';

class PaymentMethodScreen extends StatefulWidget {
  PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool _isChecked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    List languageText = [
      "English",
      "Urdu",
      "Greek",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        leading: GestureDetector(
          onTap: () {
            context.pop();
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
            )),
          ),
        ),
        title: Text(
          '${S.of(context).paymentMethod} ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'ClashDisplay',
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              ProfileContainerUpdated(
                icon: "assets/Images/card.png",
                title: S.of(context).payOnline,
                ontap: () {
                  _showSheet();
                },
              ),
              20.verticalSpace,
              ProfileContainerUpdated(
                icon: "assets/Images/cash_payment.png",
                title: 'Payment by Telephone balance',
                ontap: () {},
              ),
              20.verticalSpace,
              ProfileContainerUpdated(
                icon: "assets/Images/donate-coin.png",
                title: 'Pay in cash',
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _selectedValue1 = 'Option 1';
  String? _selectedValue2 = 'Option A';

  void _showSheet() {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).primaryColor,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.85,
          minChildSize: 0.8,
          maxChildSize: .9,
          builder: (context, ScrollController scrollController) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    height: 685,
                    width: 395,
                    color: Theme.of(context).primaryColor,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(
                                  image:
                                      AssetImage('assets/Images/INFINITY.png'),
                                  width: 94,
                                  height: 27,
                                ),
                              ],
                            ),
                            const SizedBox(height: 13),
                            Text(
                              'Numéro de la commande No11623-1543813,',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                text: 'Il reste jusqu à la fin de la session ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '19 min. 55 sec.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Theme.of(context).primaryColor,
                                contentPadding: const EdgeInsets.all(5),
                                prefixIcon: Icon(
                                  Icons.credit_card,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                ),
                                hintText: 'Numéro de la carte',
                                hintStyle: TextStyle(
                                    color: Theme.of(context).highlightColor),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.5),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.5),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    dropdownColor:
                                        Theme.of(context).primaryColor,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(5),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.5),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.5),
                                      ),
                                    ),
                                    value: _selectedValue1,
                                    hint: Text(
                                      'Select option 1',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .color),
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedValue1 = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'Option 1',
                                      'Option 2',
                                      'Option 3',
                                      'Option 4'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    dropdownColor:
                                        Theme.of(context).primaryColor,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(5),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.5),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.5),
                                      ),
                                    ),
                                    value: _selectedValue2,
                                    hint: const Text('Select option 2'),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedValue2 = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'Option A',
                                      'Option B',
                                      'Option C',
                                      'Option D'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, top: 5, bottom: 5),
                                hintText: 'Code de sûreté',
                                hintStyle: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.5),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.5),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, top: 5, bottom: 5),
                                hintText: 'Le nom du détenteur',
                                hintStyle: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.5),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.5),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Center(
                              child: Text(
                                '...................................................',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Adresse e-mail',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.5),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.5),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Container(
                              height: 60,
                              width: 350,
                              color: Colors.deepPurpleAccent.shade700,
                              child: const Center(
                                  child: Text(
                                'PAYMENT 99.OO0 TND',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.lock_outline,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Paiement sécurisé',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
