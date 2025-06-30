import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  String? _notification;
  String? get notification => _notification;
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void showNotification(String message) {
    _notification = message;
    notifyListeners();
  }

  void clearNotification() {
    _notification = null;
    notifyListeners();
  }

  Future<void> getFirebaseNotification() async {
    try {
      String? fcmtoken = await messaging.getToken();
      print(fcmtoken);
    } catch (e) {}
  }
}
