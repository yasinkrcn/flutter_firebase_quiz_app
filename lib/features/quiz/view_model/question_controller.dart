import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_quiz_app/core/constants/category_list.dart';
import 'package:flutter_firebase_quiz_app/core/functions/show_custom_messenger.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/route_manager.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/router.dart';
import 'package:flutter_firebase_quiz_app/features/home/data/model/category_model.dart';

import 'package:flutter_firebase_quiz_app/features/quiz/data/model/question_model.dart';

class QuestionController extends ChangeNotifier {
  late AnimationController animationController;
  late Animation animation;

  Animation get getAnimation => animation;

  PageController pageController = PageController();
  PageController get getPageController => pageController;
  List<QuestionModel> questions = [];
  int trueAnswers = 0;
  int wrongAnswers = 0;
  int questionLimit = 10;

  String categoryName = '';

  TextEditingController answerIndexController = TextEditingController();

  TextEditingController optionAController = TextEditingController();
  TextEditingController optionBController = TextEditingController();
  TextEditingController optionCController = TextEditingController();
  TextEditingController optionDController = TextEditingController();
  TextEditingController questionController = TextEditingController();


  void categorySelect(int index){
     categoryName = categoryList[index].categoryName.toLowerCase();
                  Go.to.page(PageRoutes.quizPage);
  }
  Future<void> fetchQuestions() async {
    final questionList = await FirebaseFirestore.instance
        .collection('category')
        .doc(categoryName)
        .collection('questions')
        .get();

    final questionDocs = questionList.docs;

    questions = questionDocs.map((value) {
      return QuestionModel.fromMap(value.data());
    }).toList();

    questions.shuffle();
  }

  List<QuestionModel> get questionsList => questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  int _questionNumber = 1;
  int get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  void checkAns(QuestionModel question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    animationController.stop();
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber != questionLimit) {
      _isAnswered = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      animationController.reset();

      animationController.forward().whenComplete(nextQuestion);
    } else {
      Go.to.page(PageRoutes.scorePage);
    }
  }

  void updateQuestionNumber(int index) {
    _questionNumber = index + 1;
  }

  Future<void> uploadSkills({
    required int answer,
    required String optionA,
    required String optionB,
    required String optionC,
    required String optionD,
    required String question,
  }) async {
    QuestionModel _questionModel = QuestionModel(
      answer: answer,
      options: [
        optionA,
        optionB,
        optionC,
        optionD,
      ],
      question: question,
    );

    final isEqual = await FirebaseFirestore.instance
        .collection("category")
        .doc("history")
        .collection("questions")
        .where("question", isEqualTo: questionController.text)
        .get();

    // if (isEqual.docs.isEmpty) {
    if (answerIndexController.text.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection("category")
          .doc("history")
          .collection("questions")
          .doc()
          .set(_questionModel.toMap());
    } else {
      showCustomMessenger(
          CustomMessengerState.ERROR, "Boş veri gönderemezsiniz.");
    }
    // } else {
    //   showCustomMessenger(CustomMessengerState.ERROR,
    //       "Eklemek istediğiniz soru daha önceden eklenmiştir.");
    // }

    questionController.clear();
    answerIndexController.clear();
    optionAController.clear();
    optionBController.clear();
    optionCController.clear();
    optionDController.clear();
  }
}
