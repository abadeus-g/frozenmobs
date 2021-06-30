import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'errors.dart';
import 'failures.dart';

///{@template ValueObject<T>}
///Value Object is a type of value which validate the generic type T.
///With this type we are sure that value sent or user are totally so no invalid
///value is sent to server.
///{@endTemplate}
@immutable
abstract class ValueObject<T> extends Equatable{
  ///{@macro ValueObject<T>}
  const ValueObject();

  ///Value getter for the ValueObject
  Either<Valuefailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [Valuefailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  ///Return either a failure if value is invalid or a unit if value is okay
  Either<Valuefailure<T>, Unit> get failureOrUnit {
    return value.fold(
      left,
      (r) => right(unit),
    );
  }

  ///Return true if the value is valid
  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
