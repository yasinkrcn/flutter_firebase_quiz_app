import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/init/injection_container.dart';
import 'package:flutter_firebase_quiz_app/core/utils/screen_size.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/data/model/question_model.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/widgets/answer_card_widget.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/widgets/progress_bar.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/widgets/question_space.dart';
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

    super.initState();
    sl<QuizProvider>().onInit();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProgressBar(
                  width: ScreenSize().getWidthPercent(1),
                  totalValue: 110,
                  value: quizProvider.time,
                ),
                
                quizProvider.questions.isNotEmpty
                    ? Center(
                        child: QuestionSpace(
                            question: quizProvider
                                .questions[quizProvider.categoryIndex]),
                      )
                    : const SizedBox.shrink(),
                quizProvider.questions.isNotEmpty
                    ? AnswerCard(
                        question:
                            quizProvider.questions[quizProvider.categoryIndex],
                      )
                    : const SizedBox.shrink(),
                Row(
      
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


                    GestureDetector(

                      onTap: () => quizProvider.categoryIndexMinus(),
                      
                      child: const Icon(Icons.arrow_circle_left,size: 60,color: Colors.red,)),
                       GestureDetector(

                      onTap: () => quizProvider.categoryIndexPlus(),
                      
                      child: const Icon(Icons.arrow_circle_right,size: 60,color: Colors.green,)),
                    
                  
                    
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
