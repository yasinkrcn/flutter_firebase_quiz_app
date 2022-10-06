import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/init/injection_container.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view_model/quiz_provider.dart';

class ProgressBar extends StatelessWidget {
  final double width;
  final int value;
  final int totalValue;
  final double height;

  const ProgressBar({
    Key? key,
    required this.width,
    required this.value,
    required this.totalValue,
    this.height = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int time =  sl<QuizProvider>().time;
    double ratio = value / totalValue;
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(50)),
        ),
        AnimatedContainer(
          constraints: const BoxConstraints(minWidth: 0),
          height: height,
          width: width * ratio,
          duration: const Duration(seconds: 1),
          decoration: BoxDecoration(
            color: (ratio < 0.3)
                ? Colors.red
                : (ratio < 0.6)
                    ? Colors.yellow
                    : Colors.lightGreen,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(child: time > 10 ? Text(time.toString()) : const SizedBox.shrink()),
        )
      ],
    );
  }


}


