import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:nb_utils/nb_utils.dart';

import 'level_view.dart';


class Time extends StatefulWidget {
  const Time({super.key});

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Skip',
                    style: context.textTheme.titleMedium,
                  )),
            ),
            5.height,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'How much time will you devote to learning?',
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleLarge,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Text('You can always change your goal later',
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium)),
                ],
              ),
            ),
            SizedBox(height: 5),
            _buildAgePage("1 minute a day"),
            _buildAgePage("3 minutes a day"),
            _buildAgePage("5 minutes a day"),
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
                  Level().launch(
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