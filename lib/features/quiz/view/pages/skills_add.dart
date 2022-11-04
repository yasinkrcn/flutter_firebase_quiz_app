import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/shared_widgets/app_text_form_field.dart';
import 'package:flutter_firebase_quiz_app/core/utils/screen_size.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view_model/question_controller.dart';
import 'package:provider/provider.dart';

class SkillsAdd extends StatelessWidget {
  const SkillsAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      body: SafeArea(
        child: Consumer<QuestionController>(
          builder: (context, provider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('Soru'),
                    AppTextFormField.standart(
                        hintText: 'type question',
                        controller: provider.questionController),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('0'),
                    ),
                    AppTextFormField.standart(
                        hintText: 'A', controller: provider.optionAController),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('1'),
                    ),
                    AppTextFormField.standart(
                        hintText: 'B', controller: provider.optionBController),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('2'),
                    ),
                    AppTextFormField.standart(
                        hintText: 'C', controller: provider.optionCController),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('3'),
                    ),
                    AppTextFormField.standart(
                        hintText: 'D', controller: provider.optionDController),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text('index'),
                    AppTextFormField.standart(
                      hintText: 'answer index',
                      controller: provider.answerIndexController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      provider.uploadSkills(
                          answer: int.parse(
                            provider.answerIndexController.text,
                          ),
                          optionA: provider.optionAController.text,
                          optionB: provider.optionBController.text,
                          optionC: provider.optionCController.text,
                          optionD: provider.optionDController.text,
                          question: provider.questionController.text);
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          'Send skill',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
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
