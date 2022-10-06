

import 'package:flutter_firebase_quiz_app/core/error/failures/failure.dart';

class NullPointerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ListEmptyFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}
