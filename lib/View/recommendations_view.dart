import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:vocabulary/View/age_view.dart';


class RecScreen extends StatefulWidget {
  const RecScreen({super.key});

  @override
  _RecScreenState createState() => _RecScreenState();
}

class _RecScreenState extends State<RecScreen> {
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                _buildPage("Tailor your word recommendations",
                    'Answer a few questions to get personalized word suggestions'),
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
                  AgeView().launch(
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
      padding: const EdgeInsets.all(26.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Image.asset(
            'assets/images/my_collections.webp',
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: context.textTheme.titleLarge!.copyWith(fontSize: 28),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium!.copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}