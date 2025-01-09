import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:nb_utils/nb_utils.dart';

import 'customize_view.dart';

class Name extends StatefulWidget {
  const Name({super.key});

  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          40.height,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                        'What do you want to be called?',
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleLarge,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                          'Your name is used to personalize your experience',
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium)),
                  _buildAgePage(),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
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
                  CustomizeScreen().launch(
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
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildAgePage() {
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
              child: AppTextField(
                keyboardType: TextInputType.name,
                textFieldType: TextFieldType.NAME,
                isValidationRequired: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Your name', border: OutlineInputBorder()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}