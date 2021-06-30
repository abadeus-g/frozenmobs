import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:frozenmobs/src/core/core.dart';
import 'package:frozenmobs/src/core/value.object.dart';
import 'package:uuid/uuid.dart';

import 'validators.dart';

///{@template EmailAddress}
/// Email Address is a value object type which store a valid email in string.
/// This custom type prevent us from sending an invalid email to server
///{@endTemplate}
class EmailAddress extends ValueObject<String> {
  const EmailAddress._(this.value);

  ///Email factory validator
  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  ///
  factory EmailAddress.fromMap(Map<String, dynamic> map) =>
      EmailAddress(map['emailAddress']);

  ///
  factory EmailAddress.fromJson(String source) =>
      EmailAddress.fromMap(json.decode(source));

  @override
  final Either<Valuefailure<String>, String> value;

  @override
  // TODOimplement EmailAddress props
  List<Object?> get props => [value];

  /// Convert EmailAddress to map
  Map<String, dynamic> toMap() {
    return {
      'emailAddress': value,
    };
  }

  /// Encode EmailAddress object in to json format
  String toJson() => json.encode(toMap());

  @override
  String toString() => '$value';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmailAddress && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

///{@template Password}
/// Password is a value object type which store a valid password in string.
/// This custom type prevent us from sending an invalid password to server
/// {@endTemplate}
class Password extends ValueObject<String> {
  const Password._(this.value);

  ///Password factory validator
  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  @override
  final Either<Valuefailure<String>, String> value;

  @override
  // TODOimplement Password props
  List<Object?> get props => [value];
}

///{@template UniqueId}
/// Class in charge of generating a custom id based on uuid package or
/// Some String id from database
/// {@endTemplate}
class UniqueId extends ValueObject<String> {
  const UniqueId._(this.value);

  ///Unique id based on datetime combination
  factory UniqueId() => UniqueId._(
        right(const Uuid().v1()),
      );

  ///Unique id based on unique String
  factory UniqueId.fromUniqueString(String uniqueId) => UniqueId._(
        right(uniqueId),
      );

  /// Unique id for sales
  factory UniqueId.forSales() => UniqueId._(right(const Uuid().v4()));

  /// Unique id for stores based on their name (e-commerce)
  factory UniqueId.forStores(String name) =>
      UniqueId._(right(const Uuid().v5('mob', name)));

  ///Retrieve UniqueId based on map
  factory UniqueId.fromMap(Map<String, dynamic> map) =>
      UniqueId.fromUniqueString(map['uniqueId']);

  /// Retrieve Unique id based on json format
  factory UniqueId.fromJson(String source) =>
      UniqueId.fromMap(json.decode(source));

  ///Map the UNique Id
  Map<String, dynamic> toMap() {
    return {
      'value': value.fold((l) => 'Value Failure', (r) => r),
    };
  }

  /// Convert to json format
  String toJson() => json.encode(toMap());

  @override
  String toString() => 'UniqueId(value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UniqueId && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  // TODOimplement UniqueId props
  List<Object?> get props => [value];

  @override
  final Either<Valuefailure<String>, String> value;
}
