import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/auth_screens/admin_screen.dart';
import 'package:standman/auth_screens/sign_in.dart';
import 'package:standman/global_variables/global_variables.dart';

class TabScreens extends StatefulWidget {
  const TabScreens({super.key});

  @override
  State<TabScreens> createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set status bar color to transparent
      statusBarIconBrightness: Brightness.dark, // Set status bar icon color
    ));

    return DefaultTabController(
      length: 2, // Number of tabs
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SvgPicture.asset(
                'assets/images/logo2.svg',
                width: 146,
                height: 117,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Welcome Back!",
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please Login to your account",
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  textStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
               TabBar(
                labelStyle: GoogleFonts.outfit(
                  textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500)
                ),
                tabAlignment: TabAlignment.center,
                unselectedLabelColor: GlobalVariables.iconColor,
                labelColor: Colors.black,
                indicator: const BoxDecoration(
                color: Colors.transparent, // Removes the underline
              ),
                dividerHeight: 0,             
                tabs: const [
                  Tab(text: 'Customer'),
                  Tab(text: 'Employee'),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    LoginScreen(), // Customer Login Screen
                    AdminScreen(),  // Admin Screen (replace with your admin screen)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
