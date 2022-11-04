import 'package:flutter/cupertino.dart';

import 'package:flutter_firebase_quiz_app/features/auth/view/pages/login_page.dart';
import 'package:flutter_firebase_quiz_app/features/auth/view/pages/sign_up_page.dart';
import 'package:flutter_firebase_quiz_app/features/home/view/pages/home_page.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/pages/quiz_page.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/pages/score_page.dart';

class PageRoutes {
  static const String loginPage = "/loginPage";
  static const String signUpPage = "/signUpPage";
  static const String homePage = "/homePage";
  static const String quizPage = "/quizPage";
  static const String scorePage = "/scorePage";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PageRoutes.loginPage:
      return CupertinoPageRoute(builder: (_) => const LoginPage());
    case PageRoutes.signUpPage:
      return CupertinoPageRoute(builder: (_) => SignUpPage());
    case PageRoutes.homePage:
      return CupertinoPageRoute(builder: (_) => const HomePage());
    case PageRoutes.quizPage:
      return CupertinoPageRoute(builder: (_) => const QuizPage());
    case PageRoutes.scorePage:
      return CupertinoPageRoute(builder: (_) => const ScorePage());

    default:
      return CupertinoPageRoute(builder: (_) => const LoginPage());
  }
}
