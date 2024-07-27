import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/auth_screens/admin_sign_up.dart';
import 'package:standman/auth_screens/sign_up.dart';
import 'package:standman/global_variables/global_variables.dart';

class SignTab extends StatefulWidget {
  const SignTab({super.key});

  @override
  State<SignTab> createState() => _SignTabState();
}

class _SignTabState extends State<SignTab> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 25,),
                Text(
                    "Register your account",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  ),
                   const SizedBox(height: 25,),
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
                      Tab(text: 'StandMan'),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(children: [
                      SignUp(),
                      AdminSignUp()
                    ]),
                  )
              ],
            ),
          ),
        ),
      ));
  }
}