import 'dart:core';
import 'dart:io';

import 'package:flutter/foundation.dart';

class User {
  String nik;
  String nama;
  String email;
  String userID;
  String profilePictureURL;
  String appIdentifier;

  User(
      {this.nik = '',
      this.nama = '',
      this.email = '',
      this.userID = '',
      this.profilePictureURL = ''})
      : appIdentifier =
            'Flutter Login Screen ${kIsWeb ? 'Web' : Platform.operatingSystem}';

  String fullName() => '$nama $email';

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        nik: parsedJson['nik'] ?? '',
        nama: parsedJson['nama'] ?? '',
        email: parsedJson['email'] ?? '',
        userID: parsedJson['id'] ?? parsedJson['userID'] ?? '',
        profilePictureURL: parsedJson['profilePictureURL'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'nik': nik,
      'nama': nama,
      'email': email,
      'id': userID,
      'profilePictureURL': profilePictureURL,
      'appIdentifier': appIdentifier
    };
  }
}
