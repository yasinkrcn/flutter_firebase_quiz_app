import 'package:flutter/material.dart';

class ScoreButton extends StatelessWidget {
  final String text;
  final Color color;
  Future<dynamic> route;
   ScoreButton({
    Key? key,
    required this.text,
    required this.color,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
  route;
      },
      child: Container(
        height: 50,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white, width: 3)),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
