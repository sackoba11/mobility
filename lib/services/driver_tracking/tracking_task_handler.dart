import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobility/firebase_options.dart';

/// Callback d'entrée du foreground service (isolate d'arrière-plan).
/// Écrit la position du chauffeur dans Firestore toutes les 15 s,
/// même quand l'app n'est pas au premier plan.
@pragma('vm:entry-point')
void trackingCallback() {
  FlutterForegroundTask.setTaskHandler(TrackingTaskHandler());
}

class TrackingTaskHandler extends TaskHandler {
  static const _sessionKey = 'tracking_session';
  bool _firebaseReady = false;

  Future<bool> _ensureFirebase() async {
    if (_firebaseReady) return true;
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }
      _firebaseReady = true;
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> _pushPosition() async {
    try {
      final session =
          await FlutterForegroundTask.getData(key: _sessionKey);
      if (session is! Map) return;
      final map = Map<String, dynamic>.from(session);
      final busNumber = map['busNumber'];
      final idBus = map['idBus']?.toString() ?? '';
      if (busNumber is! int || idBus.isEmpty) return;

      if (!await _ensureFirebase()) return;

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );

      await FirebaseFirestore.instance
          .collection('activeBus')
          .doc('${busNumber}_$idBus')
          .update({
        'position': {
          'lat': position.latitude,
          'long': position.longitude,
        },
        'lastSeen': FieldValue.serverTimestamp(),
      });

      FlutterForegroundTask.updateService(
        notificationText:
            'Bus $busNumber • ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}',
      );
    } catch (_) {
      // Best-effort : le timer de l'isolate principal prend le relais
      // quand l'app est au premier plan.
    }
  }

  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    await _pushPosition();
  }

  @override
  void onRepeatEvent(DateTime timestamp) {
    _pushPosition();
  }

  @override
  Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {}

  @override
  void onReceiveData(Object data) {}

  @override
  void onNotificationButtonPressed(String id) {
    if (id == 'btn_stop') {
      FlutterForegroundTask.sendDataToMain({'action': 'stop_service'});
    }
  }

  @override
  void onNotificationPressed() {}

  @override
  void onNotificationDismissed() {}
}
