import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:vocabulary/View/setup_view.dart';

import '../main.dart';


class ThemeSelectionScreen extends StatefulWidget {
  const ThemeSelectionScreen({super.key});

  @override
  _ThemeSelectionScreenState createState() => _ThemeSelectionScreenState();
}

class _ThemeSelectionScreenState extends State<ThemeSelectionScreen> {
  int? _selectedIndex;

  final List<String> _themes = [
    'assets/images/nature.png',
    'assets/images/nature.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Which theme you prefer?",
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
              const SizedBox(height: 32),
              Expanded(
                child: AnimatedGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  initialItemCount: _themes.length,
                  itemBuilder: (context, index, a) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                          themeMode = _selectedIndex == 0
                              ? ThemeMode.light
                              : ThemeMode.dark;
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(_themes[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (_selectedIndex == index)
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.check_circle,
                                  color: context.cardColor,
                                  size: 24,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_selectedIndex != null) {
                    await Haptics.vibrate(HapticsType.warning);
                    SetupScreen().launch(
                      context,
                      pageRouteAnimation: PageRouteAnimation.Slide,
                      isNewTask: true,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select a theme to continue."),
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
}