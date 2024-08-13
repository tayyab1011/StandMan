import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/employee_screens/bottom_sheets/employee_change_password.dart';
import 'package:standman/employee_screens/bottom_sheets/employee_delete_account.dart';
import 'package:standman/employee_screens/bottom_sheets/employee_notification.dart';
import 'package:standman/global_variables/global_variables.dart';

class InfoTab extends StatefulWidget {
  const InfoTab({super.key});

  @override
  State<InfoTab> createState() => _InfoTabState();
}

class _InfoTabState extends State<InfoTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: 145,
                width: 330,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: GlobalVariables.buttonColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/women.png',
                      height: 99,
                      width: 99,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tayyab Bhai",
                          style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/email.svg',
                              height: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'itsdarvesh10@gmail.com',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/call.svg',
                              height: 16,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "12345678",
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                         const SizedBox(
                          height: 10,
                        ),
                        Row(
                        children: [
                          RatingBar.builder(
                              minRating: 1,
                              initialRating: 1,
                              allowHalfRating: true,
                              
                              itemCount: 5,
                              itemSize: 17,
                              itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                              onRatingUpdate: (value) {}),
                          Text(
                            '4.5',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                          ),
                        ],
                      )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 17.0, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Settings",
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 0.2,
                    child: ListTile(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.white,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return const SingleChildScrollView(
                                    child: EmployeeChangePassword());
                              });
                        },
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        horizontalTitleGap: 23,
                        leading: SvgPicture.asset(
                          'assets/images/lock_blue.svg',
                          height: 24,
                          width: 24,
                        ),
                        title: Text(
                          'Change Password',
                          style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black)),
                        ),
                        trailing:
                            SvgPicture.asset('assets/images/chevron_left.svg')),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 0.2,
                    child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return const SingleChildScrollView(child: EmployeeNotification());
                              });
                        },

                        horizontalTitleGap: 23,
                        leading: SvgPicture.asset(
                          'assets/images/notification_blue.svg',
                          height: 24,
                          width: 24,
                        ),
                        title: Text(
                          'Notification Setting',
                          style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black)),
                        ),
                        trailing:
                            SvgPicture.asset('assets/images/chevron_left.svg')),
                  ),
                  Card(
                      color: Colors.white,
                      elevation: 0.2,
                      child: ListTile(
                          onTap: (){
                            showModalBottomSheet(
                              backgroundColor: Colors.white,
                              isScrollControlled: true,
                              context: context, builder: (context){
                              return const SingleChildScrollView(child:  EmployeeDeleteAccount());

                            });
                          },
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          horizontalTitleGap: 23,
                          leading: SvgPicture.asset(
                            'assets/images/delete_blue.svg',
                            height: 24,
                            width: 24,
                          ),
                          title: Text(
                            'Delete Account',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black)),
                          ),
                          trailing: SvgPicture.asset(
                              'assets/images/chevron_left.svg'))),
                  GestureDetector(
                    onTap: () {
                      //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const TabScreens()));
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 0.2,
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        horizontalTitleGap: 23,
                        leading: SvgPicture.asset(
                          'assets/images/sign_out.svg',
                          height: 24,
                          width: 24,
                        ),
                        title: Text(
                          'Sign Out',
                          style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
