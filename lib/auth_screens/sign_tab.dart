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
          backgroundColor: Colors.white,
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
                      child: Text('StandMan'),
                    )),
                  )
                    ],
                                 ),
                 ),
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