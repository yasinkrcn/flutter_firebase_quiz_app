import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/constants/assets_paths.dart';
import 'package:flutter_firebase_quiz_app/core/init/injection_container.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/route_manager.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/router.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/widgets/score_button.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/widgets/score_card.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view_model/question_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Results',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0,
        leading: const SizedBox.shrink(),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(AssetsPath().backgroundSVG, fit: BoxFit.cover),
            Consumer<QuestionController>(
              builder: (context, provider, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ScoreCard(
                          text: 'number of question',
                          asset: AssetsPath().generalSVG,
                          color: Colors.blue,
                          providerText: provider.questionNumber.toString(),
                        ),
                        ScoreCard(
                            text: 'correct answers',
                            asset: AssetsPath().successSVG,
                            color: Colors.green,
                            providerText: '${provider.trueAnswers ~/ 7}'),
                        ScoreCard(
                            text: 'wrong answers',
                            asset: AssetsPath().errorSVG,
                            color: Colors.red,
                            providerText: '${provider.wrongAnswers ~/ 7}'),
                        ScoreCard(
                            text: 'empty answers',
                            asset: AssetsPath().warningSVG,
                            color: Colors.grey,
                            providerText:
                                '${provider.questionLimit - (provider.wrongAnswers ~/ 7 + provider.trueAnswers ~/ 7)}'),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: const Icon(
                                Icons.autorenew,
                                size: 48,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            GestureDetector(
                              onTap: () {
                                Go.to.pageAndRemoveUntil(PageRoutes.homePage);
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: const Icon(
                                  Icons.home,
                                  size: 48,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
