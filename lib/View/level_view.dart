import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:vocabulary/View/theme_view.dart';


class Level extends StatefulWidget {
  const Level({super.key});

  @override
  _LevelState createState() => _LevelState();
}

class _LevelState extends State<Level> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "What's your vocabulary level?",
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleLarge,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Text('Select an option to continue',
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium)),
                ],
              ),
            ),
            SizedBox(height: 5),
            _buildAgePage("Beginner"),
            _buildAgePage("Intermediate"),
            _buildAgePage("Advanced"),
          ],
        ),
      ),
    );
  }

  Widget _buildAgePage(String title) {
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
                    elevation: 1,
                    overlayColor: Colors.white),
                onPressed: () async {
                  await Haptics.vibrate(HapticsType.warning);
                  ThemeSelectionScreen().launch(
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