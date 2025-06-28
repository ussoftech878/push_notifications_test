import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_notifications_test/services/firebase_messaging_service.dart';
import 'notification_home.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseNotificationService().initialize();
  runApp(
    ChangeNotifierProvider(
      create: (_) => NotificationProvider(),
      child: const MainApp(),
    ),
  );
}

class NotificationProvider extends ChangeNotifier {
  String? _notification;
  String? get notification => _notification;

  void showNotification(String message) {
    _notification = message;
    notifyListeners();
  }

  void clearNotification() {
    _notification = null;
    notifyListeners();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NotificationHome());
  }
}
