import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/tab_bars/all_job_details.dart';

class PreviousJobs extends StatefulWidget {
  const PreviousJobs({super.key});

  @override
  State<PreviousJobs> createState() => _PreviousJobsState();
}

class _PreviousJobsState extends State<PreviousJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AllJobDetails()));
                  },
                  child: ListView.builder(
                                itemCount: 4,
                                itemBuilder: (context, index) {
                  return Card(
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
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    SvgPicture.asset('assets/images/more.svg')
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
                                        Row(
                                          children: [
                                            Text(
                                              'Wade Warren',
                                              style: GoogleFonts.outfit(
                                                  textStyle: const TextStyle(
                                                      fontSize: 8,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black)),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: 73,
                                              height: 19,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFE9FFE7),
                                                  borderRadius:
                                                      BorderRadius.circular(30)),
                                              child: Center(
                                                child: Text(
                                                  'Completed',
                                                  style: GoogleFonts.outfit(
                                                      textStyle: const TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Colors.lightGreen)),
                                                ),
                                              ),
                                            )
                                          ],
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
                                                  textStyle: const TextStyle(
                                                      fontSize: 8,
                                                      fontWeight: FontWeight.w400,
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
                    ),
                  );
                                },
                              ),
                ))
          ],
        ),
      ),
    );
  }
}
