import 'dart:convert';

import 'package:flutter_firebase_quiz_app/features/auth/domain/entities/user_entities.dart';

class UserModel extends UserEntities {
  UserModel({
    required String id,
    required String name,
    required String surname,
    required String email,
    String? profilePhotoUrl,
  }) : super(
          id: id,
          name: name,
          surname: surname,
          email: email,
          profilePhotoUrl: profilePhotoUrl!,
        );

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'],
        name: map['name'],
        surname: map['surname'],
        email: map['email'],
        profilePhotoUrl: map['profilePhotoUrl'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'surname': surname,
        'email': email,
        'profilePhotoUrl': profilePhotoUrl,
      };

  String toJson() => json.encode(toMap());
}
