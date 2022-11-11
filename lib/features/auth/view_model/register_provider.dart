import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_quiz_app/core/functions/show_custom_messenger.dart';
import 'package:flutter_firebase_quiz_app/core/init/injection_container.dart';
import 'package:flutter_firebase_quiz_app/core/shared_widgets/custom_messenger.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/entities/shared_preferences_key_params.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/entities/shared_preferences_key_with_value_params.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/entities/shared_preferences_keys.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/usecases/remove_data_from_key.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/usecases/save_data_from_key.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/route_manager.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/router.dart';
import 'package:flutter_firebase_quiz_app/features/auth/data/model/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterProvider extends ChangeNotifier {
  final SharedPreferences? prefs;
  final SaveDataFromKey saveDataFromKey;

  File? profilePhotoFile;

  RegisterProvider({
    this.prefs,
    required this.saveDataFromKey,
  });

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> getProfilePhotoImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;

    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profilePhotoFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> createUser({
    String? id,
    required String name,
    required String surname,
    required String email,
    required String password,
  }) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    String? imageUrl;
    if (profilePhotoFile != null) {
      imageUrl = await _uploadProfilePhotoFile();
    }

    UserModel createUser = UserModel(
        id: userCredential.user!.uid,
        name: name,
        surname: surname,
        email: email,
        profilePhotoUrl: imageUrl);

    final tempUserCollection =
        FirebaseFirestore.instance.collection('tempUsers');
    tempUserCollection.doc(createUser.id).set(createUser.toMap());

    saveDataFromKey(
      SharedPreferenceKeyWithValueParams(
        key: SharedPreferencesKeys.CACHE_USER_INFO,
        value: createUser.toJson(),
      ),
    );

    clearController();
  }

  Future<String?> _uploadProfilePhotoFile() async {
    String fileName =
        "UserProfilePhoto/${FirebaseAuth.instance.currentUser!.uid}";

    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(profilePhotoFile!);

    try {
      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      CustomMessenger(
          state: CustomMessengerState.ERROR,
          content: e.message ?? e.toString());
      return null;
    }
  }

  String? getUserFirebaseId() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  void clearController() {
    nameController.clear();
    surnameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
    final removeDataFromKey = sl<RemoveDataFromKey>();
    await removeDataFromKey(
        SharedPreferenceKeyParams(key: SharedPreferencesKeys.CACHE_USER_INFO));
    Go.to.pageAndRemoveUntil(PageRoutes.loginPage);
    clearController();
  }
}
