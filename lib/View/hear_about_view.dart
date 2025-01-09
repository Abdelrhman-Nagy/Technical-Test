import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:vocabulary/View/recommendations_view.dart';

class HearAboutScreen extends StatefulWidget {
  const HearAboutScreen({super.key});

  @override
  _HearAboutScreenState createState() => _HearAboutScreenState();
}

class _HearAboutScreenState extends State<HearAboutScreen> {
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Skip',
                      style: context.textTheme.titleMedium,
                    )),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'How did you hear about Vocabulary?',
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 5,
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Text('Select an option to continue',
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleMedium)),
              SizedBox(height: 5),
              _buildPage("TikTok"),
              _buildPage("Instagram"),
              _buildPage("Facebook"),
              _buildPage("Google Play"),
              _buildPage("Web search"),
              _buildPage("Friend/family"),
              _buildPage("Other"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      width: 1.0,
                      color: context.dividerColor,
                    ),
                    backgroundColor: context.scaffoldBackgroundColor,
                    enableFeedback: true,
                    elevation: 0,
                    overlayColor: Colors.white),
                onPressed: () async {
                  await Haptics.vibrate(HapticsType.warning);
                  RecScreen().launch(
                    context,
                    pageRouteAnimation: PageRouteAnimation.Slide,
                    isNewTask: true,
                  );
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: context.textTheme.titleMedium,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}