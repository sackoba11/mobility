import 'package:get_storage/get_storage.dart';

/// Session de mise en service persistée localement (GetStorage).
/// Permet au chauffeur de retrouver son service après fermeture de l'app,
/// et de clôturer les services fantômes au redémarrage.
class DriverSessionStore {
  static const _boxName = 'driver_session';
  static const _key = 'active_service';

  static GetStorage get _box => GetStorage(_boxName);

  /// Sauvegarde un service actif.
  static Future<void> save({
    required int busNumber,
    required String idBus,
    required String busSource,
    required String busDestination,
  }) async {
    await _box.write(_key, {
      'busNumber': busNumber,
      'idBus': idBus,
      'busSource': busSource,
      'busDestination': busDestination,
      'startedAt': DateTime.now().toIso8601String(),
      'lastHeartbeat': DateTime.now().toIso8601String(),
    });
  }

  /// Met à jour le dernier heartbeat local (appel réussi).
  static Future<void> touchHeartbeat() async {
    final session = read();
    if (session == null) return;
    session['lastHeartbeat'] = DateTime.now().toIso8601String();
    await _box.write(_key, session);
  }

  /// Session active éventuelle, null si aucun service en cours.
  static Map<String, dynamic>? read() {
    final raw = _box.read(_key);
    if (raw is Map) return Map<String, dynamic>.from(raw);
    return null;
  }

  static Future<void> clear() async => _box.remove(_key);

  /// Session périmée localement (app tuée depuis longtemps).
  static bool isStale(Map<String, dynamic> session,
      {Duration maxAge = const Duration(minutes: 15)}) {
    final raw = session['lastHeartbeat'] as String?;
    final last = raw == null ? null : DateTime.tryParse(raw);
    if (last == null) return true;
    return DateTime.now().difference(last) > maxAge;
  }
}
