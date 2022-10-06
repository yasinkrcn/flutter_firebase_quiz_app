import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_quiz_app/core/error/failures/failure.dart';


abstract class IAuthRepository {
  Future<Either<Failure, UserCredential>> signInAnonymously();
  Future<Either<Failure, UserCredential>> createUserWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, void>> deleteUser();
  // Future<Either<Failure, User?>> googleSignIn();
}
