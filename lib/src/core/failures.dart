import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

///{@template Authfailure}
///Differents failures which may happened when the user tries to get authed
/// {@endtemplate}
@freezed
class Authfailure with _$Authfailure {
  ///User cancel the operation himself
  const factory Authfailure.cancelledByUser() = CancelledByUser;

  ///We got an unknown error from the server side
  const factory Authfailure.serverError() = ServerError;

  /// The emailprovided by the user already exist in the server
  const factory Authfailure.emailAlreadyInUse() = EmailAlreadyInUse;

  /// The combination of password and email provided is invalid
  const factory Authfailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}

///{@template Valuefailure<T>}
///A Freezed union of possible failure about value objects,
///{@endtemplate}
@freezed
class Valuefailure<T> with _$Valuefailure<T> {
  ///Is called when the provided email is invalid (doesn't fit the requirements)
  const factory Valuefailure.invalidEmail({required T failedValue}) =
      InvalidEmail<T>;

  ///Is called when the provided password is invalid (doesn't fit the requirements)
  const factory Valuefailure.shortPassword({required T failedValue}) =
      ShortPassword<T>;
}
