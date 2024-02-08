abstract class AppError {
  String getError();
}

class GenericAppError implements AppError {
  final String _message;
  GenericAppError(this._message) : assert(_message.isNotEmpty);
  @override
  String getError() => _message;
}
