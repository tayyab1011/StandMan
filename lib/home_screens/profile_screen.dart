import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/bottom_sheets/change_password_sheet.dart';
import 'package:standman/bottom_sheets/delete_account.dart';
import 'package:standman/bottom_sheets/notification_settings.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/home_screens/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/menu.png',
              height: 24,
              width: 24,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditProfile()));
                },
                child: SvgPicture.asset(
                  "assets/images/edit.svg",
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ],
          centerTitle: true,
          title: Text(
            "Profile",
            style: GoogleFonts.outfit(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                          'Marvis Ighedosa',
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
                              "Dosamarvis@gmail.com",
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
                              "+9212355697",
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
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
                                    child: ChangePasswordSheet());
                              });
                        },
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                             SvgPicture.asset(
                                'assets/images/chevron_left.svg')),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 0.2,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return const SingleChildScrollView(child: NotificationSettings());
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
                             SvgPicture.asset(
                                'assets/images/chevron_left.svg')),),
                  
                  Card(
                    color: Colors.white,
                    elevation: 0.2,
                    child: ListTile(
                      onTap: (){
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          context: context, builder: (context){
                          return const SingleChildScrollView(child:  DeleteAccount());

                        });
                      },
                       contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                       trailing: 
                             SvgPicture.asset(
                                'assets/images/chevron_left.svg'))),
                  
                  Card(
                    color: Colors.white,
                    elevation: 0.2,
                    child: ListTile(
                     contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
