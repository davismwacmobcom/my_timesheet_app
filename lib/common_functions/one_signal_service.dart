import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../constants/app_constants.dart';

StreamController<String>? notificationStreamController;
Stream<String>? notificationStream;

class OneSignalNotificationServices {
  static String? playerId;
  static bool isTapped = false;

  static initialize() async {
    OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.initialize("bb756438-e785-4edc-a85c-7f292ff96fb2");
    requestNotificationPermission();
  }

  static Future<bool> requestNotificationPermission() async {
    try {
      bool value = await OneSignal.Notifications.requestPermission(true);
      return value;
    } catch (e) {
      return false;
    }
  }

  static Future<void> getOneSignalPlayerId() async {
    int tick = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      tick = timer.tick;
      final osUserId = OneSignal.User.pushSubscription.id;
      if (osUserId == null || osUserId.isEmpty) {
        if (tick > 10) {
          timer.cancel();
        }
      } else {
        playerId = osUserId;
        enableDisablePushNotification(isEnable: true);
        log('PLAYER ID: $playerId');
        timer.cancel();
        addForegroundWillDisplayListener();
      }
      log('PLAYER ID 2: $playerId');
    });
  }

  static addForegroundWillDisplayListener() {
    OneSignal.Notifications.addForegroundWillDisplayListener((event) async {
      event.notification.display();
    });
  }

  // static notificationClickListener(BuildContext context) {
  //   OneSignal.Notifications.addClickListener((event) {
  //     if (context.mounted && !isTapped) {
  //      String? currentRoute = AppConstants.currentRoute;
  //       if (currentRoute != RouteConstants.routeNotification) {
  //         Navigator.pushNamed(context, RouteConstants.routeNotification);
  //       } else {
  //       notificationStreamController?.sink.add('notification_clicked');
  //       }
  //       event.notification.body;
  //     }
  //   });
  // }

  //
  // static sendTag(String k, v) {
  //   OneSignal.User.addTagWithKey(k, v);
  // }
  //
  // static addPushSubscriptionListener() {
  //   OneSignal.User.pushSubscription.addObserver((state) {});
  // }
  //
  static enableDisablePushNotification({required bool isEnable}) async {
    if (isEnable) {
      OneSignal.User.pushSubscription.optIn();
    } else {
      OneSignal.User.pushSubscription.optOut();
    }
  }
}
