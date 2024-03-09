class ErrorException implements Exception {
  final String _message;

  ErrorException([
    this._message = "",
  ]);

  @override
  String toString() => "Error: $message";

  String get message => _message;
}
