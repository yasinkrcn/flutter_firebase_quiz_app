

import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/functions/show_custom_messenger.dart';

class CustomMessenger extends StatelessWidget {
  const CustomMessenger({Key? key, required this.state, required this.content}) : super(key: key);
  final CustomMessengerState state;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black.withOpacity(.1),
          ),
        ],
        border: Border.all(
          color: state.getColor(),
          width: .5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                height: 32,
                width: 4,
                decoration: BoxDecoration(
                  color: state.getColor(),
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(4),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Icon(state.getIcon(), color: state.getColor()),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  content,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
