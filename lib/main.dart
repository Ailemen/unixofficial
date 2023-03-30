import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:unixofficial/network.dart';

import 'allpages.dart';

void main() async {

  runApp(MyApp());
}

//@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await setupFlutterNotifications();
  showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: 'launch_background',
        ),
      ),
    );
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;


class MyApp extends StatefulWidget {

 MyApp({Key? key}) : super(key: key);

  @override

  State<MyApp> createState() => _MyAppState();
}

List<String> _availableTimezones = <String>[];
String _timezone = 'Unknown';
class _MyAppState extends State<MyApp> {

@override


final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
     loader()async{
       Future.delayed(Duration(seconds: 8)).whenComplete(()  {

       });
 await firebaseAuth.signInAnonymously();
       Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) => buyerenter()));
     }
  void initState() {

    // TODO: implement initState
    super.initState();

   // timeer();
    Future.delayed(Duration(seconds: 2)).whenComplete((){
       FlutterNativeSplash.remove();
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:home() ,debugShowCheckedModeBanner: false,);
  }
}




class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  loader()async{
    Future.delayed(Duration(seconds: 8)).whenComplete(()  {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => network()));
    });
    await firebaseAuth.signInAnonymously();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => buyerenter()));
  }
  void initState() {
    //_initData();
    loader();
    // _scheduleDailyTenAMNotification();
    // TODO: implement initState
    super.initState();
    // timeer();

    //  noter();
    //  NotificationService().showNotification(1,"Uniben  News", "today in Uniben ");
  }
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.white,child:
      Center(child: SpinKitDualRing(color:
      Colors.blue.shade900,size: 44,),),),);
  }
}

