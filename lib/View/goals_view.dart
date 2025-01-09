import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:vocabulary/View/topics_view.dart';


class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  final List<String> _options = [
    "Enhance my lexicon",
    "Get ready for a test",
    "Improve my job prospects",
    "Enjoy learning new words",
    "Other",
  ];

  final List<bool> _selectedOptions = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Text(
                  textAlign: TextAlign.center,
                  'Do you have a specific goal for 2025?',
                  style: context.textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                  textAlign: TextAlign.center,
                  'Select at least one option to continue',
                  style: context.textTheme.titleMedium),
              const SizedBox(height: 32),
              Expanded(
                child: AnimatedListView(
                  itemCount: _options.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedOptions[index] = !_selectedOptions[index];
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 2,
                            color: _selectedOptions[index]
                                ? Colors.black
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_options[index],
                                style: context.textTheme.titleMedium),
                            _selectedOptions[index]
                                ? const Icon(
                              Icons.check_circle,
                              color: Color(0xFF94D5C4),
                            )
                                : Icon(
                              Icons.circle_outlined,
                              color: context.dividerColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_selectedOptions.contains(true)) {
                    await Haptics.vibrate(HapticsType.warning);
                    Topics().launch(
                      context,
                      pageRouteAnimation: PageRouteAnimation.Slide,
                      isNewTask: true,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select at least one option."),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  enableFeedback: true,
                  backgroundColor: context.primaryColor,
                  minimumSize: const Size(double.infinity, 10),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.black,
                        width: 2,
                        style: BorderStyle.solid,
                        strokeAlign: 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

/*  List<String> _getSelectedGoals() {
    return _options
        .asMap()
        .entries
        .where((entry) => _selectedOptions[entry.key])
        .map((entry) => entry.value)
        .toList();
  }*/
}