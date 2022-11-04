import 'dart:convert';

import 'package:flutter_firebase_quiz_app/features/quiz/domain/entities/question_entities.dart';

class QuestionModel extends QuestionsEntities {
  QuestionModel({
    required String question,
    required int answer,
    required List options,
  }) : super(
          answer: answer,
          question: question,
          options: options,
        );

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      answer: map['answer_index'],
      question: map['question'],
      options: List.from(map['options'].toList()),
    );
  }

  Map<String, dynamic> toMap() => {
        'answer_index': answer,
        'question': question,
        'options': options,
      };

  String toJson() => json.encode(toMap());
}
