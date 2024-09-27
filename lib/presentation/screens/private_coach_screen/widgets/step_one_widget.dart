import 'package:flutter/material.dart';
import 'package:sportapp/core/app_colors.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  StepOneState createState() => StepOneState();
}

class StepOneState extends State<StepOne> {
  String _selectedOption = 'myself'; // default selected option

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Who Consults?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodySmall!.color,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Select the Beneficiary for the Consultation',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodySmall!.color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedOption = 'myself';
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        _selectedOption == 'myself'
                            ? AppColors.seGreen
                            : Colors.grey[200]),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Radio<String>(
                        value: 'myself',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value!;
                          });
                        },
                      ),
                      const Text(
                        'Myself',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedOption = 'others';
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        _selectedOption == 'others'
                            ? AppColors.seGreen
                            : Colors.grey[200]),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Radio<String>(
                        value: 'others',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value!;
                          });
                        },
                      ),
                      const Text(
                        'Others',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.all(16),
              child: const Text(
                'The identity of the person is essential for the practitioner. '
                'If the appointment is not for you, please create an account for the person consulting.',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
