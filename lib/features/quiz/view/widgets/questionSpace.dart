import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/data/model/question_model.dart';

class QuestionSpace extends StatelessWidget {
  final QuestionModel question;
  const QuestionSpace({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(16)),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          question.question,
          style: const TextStyle(fontSize: 18),
        ),
      )),
    );
  }
}
