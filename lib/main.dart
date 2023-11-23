import 'package:chat_ifba/screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'controller/auth_controller.dart';

void main() async {
  usePathUrlStrategy();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD9JnOUVnOVE-SzcUf-ycRsHWHMPvoHvMA",
      authDomain: "chat-ifba.firebaseapp.com",
      projectId: "chat-ifba",
      storageBucket: "chat-ifba.appspot.com",
      messagingSenderId: "387890314717",
      appId: "1:387890314717:web:af585fd9b82690f9e7ca34",
      measurementId: "G-JH3SGZ4JM0",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat IFBA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: AuthScreen(authController: AuthController()),
    );
  }
}
