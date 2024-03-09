import 'package:tourism_app/error/model/error_exception.dart';

sealed class Result<S> {
  const Result();
}

final class Success<S> extends Result<S> {
  const Success(this.value);
  final S value;
}

final class Failure<S> extends Result<S> {
  const Failure(this.error);
  final ErrorException error;
}
