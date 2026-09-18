import 'dart:io';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import 'tracking_task_handler.dart';

/// Façade foreground service pour le tracking chauffeur (Android).
/// Garde le processus en vie en arrière-plan : les positions continuent
/// d'être poussées même app minimisée. Sur iOS, le système limite
/// l'exécution (~30 s / 15 min) — le heartbeat + filtre périmés compensent.
abstract class DriverTrackingService {
  static const int serviceId = 256;
  static const String _sessionKey = 'tracking_session';
  static bool _initialized = false;

  static void ensureInitialized() {
    if (_initialized) return;
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'driver_tracking',
        channelName: 'Suivi chauffeur',
        channelDescription:
            'Notification affichée pendant la mise en service d\'un bus.',
        onlyAlertOnce: true,
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: false,
        playSound: false,
      ),
      foregroundTaskOptions: ForegroundTaskOptions(
        eventAction: ForegroundTaskEventAction.repeat(15000),
        autoRunOnBoot: false,
        autoRunOnMyPackageReplaced: false,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
    _initialized = true;
  }

  /// Permissions nécessaires avant démarrage (notification Android 13+).
  /// Retourne false si l'utilisateur refuse (tracking 1er plan uniquement).
  static Future<bool> requestPermissions() async {
    if (!Platform.isAndroid && !Platform.isIOS) return true;
    final permission =
        await FlutterForegroundTask.checkNotificationPermission();
    if (permission != NotificationPermission.granted) {
      final after =
          await FlutterForegroundTask.requestNotificationPermission();
      if (after != NotificationPermission.granted) return false;
    }
    return true;
  }

  static Future<void> saveSession(Map<String, dynamic> session) =>
      FlutterForegroundTask.saveData(key: _sessionKey, value: session);

  static Future<void> clearSession() =>
      FlutterForegroundTask.removeData(key: _sessionKey);

  static Future<ServiceRequestResult> start({required int busNumber}) {
    ensureInitialized();
    return FlutterForegroundTask.startService(
      serviceId: serviceId,
      serviceTypes: [ForegroundServiceTypes.location],
      notificationTitle: 'Bus $busNumber en service',
      notificationText: 'Position partagée en direct',
      notificationIcon: null,
      notificationButtons: [
        const NotificationButton(id: 'btn_stop', text: 'Arrêter'),
      ],
      callback: trackingCallback,
    );
  }

  static Future<ServiceRequestResult> stop() =>
      FlutterForegroundTask.stopService();

  static Future<bool> get isRunning =>
      FlutterForegroundTask.isRunningService;
}
