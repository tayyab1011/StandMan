import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/drawer_screens/notification.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/home_screens/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  bool _isLoading = false;

   changeSelectedIndex(int index){
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
                      height: 90,
                      width: 103,
                    ),
                    Text(
                      "Marvis Ighedosa",
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
                          "Dosamarvis@gmail.com",
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
              selected: selectedIndex==0,
              onTap:(){
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
              selected: selectedIndex==1,
              onTap: (){
                changeSelectedIndex(1);
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NotificationScreen()));
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
              onTap: (){
                changeSelectedIndex(2);
                print('2nd is pressed');
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
              selected: selectedIndex==3,
              onTap: (){
                changeSelectedIndex(3);
                print('3rd is pressed');
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
              selected: selectedIndex==4,
              onTap: (){
                changeSelectedIndex(4);
                print('4th is pressed');
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
            leading: Image.asset(
              'assets/images/pfp.png',
              height: 64,
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
              "Marvis Ighedosa",
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 36.0),
                  child: SvgPicture.asset(
                    'assets/images/main.svg',
                  ),
                ),
                Text(
                  "Where you want \nto reserve place..?",
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LocationScreen()));
                    },
                    child: Container(
                      height: 48,
                      width: 290,
                      decoration: BoxDecoration(
                          color: GlobalVariables.buttonColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Create Job',
                                style: GoogleFonts.outfit(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                      ),
                    )),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Recent Job',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ),
                  ],
                ),
                
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 25,
                              ),
                              Image.asset(
                                'assets/images/list.png',
                                width: 96,
                                height: 96,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Eleanor Pena',
                                      style: GoogleFonts.outfit(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                    ),
                                    Text(
                                      'Mar 03, 2023',
                                      style: GoogleFonts.outfit(
                                          textStyle: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Taken By',
                                      style: GoogleFonts.outfit(
                                          textStyle: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.lightBlue)),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/women.png',
                                          height: 24,
                                          width: 24,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Wade Warren',
                                              style: GoogleFonts.outfit(
                                                  textStyle: const TextStyle(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black)),
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/star.svg'),
                                                const SizedBox(
                                                  width: 1,
                                                ),
                                                Text(
                                                  '4.5',
                                                  style: GoogleFonts.outfit(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.grey)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
