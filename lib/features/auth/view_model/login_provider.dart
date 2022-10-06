import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_quiz_app/core/functions/show_custom_messenger.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/_local_data_source_exports.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/route_manager.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/router.dart';
import 'package:flutter_firebase_quiz_app/features/auth/data/model/user_model.dart';

class LoginProvider extends ChangeNotifier {
  final SaveDataFromKey saveDataFromKey;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginProvider({required this.saveDataFromKey});

  Future<void> login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      DocumentSnapshot<Map<String, dynamic>> documentSnapShot =
          await FirebaseFirestore.instance
              .collection('tempUsers')
              .doc(userCredential.user!.uid)
              .get();

      UserModel loggedInUser = UserModel.fromMap(documentSnapShot.data()!);

      saveDataFromKey(
        SharedPreferenceKeyWithValueParams(
          key: SharedPreferencesKeys.CACHE_USER_INFO,
          value: loggedInUser.toJson(),
        ),
      );

      clearController();

      Go.to.pageAndRemoveUntil(PageRoutes.homePage);
    } on FirebaseAuthException catch (e) {
      showCustomMessenger(
          CustomMessengerState.ERROR, e.message ?? "Bir sorun oluştu");
    } catch (e) {
      showCustomMessenger(CustomMessengerState.ERROR, "Somthing went wrong!");
    }
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
  }
}
