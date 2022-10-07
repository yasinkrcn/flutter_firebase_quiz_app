import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/data/model/question_model.dart';

class QuizProvider extends ChangeNotifier {
  List<QuestionModel> questions = [];

  // QuizProvider({
  //   required this.questions
  // })

  int categoryIndex = 0;

  int _time = 18;

  int get time => _time;

  set time(int newTime) {
    _time = newTime;

    notifyListeners();
  }

  void onInit() async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time == 0) {
        print('clock stop');
        timer.cancel();
      } else {
        time -= 1;
      }
    });

    await fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    final questionList = await FirebaseFirestore.instance
        .collection('category')
        .doc('math')
        .collection('questions')
        // .doc('options')
        .get();

    final questionDocs = questionList.docs;

    questions = questionDocs.map((value) {
      return QuestionModel.fromMap(value.data());
    }).toList();
  }

  void categoryIndexPlus() {
    if (categoryIndex < questions.length - 1) {
      categoryIndex++;
    }

    notifyListeners();
  }

  void categoryIndexMinus() {
    if (categoryIndex > 0) {
      categoryIndex--;
    }

    notifyListeners();
  }
}
