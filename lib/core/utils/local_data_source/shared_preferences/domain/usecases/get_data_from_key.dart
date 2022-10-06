import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_quiz_app/core/error/failures/failure.dart';
import 'package:flutter_firebase_quiz_app/core/usecase/usecase.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/entities/shared_preferences_key_params.dart';
import 'package:flutter_firebase_quiz_app/core/utils/local_data_source/shared_preferences/domain/repo/shared_preferences_repository.dart';



class GetDataFromKey implements Usecase<String, SharedPreferenceKeyParams> {
  SharedPreferencesRepository repository;

  GetDataFromKey(this.repository);

  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.getDataFromKey(params.key);
  }
}
