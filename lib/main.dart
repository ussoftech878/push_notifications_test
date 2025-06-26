import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notification_home.dart';

void main() {
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
