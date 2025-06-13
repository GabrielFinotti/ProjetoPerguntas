import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question(this.questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        questionText,
        style: TextStyle(fontSize: 22),
        textAlign: TextAlign.center,
      ),
    );
  }
}
