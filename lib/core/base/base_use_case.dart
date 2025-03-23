import 'package:fpdart/fpdart.dart';

/// BaseUseCase is an abstract class for use cases
///
/// It provides utility functions for working with Either type
abstract class BaseUseCase<T> {
  const BaseUseCase();

  /// Maps a function result to Either
  ///
  /// Wraps a function call in a try-catch block and returns an Either
  /// Left side contains the error message (String), Right side contains the result
  Future<Either<String, U>> mapResultToEither<U>(Future<U> Function() function) async {
    try {
      final result = await function();
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }

  /// Extracts the value from a successful Either
  ///
  /// Returns the right value if Either is Right, otherwise returns defaultValue
  U getRight<U>(Either<String, U> either, U defaultValue) {
    return either.fold((_) => defaultValue, (r) => r);
  }

  /// Executes a function that returns void and handles errors
  ///
  /// Wraps a void function in a try-catch block and returns an Either
  /// Left side contains the error message (String), Right side contains nothing (Unit)
  Future<Either<String, Unit>> doVoid(Future<void> Function() function) async {
    try {
      await function();
      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }
} 