import 'package:flutter_firebase_quiz_app/core/init/injection_container.dart';
import 'package:flutter_firebase_quiz_app/features/auth/view_model/login_provider.dart';
import 'package:flutter_firebase_quiz_app/features/auth/view_model/register_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/quiz/view_model/quiz_provider.dart';



class MainProviderList {
  /// This list includes providers that should stand up when the application starts.
  static List<SingleChildWidget> mainProviderlist = [
    ChangeNotifierProvider(create: (_) => sl<RegisterProvider>()),
    ChangeNotifierProvider(create: (_) => sl<LoginProvider>()),
    ChangeNotifierProvider(create: (_) => sl<QuizProvider>()),
  
  ];

  /// This method returns the provider list that should stand up at the beginning of the application.
  static List<SingleChildWidget> getMainProviderList() {
    return mainProviderlist;
  }
}
