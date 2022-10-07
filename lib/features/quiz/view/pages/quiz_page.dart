import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/init/injection_container.dart';
import 'package:flutter_firebase_quiz_app/core/utils/screen_size.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/data/model/question_model.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/widgets/answer_card_widget.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/widgets/progress_bar.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/widgets/questionSpace.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view_model/quiz_provider.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    Key? key,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    //İlgili sayfada direkt olarak bir fonksiyonu bi butona basılmaksızın ayağa kaldırmak için init state içerisine koyacağız
    sl<QuizProvider>().onInit();
    super.initState();
  }

// @override
//   void dispose() {

//     super.dispose();

//     sl<QuizProvider>().onInit();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<QuizProvider>(
          builder: (context, quizProvider, child) {
            return Column(
              children: [
                ProgressBar(
                  width: ScreenSize().getWidthPercent(1),
                  totalValue: 110,
                  value: quizProvider.time,
                ),
                const Spacer(),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: ((context, index) {
                        return QuestionSpace(
                            question: quizProvider
                                .questions[quizProvider.categoryIndex]);
                      })),
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          quizProvider.categoryIndexMinus();
                        },
                        child: Text('minus')),
                    SizedBox(
                      width: 100,
                    ),
                    TextButton(
                        onPressed: () {
                          quizProvider.categoryIndexPlus();
                        },
                        child: Text('plus')),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 1,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return AnswerCard(
                        question:
                            quizProvider.questions[quizProvider.categoryIndex],
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
