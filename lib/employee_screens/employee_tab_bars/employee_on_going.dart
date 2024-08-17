import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/employee_screens/home_screens/employee_job_details.dart';


class EmployeeOnGoing extends StatefulWidget {
  const EmployeeOnGoing({super.key});

  @override
  State<EmployeeOnGoing> createState() => _EmployeeOnGoingState();
}

class _EmployeeOnGoingState extends State<EmployeeOnGoing> {
  int selectedIndex = 0;
  
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
      body: Column(
        children: [
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
                  Expanded(
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const EmployeeJobDetails()));
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
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
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                          Container(
                                            width: 67,
                                            height: 19,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFFFDACC),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Center(
                                              child: Text(
                                                'On Going',
                                                style: GoogleFonts.outfit(
                                                    textStyle: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Colors.red)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
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
