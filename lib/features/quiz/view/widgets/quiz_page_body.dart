import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/constants/assets_paths.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/widgets/progress_bar.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view_model/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'question_card.dart';

class QuizPageBody extends StatelessWidget {
  const QuizPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionController>(
      builder: (context, questionController, child) {
        return Stack(
          children: [
            SvgPicture.asset(AssetsPath().backgroundSVG, fit: BoxFit.cover),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // please don't add const parameters because progress bar rebuilt
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ProgressBar(),
                  ),
                  Expanded(
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: questionController.getPageController,
                      onPageChanged: questionController.updateQuestionNumber,
                      itemCount: questionController.questions.length,
                      itemBuilder: (context, index) => QuestionCard(
                        question: questionController.questions[index],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
