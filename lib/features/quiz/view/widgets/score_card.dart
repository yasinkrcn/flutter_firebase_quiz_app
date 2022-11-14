import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/constants/assets_paths.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScoreCard extends StatelessWidget {
  final String text;
  final String providerText;
  final String asset;
  final Color color;

  const ScoreCard({
    Key? key,
    required this.text,
    required this.asset,
    required this.color,
    required this.providerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: Container(
        alignment: Alignment.center,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 12,
            ),
            SvgPicture.asset(asset, height: 48),
            const SizedBox(
              width: 12,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(50)),
              child: Text(
                providerText,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
