import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/usecases/get_data_from_key.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/usecases/remove_data_from_key.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/usecases/save_data_from_key.dart';
import 'package:flutter_firebase_quiz_app/features/auth/view_model/login_provider.dart';
import 'package:flutter_firebase_quiz_app/features/auth/view_model/register_provider.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view_model/question_controller.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/local_data_source/shared_preferences/data/repo/shared_preferences_repository_impl.dart';
import '../utils/local_data_source/shared_preferences/domain/repo/shared_preferences_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External
  // ? Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //* Repo
  sl.registerLazySingleton<SharedPreferencesRepository>(
      () => SharedPreferencesRepositoryImpl(sl()));

  //* Use Case
  sl.registerLazySingleton(() => GetDataFromKey(sl()));
  sl.registerLazySingleton(() => RemoveDataFromKey(sl()));
  sl.registerLazySingleton(() => SaveDataFromKey(sl()));

  //? Authentication
  sl.registerLazySingleton(
      () => RegisterProvider(saveDataFromKey: sl<SaveDataFromKey>()));
  sl.registerLazySingleton(
      () => LoginProvider(saveDataFromKey: sl<SaveDataFromKey>()));

  // sl.registerLazySingleton(() => QuizProvider());
  sl.registerLazySingleton(() => QuestionController());
  // sl.registerLazySingleton(() => LoginProvider(saveDataFromKey: sl<SaveDataFromKey>()));

  //? Authentication
  // sl.registerLazySingleton(() => HomeProvider(getDataFromKey: sl<GetDataFromKey>()));

  //? Profile
  // sl.registerLazySingleton(() => ProfileProvider(
  //       getDataFromKey: sl<GetDataFromKey>(),
  //       saveDataFromKey: sl<SaveDataFromKey>(),
  //     ));
}
