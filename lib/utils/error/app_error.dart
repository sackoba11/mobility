/// Erreurs métier de l'app (Phase 2a).
/// Les repositories retournent `Either<AppError, T>`, les controllers
/// affichent [userMessage] via snackbar au lieu d'avaler l'erreur.
abstract class AppError {
  String getError();

  /// Message affichable à l'utilisateur (FR).
  String get userMessage => getError();
}

class GenericAppError extends AppError {
  final String _message;
  GenericAppError(this._message) : assert(_message.isNotEmpty);
  @override
  String getError() => _message;
}

class NetworkFailure extends AppError {
  final String detail;
  NetworkFailure([this.detail = "Vérifiez votre connexion internet."]);
  @override
  String getError() => "Réseau : $detail";
}

class ServerFailure extends AppError {
  final String detail;
  ServerFailure([this.detail = "Réessayez dans un moment."]);
  @override
  String getError() => "Serveur : $detail";
}

class NotFoundFailure extends AppError {
  final String what;
  NotFoundFailure(this.what);
  @override
  String getError() => "$what introuvable.";
}

class PermissionFailure extends AppError {
  final String detail;
  PermissionFailure([this.detail = "Autorisation requise."]);
  @override
  String getError() => detail;
}
