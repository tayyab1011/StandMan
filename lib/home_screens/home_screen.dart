import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/home_screens/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set status bar color to transparent
      statusBarIconBrightness: Brightness.light, // Set status bar icon color
    ));
    return Scaffold(
      backgroundColor: GlobalVariables.buttonColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: Image.asset(
            'assets/images/menu.png',
            height: 24,
            width: 24,
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
                const SizedBox(
                  height: 5,
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                SvgPicture.asset('assets/images/star.svg'),
                                                  const SizedBox(width: 1,),
                                                Text(
                                                  '4.5',
                                                  style: GoogleFonts.outfit(
                                                      textStyle: const TextStyle(
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.grey)),
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
