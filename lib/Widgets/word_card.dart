import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../Models/word.dart';

class WordCard extends StatelessWidget {
  final Word word;

  const WordCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Card(color: context.scaffoldBackgroundColor,elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              word.word,
              style: context.textTheme.titleLarge!.copyWith(fontSize: 30),
            ),
            SizedBox(height: 10),
            Text(
              word.definition,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium!.copyWith(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              word.example,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
