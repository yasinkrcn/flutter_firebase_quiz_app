import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_quiz_app/core/error/failures/failure.dart';
import 'package:flutter_firebase_quiz_app/core/usecase/usecase.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/entities/shared_preferences_key_params.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/repo/shared_preferences_repository.dart';



class RemoveDataFromKey implements Usecase<void, SharedPreferenceKeyParams> {
  final SharedPreferencesRepository repository;

  RemoveDataFromKey(this.repository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await repository.removeDataFromKey(params.key);
  }
}
