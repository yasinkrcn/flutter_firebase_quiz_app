import 'package:flutter_firebase_quiz_app/features/quiz/data/model/question_model.dart';

class QuestionsEntities {
  final String question;
  final String answer;
  final List<OptionsModel> options;

  QuestionsEntities({
    required this.question,
    required this.answer,
    required this.options,
  });
}
