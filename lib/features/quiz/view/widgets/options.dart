import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/constants/words.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view_model/question_controller.dart';
import 'package:provider/provider.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionController>(
      builder: (context, qnController, child) {
        Color getTheRightColor() {
          if (qnController.isAnswered) {
            if (index == qnController.correctAns) {
              qnController.trueAnswers++;

              return Colors.green;
            } else if (index == qnController.selectedAns &&
                qnController.selectedAns != qnController.correctAns) {
              qnController.wrongAnswers++;
              qnController.trueAnswers--;
              return Colors.red;
            }
          }
          return Colors.grey;
        }

        IconData getTheRightIcon() {
          return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${answerWords[index]}. $text",
                  style: TextStyle(color: getTheRightColor(), fontSize: 16),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == Colors.grey
                        ? Colors.transparent
                        : getTheRightColor(),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: getTheRightColor()),
                  ),
                  child: getTheRightColor() == Colors.grey
                      ? null
                      : Icon(getTheRightIcon(), size: 16),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
