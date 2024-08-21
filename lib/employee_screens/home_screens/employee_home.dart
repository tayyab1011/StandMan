import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/drawer_screens/notification.dart';
import 'package:standman/employee_screens/home_screens/employee_job_details.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/policies/privacy_policy.dart';
import 'package:standman/policies/terms_and_conditions.dart';

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({super.key});

  @override
  State<EmployeeHome> createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

  bool _isLoading = false;
   changeSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: GlobalVariables.buttonColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Image.asset(
              'assets/images/menu.png',
              height: 24,
              width: 24,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SvgPicture.asset(
                "assets/images/notify.svg",
                height: 24,
                width: 24,
              ),
            ),
          ],
          centerTitle: true,
          title: Text(
            "Home",
            style: GoogleFonts.outfit(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: GlobalVariables.buttonColor),
          ),
        ),
      ),
        drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                margin: const EdgeInsets.only(bottom: 0.0),
                child: Column(
                  children: [      
                Image.asset(
              'assets/images/women.png',
              height: 83,
              width: 83,
            )
              ,
                    Text(
                      'Marvis',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/email.svg',
                          height: 15,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          'marvis@gmail.com',
                          style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ),
                      ],
                    ),
                  ],
                )),
            ListTile(
              selected: selectedIndex == 0,
              onTap: () {
                changeSelectedIndex(0);
                print('o is pressed');
              },
              horizontalTitleGap: 30,
              title: Text(
                "Home",
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
              ),
              leading: SvgPicture.asset('assets/images/home2.svg'),
            ),
            ListTile(
              selected: selectedIndex == 1,
              onTap: () {
                changeSelectedIndex(1);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
              },
              horizontalTitleGap: 30,
              title: Text(
                "Notification",
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
              ),
              leading: Image.asset(
                "assets/images/notify.png",
                height: 24,
                width: 24,
              ),
            ),
            ListTile(
              selected: selectedIndex == 2,
              onTap: () {
                changeSelectedIndex(2);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PrivacyPolicy()));
              },
              horizontalTitleGap: 30,
              title: Text(
                "Privacy Policy",
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
              ),
              leading: SvgPicture.asset('assets/images/privacy.svg'),
            ),
            ListTile(
              selected: selectedIndex == 3,
              onTap: () {
                changeSelectedIndex(3);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TermsAndConditions()));
              },
              horizontalTitleGap: 30,
              title: Text(
                "Terms And Conditions",
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
              ),
              leading: SvgPicture.asset('assets/images/privacy.svg'),
            ),
            ListTile(
              selected: selectedIndex == 4,
              onTap: () async {
                changeSelectedIndex(4);
              },
              horizontalTitleGap: 30,
              title: Text(
                "Sign Out",
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
              ),
              leading: SvgPicture.asset('assets/images/sign_out.svg'),
            ),
          ],
        ),
      ),
    
      body: Column(
        children: [
          ListTile(
            horizontalTitleGap: 5,
            leading: Image.asset(
              'assets/images/pfp.png',
              height: 64,
              width: 64,
            ),
            title: Text(
              "Hello...!",
              style: GoogleFonts.outfit(
                  textStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
            subtitle: Text(
              "Marvis Igedha",
              style: GoogleFonts.outfit(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9.0,vertical: 8),
                    child: Text(
                      'Jobs',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const AllJobDetails()));
                    },
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmployeeJobDetails()));
                          },
                          child: Card(
                            elevation: 1,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/job_pic.png',
                                    width: 146,
                                    height: 96,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Eleanor Pena',
                                              style: GoogleFonts.outfit(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black)),
                                            ),
                                            const SizedBox(
                                              width: 67,
                                            ),
                                            SvgPicture.asset(
                                                'assets/images/more.svg')
                                          ],
                                        ),
                                        Text(
                                          'Mar 03, 2023',
                                          style: GoogleFonts.outfit(
                                              textStyle: const TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey)),
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/images/locate.svg',
                                              height: 12,
                                              width: 12,
                                            ),
                                            SizedBox(
                                              width: 140,
                                              child: Text(
                                                'No 15 uti street off ovie palace road effurun delta state',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.outfit(
                                                    textStyle: const TextStyle(
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '\$25.86',
                                          style: GoogleFonts.outfit(
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.blue)),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () async {
                                                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddRatings()));
                                                },
                                                child: Container(
                                                  height: 33,
                                                  width: 81,
                                                  decoration: BoxDecoration(
                                                      color: GlobalVariables
                                                          .buttonColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  child: Center(
                                                    child: _isLoading
                                                        ? const CircularProgressIndicator(
                                                            color: Colors.white,
                                                          )
                                                        : Text(
                                                            'Accept',
                                                            style: GoogleFonts.outfit(
                                                                textStyle: const TextStyle(
                                                                    fontSize: 12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            GestureDetector(
                                                onTap: () async {
                                                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddRatings()));
                                                },
                                                child: Container(
                                                  height: 33,
                                                  width: 81,
                                                  decoration: BoxDecoration(
                                                      color: const Color.fromARGB(
                                                          255, 230, 40, 19),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  child: Center(
                                                    child: _isLoading
                                                        ? const CircularProgressIndicator(
                                                            color: Colors.white,
                                                          )
                                                        : Text(
                                                            'Skip',
                                                            style: GoogleFonts.outfit(
                                                                textStyle: const TextStyle(
                                                                    fontSize: 12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                  ),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ))
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
