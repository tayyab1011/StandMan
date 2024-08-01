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
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
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
               Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color:Colors.grey.shade50,),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TabBar(
                    labelStyle: GoogleFonts.outfit(
                      textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500)
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                    color: Colors.white, // Background color of the selected tab
                    borderRadius: BorderRadius.circular(15.0), // Rounded corners for the selected tab
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(66, 99, 93, 93), // Shadow color
                        offset: Offset(0, 1), // Shadow offset
                        blurRadius: 4.0, // Shadow blur radius
                      ),
                    ],
                                   ),
                    tabAlignment: TabAlignment.center,
                    unselectedLabelColor: GlobalVariables.iconColor,
                    labelColor: Colors.black,
                    dividerHeight: 0,             
                    tabs: const [
                    Tab(
                    child: Center(child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Customer'),
                    )),
                  ),
                     Tab(
                    child: Center(child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Employee'),
                    )),
                  )
                    ],
                                 ),
                 ),
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
