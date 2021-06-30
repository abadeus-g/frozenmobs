import 'package:dartz/dartz.dart';
import 'package:frozenmobs/src/core/core.dart';

///Check whether the provided EmailAddress fit requirements or not
Either<Valuefailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(Valuefailure.invalidEmail(failedValue: input));
  }
}

///Check whether the provided password fit requirements or not
Either<Valuefailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(Valuefailure.shortPassword(failedValue: input));
  }
}
