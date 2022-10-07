import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/data/model/question_model.dart';

class AnswerCard extends StatelessWidget {

  final QuestionModel question;
   AnswerCard({
    Key? key,
    required this.question
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(16)),
        child:  Center(
          child: Text(
            question.options.toString(),
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
