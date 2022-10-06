

import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_quiz_app/core/error/failures/failure.dart';
import 'package:flutter_firebase_quiz_app/core/error/failures/general_failures.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/entities/shared_preferences_keys.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/repo/shared_preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  final SharedPreferences sharedPreferences;

  SharedPreferencesRepositoryImpl(this.sharedPreferences);

  @override
  Future<Either<Failure, String>> getDataFromKey(SharedPreferencesKeys key) async {
    String? value = sharedPreferences.getString(key.sharedKeyStateToKeyValues());
    if (value != null) {
      return Right(value);
    } else {
      if (key == SharedPreferencesKeys.NOTIFICATION) return Left(ListEmptyFailure());
      return Left(NullPointerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeDataFromKey(SharedPreferencesKeys key) async {
    bool isRemoved = await sharedPreferences.remove(key.sharedKeyStateToKeyValues());
    if (isRemoved) {
      return const Right(null);
    } else {
      return Left(NullPointerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveDataFromKey(SharedPreferencesKeys key, String data) async {
    bool isAdd = await sharedPreferences.setString(key.sharedKeyStateToKeyValues(), data);
    if (isAdd) {
      return const Right(null);
    } else {
      return Left(NullPointerFailure());
    }
  }
}
