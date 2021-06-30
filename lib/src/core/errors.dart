import 'failures.dart';

///Error based on User's Authentication state
class NotAuthenticatedError extends Error {}

///{@template UnexpectedValueError}
///Not preview/calculate errors
///{@endtemplate}
class UnexpectedValueError extends Error {
  ///{@macro UnexpectedValueError}
  UnexpectedValueError(this.valueFailure);

  ///The failed value
  final Valuefailure valueFailure;

  @override
  String toString() {
    const explanation =
        'Encountered a Value failure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
