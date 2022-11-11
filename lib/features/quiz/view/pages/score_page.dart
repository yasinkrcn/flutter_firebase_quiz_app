import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/constants/assets_paths.dart';
import 'package:flutter_firebase_quiz_app/core/init/injection_container.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/route_manager.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/router.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/widgets/score_button.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view_model/question_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(AssetsPath().backgroundSVG, fit: BoxFit.cover),
            Consumer<QuestionController>(
              builder: (context, provider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 360,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                     

                          SvgPicture.asset(AssetsPath().generalSVG, height: 48),
                               Text('number of question' ,style: TextStyle(fontSize: 24),),
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration( color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              '${provider.questionLimit}',
                              style: TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 65,
                      width: 290,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          SvgPicture.asset(AssetsPath().successSVG),
                          Text(
                            'correct answers: ${provider.trueAnswers ~/ 7}',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'wrong answers: ${provider.wrongAnswers ~/ 7}',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'empty answers: ${provider.questionLimit - (provider.wrongAnswers ~/ 7 + provider.trueAnswers ~/ 7)}',
                      style: TextStyle(fontSize: 24),
                    ),
                    // SizedBox(
                    //   height: 50,
                    // ),
                    // ScoreButton(
                    //   text: 'Play again',
                    //   color: Colors.red,
                    //   route: Go.to.page(PageRoutes.quizPage),
                    // ),
                    // SizedBox(
                    //   height: 24,
                    // ),
                    // ScoreButton(
                    //   text: 'Go Home',
                    //   color: Colors.green,
                    //    route: Go.to.page(PageRoutes.homePage),
                    // ),
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
