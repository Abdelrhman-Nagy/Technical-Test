import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:nb_utils/nb_utils.dart';

import 'home_screen.dart';



class Topics extends StatefulWidget {
  const Topics({super.key});

  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  final List<String> _options = [
    "Society",
    "Words in foreign languages",
    "Human body",
    "Emotions",
    "Business",
    "Other",
  ];

  final List<bool> _selectedOptions = [
    false,
    false,
    false,
    false,
    false,
    false
  ];
  late ConfettiController _controllerBottomCenter;
  late ConfettiController _controllerTopCenter;

  @override
  void initState(){
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose(){
    _controllerBottomCenter.dispose();
    _controllerTopCenter.dispose();
    super.dispose();
  }

  Path drawStar(Size size) {
    // Method to convert degrees to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _controllerTopCenter,
                  blastDirection: pi / 2,
                  maxBlastForce: 5, // set a lower max blast force
                  minBlastForce: 2, // set a lower min blast force
                  emissionFrequency: 0.05,
                  numberOfParticles: 50, // a lot of particles at once
                  gravity: 1,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: TextButton(
                    onPressed: () {

                    },
                    child: 0.height),
              ),
              const SizedBox(height: 24),
              Text(
                  textAlign: TextAlign.center,
                  'Which topics are you interested in?',
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
                  )),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_selectedOptions.contains(true)) {
                    _controllerTopCenter.play();
                    await Haptics.vibrate(HapticsType.success);
                    await Future.delayed(Duration(seconds: 2));
                    HomeScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true,);
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
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: context.primaryColor,
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