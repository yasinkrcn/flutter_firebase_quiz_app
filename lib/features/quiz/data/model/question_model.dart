import 'dart:convert';
import 'package:flutter_firebase_quiz_app/features/quiz/domain/entities/options_entities.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/domain/entities/question_entities.dart';

class QuestionModel extends QuestionsEntities {
  QuestionModel({
    required String question,
    required String answer,
    required List<OptionsModel> options,
  }) : super(
          answer: answer,
          question: question,
          options: options,
        );

  factory QuestionModel.fromMap(Map<String, dynamic> map) => QuestionModel(
        answer: map['answer'],
        question: map['question'],
        options: List<OptionsModel>.from(
            map['options'].map((x) => OptionsModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'answer': answer,
        'question': question,
        'options': List<dynamic>.from(options.map((x) => x.toMap())),
      };

  String toJson() => json.encode(toMap());
}

class OptionsModel extends OptionsEntites {
  OptionsModel({
    required String optiona,
    required String optionb,
    required String optionc,
    required String optiond,
  }) : super(
          optiona: optiona,
          optionb: optionb,
          optionc: optionc,
          optiond: optiond,
        );

  factory OptionsModel.fromMap(Map<String, dynamic> map) => OptionsModel(
        optiona: map['optiona'],
        optionb: map['optionb'],
        optionc: map['optionc'],
        optiond: map['optiond'],
      );

  Map<String, dynamic> toMap() => {
        'optiona': optiona,
        'optionb': optionb,
        'optionc': optionc,
        'optiond': optiond,
      };
}
