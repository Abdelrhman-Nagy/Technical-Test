import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:nb_utils/nb_utils.dart';

import 'goals_view.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          80.height,
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: Image.asset(
              fit: BoxFit.fitWidth,
              'assets/images/img_goals.webp',
            ),
          ),
          Expanded(
            child: Column(
              children: [
                _buildPage("Set up Vocabulary to get personalized words",
                    'Some final questions to customize Vocabulary to what you want to achieve'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  enableFeedback: true,
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
                onPressed: () async {
                  await Haptics.vibrate(HapticsType.warning);
                  Goals().launch(
                    context,
                    pageRouteAnimation: PageRouteAnimation.Slide,
                    isNewTask: true,
                  );
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPage(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge,
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}