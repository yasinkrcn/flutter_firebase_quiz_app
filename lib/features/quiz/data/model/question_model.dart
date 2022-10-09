import 'dart:convert';

import 'package:flutter_firebase_quiz_app/features/quiz/domain/entities/question_entities.dart';

class QuestionModel extends QuestionsEntities {
  QuestionModel({
    required String question,
    required String answer,
    required List options,
  }) : super(
          answer: answer,
          question: question,
          options: options,
        );

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      answer: map['answer'],
      question: map['question'],
      options: List.from(map['options'].toList()),
    );
  }

  Map<String, dynamic> toMap() => {
        'answer': answer,
        'question': question,
        'options': [],
      };

  String toJson() => json.encode(toMap());
}
