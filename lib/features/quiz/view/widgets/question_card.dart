import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/init/injection_container.dart';
import 'package:flutter_firebase_quiz_app/core/utils/screen_size.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/data/model/question_model.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view_model/question_controller.dart';

import 'options.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: ScreenSize().getHeightPercent(.235),
            width: double.infinity,
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                question.question,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          
          ...List.generate(
            question.options.length,
            (index) => Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Option(
                  index: index,
                  text: question.options[index],
                  press: () {
                    sl<QuestionController>().checkAns(question, index);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
