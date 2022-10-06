import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_quiz_app/core/error/failures/failure.dart';
import 'package:flutter_firebase_quiz_app/features/auth/domain/repo/i_auth_repository.dart';


class AuthRepository implements IAuthRepository {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, UserCredential>> signInAnonymously() async {
    try {
      final currentUser = await auth.signInAnonymously();
      return Right(currentUser);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, UserCredential>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final currentUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(currentUser);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      {required String email, required String password, required}) async {
    try {
      final currentUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(currentUser);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await auth.signOut();
      return const Right(null);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  // @override
  // Future<Either<Failure, User?>> googleSignIn() async {
  //   try {
  //     GoogleSignIn _googleSignIn = GoogleSignIn();
  //     GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  //     if (googleSignInAccount == null) Left(NotAuthenticateFailure());
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleSignInAccount!.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //         idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

  //     final userCredential = await auth.signInWithCredential(credential);
  //     return Right(userCredential.user);
  //   } on NotAuthenticateFailure catch (failure) {
  //     return Left(failure);
  //   }
  // }

  @override
  Future<Either<Failure, void>> deleteUser() async {
    try {
      auth.currentUser!.isAnonymous
          ? auth.currentUser!.delete()
          : await auth.signOut();
      return const Right(null);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
