import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/init/injection_container.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/route_manager.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/widgets/quiz_page_body.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view_model/question_controller.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    sl<QuestionController>().fetchQuestions();
    sl<QuestionController>().animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );

    sl<QuestionController>().animation = Tween<double>(begin: 0 , end: 1)
        .animate(sl<QuestionController>().animationController)
      ..addListener(() {
        setState(() {});
      });
    sl<QuestionController>()
        .animationController
        .forward()
        .whenComplete(sl<QuestionController>().nextQuestion);
    sl<QuestionController>().pageController = PageController();
  }

  @override
  void dispose() {
    sl<QuestionController>().fetchQuestions();
    sl<QuestionController>().animationController.dispose();
    sl<QuestionController>().pageController.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Go.to.back(),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            text: "Question ${sl<QuestionController>().questionNumber}",
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.w500, color: Colors.green),
            children: [
              TextSpan(
                text: "/${sl<QuestionController>().questionLimit}",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: (() {
                sl<QuestionController>().nextQuestion();
              }),
              child: const Text("Skip")),
        ],
      ),
      body: QuizPageBody(),
    );
  }
}
