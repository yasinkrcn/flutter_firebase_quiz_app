import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/init/injection_container.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/data/model/question_model.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view_model/quiz_provider.dart';

class AnswerCard extends StatelessWidget {
  final QuestionModel question;
  const AnswerCard({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 245,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: question.options.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text(
                    question.options[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
