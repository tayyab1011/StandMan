import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:standman/employee_screens/home_screens/employee_job_details.dart';
import 'package:standman/global_variables/global_variables.dart';


class FindJobs extends StatefulWidget {
  const FindJobs({super.key});

  @override
  State<FindJobs> createState() => _FindJobsState();
}

class _FindJobsState extends State<FindJobs> {
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
