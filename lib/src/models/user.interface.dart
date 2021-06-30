import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:frozenmobs/src/constants/constants.dart';

/// {@template user}
/// User model inspired from firebase user
///
/// [UserInterface.unknown] represents an unauthenticated user.
/// {@endtemplate}
class UserInterface extends Equatable {
  ///{@macro user}
  const UserInterface({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.photo,
  });

  /// Retrieve user interface based on provided map
  factory UserInterface.fromMap(Map<String, dynamic> map) {
    return UserInterface(
      email: EmailAddress.fromMap(map['email']),
      uid: UniqueId.fromMap(map['uid']),
      name: map['name'],
      photo: map['photo'],
      phoneNumber: map['phoneNumber'],
    );
  }

  /// Retrive UserInterface based on json source
  factory UserInterface.fromJson(String source) =>
      UserInterface.fromMap(json.decode(source));

  /// The current user's email address.
  final EmailAddress? email;

  /// The current user's id.
  final UniqueId uid;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// Phone number for the current's user
  final String? phoneNumber;

  @override
  bool get stringify => true;

  /// Unknown user which represents an unauthenticated user.
  static final unknown = UserInterface(
    uid: UniqueId.fromUniqueString(''),
    name: '',
    email: EmailAddress(''),
    phoneNumber: '',
  );

  /// Convenience getter to determine whether the current user is unauthenticated.
  bool get isUnAuthed => this == UserInterface.unknown;

  /// Convenience getter to determine whether the current user is authenticated.
  bool get isAuthed => this != UserInterface.unknown;

  /// Convert our user interface to map
  Map<String, dynamic> toMap() => {
        'email': email?.toMap(),
        'uid': uid.toMap(),
        'name': name,
        'photo': photo,
        'phoneNumber': phoneNumber,
      };

  /// COnvert to json format based on source
  String toJson() => json.encode(toMap());

  @override
  // TODOimplement UserInterface props
  List<Object?> get props => [uid, email, name, phoneNumber];
}
