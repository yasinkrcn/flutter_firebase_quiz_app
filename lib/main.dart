import 'package:flutter_firebase_quiz_app/features/auth/view/pages/splash_page.dart';
import 'package:flutter_firebase_quiz_app/features/home/view/pages/home_page.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/pages/score_page.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view/pages/skills_add.dart';

import '/core/init/injection_container.dart' as sl;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/constants/main_provider_list.dart';
import 'package:flutter_firebase_quiz_app/core/keys/global_key.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/router.dart';
import 'package:flutter_firebase_quiz_app/features/auth/view/pages/login_page.dart';
import 'package:flutter_firebase_quiz_app/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: MainProviderList.getMainProviderList(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      navigatorKey: GlobalContextKey.instance.globalKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
