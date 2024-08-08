import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standman/home_screens/home_screen.dart';
import 'package:standman/home_screens/main_screen.dart';
import 'package:standman/main.dart';
import 'package:standman/on_boarding/on_boarding_one.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    whereToGo();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B65EC),
      body: Center(child: Image.asset("assets/images/logo1.png")),
    );
  }

  Future<void> whereToGo() async{
 prefs = await SharedPreferences.getInstance();
    var id = prefs!.getString('id');
    print(id);
    Timer(const Duration(milliseconds: 2000), () {
     if(id!=null){
       Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()));
     }
     else{
       Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnboardingScreen()));
     }
    });
  }
}
