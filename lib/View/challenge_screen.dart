import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EC), // Background color from design
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Add share functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Fire-like illustration (SVG or asset)
            Stack(
              alignment: Alignment.center,
              children: [
                // SvgPicture.asset(
                //   'assets/fire_shape.svg', // Replace with the actual SVG file
                //   height: 150,
                // ),
                Text(
                  "1", // Center number
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                enableFeedback: true,
                overlayColor: Colors.black,
                foregroundColor: Colors.black,
                backgroundColor: context.primaryColor, // text color
                elevation: 5, // button's elevation when it's pressed
              ),
              child: Text(
                'Styled Button',
                style: context.textTheme.labelMedium,
              ),
            ),
            // Title
            Text(
              "A great way to start the new year!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),

            // Subtitle
            Text(
              "Learning new words every day is the key to expanding your vocabulary.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
            SizedBox(height: 36),

            // Progress bar section
            Column(
              children: [
                Text(
                  "Come back 3 days in a row to complete the challenge",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 16),
                // Progress bar with rounded edges
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildProgressCircle(true), // Active circle
                    _buildProgressLine(true),
                    _buildProgressCircle(false), // Inactive circle
                    _buildProgressLine(false),
                    _buildProgressCircle(false), // Inactive circle
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),

            // Commit button
            ElevatedButton(
              onPressed: () {
                // Commit action
              },
              style: ElevatedButton.styleFrom(
                  elevation: 20,
                  surfaceTintColor: Colors.black,
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
                  shadowColor: Colors.black),
              child: Text(
                "I commit to 3 days",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Progress circle widget
  Widget _buildProgressCircle(bool isActive) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? Colors.red
            : Colors.grey[300], // Red for active, grey for inactive
        border: Border.all(
          color: isActive ? Colors.red : Colors.grey,
          width: 2,
        ),
      ),
    );
  }

  // Line between progress circles
  Widget _buildProgressLine(bool isActive) {
    return Container(
      width: 50,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.grey[300],
        borderRadius: BorderRadius.circular(3), // Rounded edges for the line
      ),
    );
  }
}
