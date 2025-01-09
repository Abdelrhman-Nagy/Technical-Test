import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../Data/sample_words.dart';
import '../Widgets/word_card.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TutorialCoachMark tutorialCoachMark;
  bool _isVisable = true;
  GlobalKey keyButton = GlobalKey();
  GlobalKey cardButton = GlobalKey();
  GlobalKey tableButton = GlobalKey();
  GlobalKey table = GlobalKey();

  void showTutorial()
  { if (mounted) {
    tutorialCoachMark.show(context: context);
  }
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: Color(0xFF93c1c1),
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.5,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
        return true;
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation1",
        keyTarget: keyButton,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Achievements",
                    style: GoogleFonts.dmSerifText(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See your achievements in Vocabulary",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  100.height,
                  Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.touch_app_outlined,
                        size: 90,
                        color: Colors.white,
                      )),
                  10.height,
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Tap to continue",
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation1",
        keyTarget: tableButton,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Table",
                    style: GoogleFonts.dmSerifText(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See your progress in Vocabulary",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  100.height,
                  Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.touch_app_outlined,
                        size: 90,
                        color: Colors.white,
                      )),
                  10.height,
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Tap to continue",
                        style: context.textTheme.titleMedium,
                      )),
                ],
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "cardButtonNavigation1",
        keyTarget: cardButton,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  40.height,
                  Text(
                    "Streak",
                    style: GoogleFonts.dmSerifText(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Your Daily Word Streak",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  100.height,
                  Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.touch_app_outlined,
                        size: 90,
                        color: Colors.white,
                      )),
                  10.height,
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Tap to continue",
                        style: context.textTheme.titleMedium,
                      )),
                ],
              );
            },
          ),
        ],
      ),
    );
    return targets;
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Streak',
        DateTime(today.year, today.month, today.day - 8),
        DateTime(today.year, today.month, today.day - 3),
        Colors.green,
        false));
    meetings.add(Meeting('Streak', startTime, endTime, Colors.green, false));
    meetings.add(Meeting(
        'Lost',
        DateTime(today.year, today.month, today.day - 2),
        DateTime(today.year, today.month, today.day - 1),
        Colors.red,
        false));
    return meetings;
  }

  @override
  void initState() {
    createTutorial();
    Future.delayed(Duration.zero, showTutorial);
    super.initState();
  }

  int _currentIndex = 0;

  void showCalenderModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: context.scaffoldBackgroundColor,
      context: context,
      isDismissible: false,
      showDragHandle: true,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SfCalendar(
                headerStyle: CalendarHeaderStyle(
                    backgroundColor: context.dividerColor,
                    textStyle: context.textTheme.titleLarge),
                headerHeight: 30,
                todayHighlightColor: Colors.blue,
                viewHeaderStyle:
                    ViewHeaderStyle(backgroundColor: context.dividerColor),
                key: table,
                view: CalendarView.month,
                backgroundColor: context.dividerColor,
                dataSource: MeetingDataSource(_getDataSource()),
                monthViewSettings: MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
              ),
            ),
          ),
        );
      },
    );
  }

  void showAchievementsModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: context.scaffoldBackgroundColor,
      context: context,
      isDismissible: false,
      showDragHandle: true,
      constraints:
      BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Text(
                        "Done",
                        style: context.textTheme.titleMedium,
                      )),
                ),
                20.height,
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Text(
                        "Achievements",
                        style: context.textTheme.titleLarge,
                      )),
                ),
                20.height,
                5.height,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Read 0/4',
                      style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                    )),
                5.height,
                Card(
                  color: context.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.library_add_check_outlined,
                          color: context.iconColor,
                          size: 70,
                        ),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Word Explorer',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Discover 50 new words',
                              style: context.textTheme.titleMedium?.copyWith(
                                  color: Color(0xFF565656),
                                  fontWeight: FontWeight.bold),
                            ),
                            10.height,
                            Row(
                              children: [
                                Text(
                                  "20/50",
                                  style: context.textTheme.titleMedium,
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFF565656),
                                  ),
                                  child: FractionallySizedBox(
                                    widthFactor: 20 / 50,
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                5.height,
                Card(
                  color: context.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.library_add_check_outlined,
                          color: context.iconColor,
                          size: 70,
                        ),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Word Seeker',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Discover 200 new words',
                              style: context.textTheme.titleMedium?.copyWith(
                                  color: Color(0xFF565656),
                                  fontWeight: FontWeight.bold),
                            ),
                            10.height,
                            Row(
                              children: [
                                Text(
                                  "50/200",
                                  style: context.textTheme.titleMedium,
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFF565656),
                                  ),
                                  child: FractionallySizedBox(
                                    widthFactor: 0 / 200,
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                5.height,
                Card(
                  color: context.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.library_add_check_outlined,
                          color: context.iconColor,
                          size: 70,
                        ),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Word Master',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Discover 500 new words',
                              style: context.textTheme.titleMedium?.copyWith(
                                  color: Color(0xFF565656),
                                  fontWeight: FontWeight.bold),
                            ),
                            10.height,
                            Row(
                              children: [
                                Text(
                                  "200/500",
                                  style: context.textTheme.titleMedium,
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFF565656),
                                  ),
                                  child: FractionallySizedBox(
                                    widthFactor: 0 / 500,
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                5.height,
                Card(
                  color: context.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.library_add_check_outlined,
                          color: context.iconColor,
                          size: 70,
                        ),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Word Guru',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Discover 1000 new words',
                              style: context.textTheme.titleMedium?.copyWith(
                                  color: Color(0xFF565656),
                                  fontWeight: FontWeight.bold),
                            ),
                            10.height,
                            Row(
                              children: [
                                Text(
                                  "500/1000",
                                  style: context.textTheme.titleMedium,
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.47,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFF565656),
                                  ),
                                  child: FractionallySizedBox(
                                    widthFactor: 0 / 1000,
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                25.height,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Learn 0/4',
                      style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                    )),
                5.height,
                Card(
                  color: context.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.library_add_check_outlined,
                          color: context.iconColor,
                          size: 70,
                        ),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Collector in Training',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Save 5 words',
                              style: context.textTheme.titleMedium?.copyWith(
                                  color: Color(0xFF565656),
                                  fontWeight: FontWeight.bold),
                            ),
                            10.height,
                            Row(
                              children: [
                                Text(
                                  "0/5",
                                  style: context.textTheme.titleMedium,
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFF565656),
                                  ),
                                  child: FractionallySizedBox(
                                    widthFactor: 0 / 5,
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                5.height,
                Card(
                  color: context.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.library_add_check_outlined,
                          color: context.iconColor,
                          size: 70,
                        ),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Advanced Collector',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Save 10 words',
                              style: context.textTheme.titleMedium?.copyWith(
                                  color: Color(0xFF565656),
                                  fontWeight: FontWeight.bold),
                            ),
                            10.height,
                            Row(
                              children: [
                                Text(
                                  "5/10",
                                  style: context.textTheme.titleMedium,
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFF565656),
                                  ),
                                  child: FractionallySizedBox(
                                    widthFactor: 0 / 10,
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                5.height,
                Card(
                  color: context.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.library_add_check_outlined,
                          color: context.iconColor,
                          size: 70,
                        ),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expert Collector',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Save 20 words',
                              style: context.textTheme.titleMedium?.copyWith(
                                  color: Color(0xFF565656),
                                  fontWeight: FontWeight.bold),
                            ),
                            10.height,
                            Row(
                              children: [
                                Text(
                                  "10/20",
                                  style: context.textTheme.titleMedium,
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFF565656),
                                  ),
                                  child: FractionallySizedBox(
                                    widthFactor: 0 / 20,
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                5.height,
                Card(
                  color: context.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.library_add_check_outlined,
                          color: context.iconColor,
                          size: 70,
                        ),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ultimate Collector',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Save 50 words',
                              style: context.textTheme.titleMedium?.copyWith(
                                  color: Color(0xFF565656),
                                  fontWeight: FontWeight.bold),
                            ),
                            10.height,
                            Row(
                              children: [
                                Text(
                                  "20/50",
                                  style: context.textTheme.titleMedium,
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xFF565656),
                                  ),
                                  child: FractionallySizedBox(
                                    widthFactor: 0 / 50,
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              pageSnapping: true,
              scrollDirection: Axis.vertical,
              itemCount: sampleWords.length,
              onPageChanged: (page) async {
                await Haptics.vibrate(HapticsType.warning);
                setState(() {
                  _currentIndex = page;
                });
              },
              itemBuilder: (context, index) {
                final word = sampleWords[index % sampleWords.length];
                return InkWell(
                    enableFeedback: true,
                    autofocus: true,
                    focusColor: context.primaryColor,
                    onTap: () {
                      setState(() {
                        _isVisable = !_isVisable;
                      });
                    },
                    child: WordCard(word: word));
              },
            ),
            if (_isVisable)
              Positioned(
                top: 25,
                left: 16,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    key: keyButton,
                    radius: 24,
                    child: IconButton(
                      icon: Icon(
                        Icons.hexagon_outlined,
                        color: context.dividerColor,
                      ),
                      onPressed: () {
                        showAchievementsModal(context);
                      },
                    ),
                  ),
                ),
              ),
            if (_isVisable)
              Positioned(
                top: 25,
                right: 16,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    key: tableButton,
                    backgroundColor: Colors.white,
                    radius: 24,
                    child: IconButton(
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: context.dividerColor,
                      ),
                      onPressed: () {
                        showCalenderModal(context);
                      },
                    ),
                  ),
                ),
              ),
            if (_isVisable)
              Positioned(
                top: 25,
                left: 150,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("$_currentIndex/5",
                          style: context.textTheme.titleMedium),
                      const SizedBox(width: 4),
                      Container(
                        key: cardButton,
                        width: 60,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: context.cardColor,
                        ),
                        child: FractionallySizedBox(
                          widthFactor:
                              (_currentIndex ) / 5, // Progress (40% here)
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: context.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
