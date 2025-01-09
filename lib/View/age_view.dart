import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:nb_utils/nb_utils.dart';

import 'gender_view.dart';




class AgeView extends StatefulWidget {
  const AgeView({super.key});

  @override
  _AgeViewState createState() => _AgeViewState();
}

class _AgeViewState extends State<AgeView> {
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'How old are you?',
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleLarge,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                            'Your age is used to personalize your content',
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleMedium)),
                  ],
                ),
              ),
              SizedBox(height: 5),
              _buildAgePage("13 to 17"),
              _buildAgePage("18 to 24"),
              _buildAgePage("25 to 34"),
              _buildAgePage("35 to 44"),
              _buildAgePage("45 to 54"),
              _buildAgePage("55+"),
            ],
          ),
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
                  Gender().launch(
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






























/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class AgeView extends StatefulWidget {
  @override
  _AgeViewState createState() => _AgeViewState();
}

class _AgeViewState extends State<AgeView> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align( alignment: Alignment.topCenter,
              child: Text('How old are you?', textAlign: TextAlign.center,
                style:
                GoogleFonts.inter(fontSize: 28,
                    color: Colors.white,fontWeight: FontWeight.bold),)),
          SizedBox(height: 5,),
          Align( alignment: Alignment.topCenter,
              child: Text('Your age is used to personalize your content', textAlign: TextAlign.center,
                  style:
                  GoogleFonts.inter(fontSize: 16,
                      color: Colors.white))),
          SizedBox(height: 5),
          Expanded(
            child: PageView(physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (index) {
                setState(
                        () => isLastPage = index == 2); // Adjust for your slides
              },
              children: [
                _buildAgePage('How old are you?', 'Your age is used to personalize your content', Icons.check),
              ],
            ),
          ),
          SizedBox(height: 10),
          _controller.page == 0 ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF93c1c1),
                  enableFeedback: true,
                ),
                onPressed: () {
                  _controller.nextPage(duration: Duration(milliseconds: 500), curve:Curves.easeOut);
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ) : SizedBox(),
        ],
      ),
    );
  }

  Widget _buildAgePage(String title, String subtitle, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(side: BorderSide(
                  width: 1.0,
                  color: Colors.white,
                ),
                    backgroundColor: Color(0xFF262626),
                    enableFeedback: true,
                    elevation: 1,
                    overlayColor: Colors.white
                ),
                onPressed: () {
                  AgeView().launch(
                  context,
                  pageRouteAnimation: PageRouteAnimation.Slide,
                  isNewTask: true,
                  );
                },
                child: Align( alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,fontSize: 18),
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
*/
