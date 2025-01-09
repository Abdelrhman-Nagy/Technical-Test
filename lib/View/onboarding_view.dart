import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:vocabulary/View/hear_about_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            fit: BoxFit.fitWidth,width: double.infinity,
            'assets/images/img_welcome.webp',
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(
                    () => isLastPage = index == 0); // Adjust for your slides
              },
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildPage('Expand your Vocabulary in 1 minute a day',
                      'Learn 10,000+ new words with a new daily habit that takes just 1 minute', Icons.check),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style:  ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: context.primaryColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid,
                          strokeAlign: 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),),
                onPressed: () async {
                  await Haptics.vibrate(HapticsType.warning);
                  await
                  HearAboutScreen().launch(context,pageRouteAnimation: PageRouteAnimation.Slide,isNewTask: true,);

                },
                child: Text(
                  'Get Started',
                  style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPage(String title, String subtitle, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(textAlign: TextAlign.center,
            title,
            style: context.textTheme.titleLarge!.copyWith(fontSize: 30),
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
