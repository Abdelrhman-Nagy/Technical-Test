import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:nb_utils/nb_utils.dart';

import 'name_view.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
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
                        'Which option represents you best?',
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
            _buildAgePage("Female"),
            _buildAgePage("Male"),
            _buildAgePage("Other"),
            _buildAgePage("Prefer not to say"),
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
                  Name().launch(
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