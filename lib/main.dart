import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standman/on_boarding/splash_screen.dart';





void main() {
  runApp(const MyApp());
}

SharedPreferences? prefs;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
