import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_quiz_app/core/error/failures/failure.dart';
import 'package:flutter_firebase_quiz_app/core/usecase/usecase.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/entities/shared_preferences_key_with_value_params.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/repo/shared_preferences_repository.dart';



class SaveDataFromKey implements Usecase<void, SharedPreferenceKeyWithValueParams> {
  final SharedPreferencesRepository repository;

  SaveDataFromKey(this.repository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.saveDataFromKey(params.key, params.value);
  }
}
