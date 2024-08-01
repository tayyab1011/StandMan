import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/tab_bars/add_ratings.dart';
import 'package:standman/tab_bars/profile.dart';
import 'package:standman/tab_bars/qr_code.dart';

class AllJobDetails extends StatefulWidget {
  const AllJobDetails({super.key});

  @override
  State<AllJobDetails> createState() => _AllJobDetailsState();
}

class _AllJobDetailsState extends State<AllJobDetails> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.buttonColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          leading: Image.asset(
            'assets/images/arrow-left.png',
            height: 22,
            width: 22,
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
            "Job Details",
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
      body: SingleChildScrollView(
        child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
        
                    decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)),
          color: Colors.white),
                    child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/job_details.png',
                  width: 350,
                  height: 359,
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Container(
                    width: 73,
                    height: 19,
                    decoration: BoxDecoration(
                        color: const Color(0xFFE9FFE7),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        'Completed',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.lightGreen)),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Eleanor Pena',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
                Text(
                  '\$22',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                SvgPicture.asset('assets/images/locate.svg'),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No 15 uti street off ovie palace road effurun delta state',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ),
                    Text(
                      'Complete job time 03 March - 4:40 PM',
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
            const SizedBox(
              height: 10,
            ),
            Text(
              'Donec dictum tristique porta. Etiam convallis lorem lobortis nulla molestie, nec tincidunt ex ullamcorper. Quisque ultrices lobortis elit sed euismod. Duis in ultrices dolor, ac rhoncus odio. Suspendisse tempor sollicitudin dui sed lacinia. Nulla quis enim posuere, congue libero quis, commodo purus. Cras iaculis massa ut elit.',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Job completed by',
              style: GoogleFonts.outfit(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Profile()));
                  },
                  child: Image.asset(
                    'assets/images/women.png',
                    height: 64,
                    width: 64,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wade Warren',
                          style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/star.svg',
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  '4.5',
                                  style: GoogleFonts.outfit(
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    GestureDetector(
                        onTap: () async {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddRatings()));
                        },
                        child: Container(
                          height: 48,
                          width: 117,
                          decoration: BoxDecoration(
                              color: GlobalVariables.buttonColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: _isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Add Ratings',
                                    style: GoogleFonts.outfit(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Center(
              child: GestureDetector(
                  onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const QrCode()));
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
                              'Complete Job using QR',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                    ),
                  )),
            ),
             const SizedBox(height: 20,),
                 
                Center(
                  child: GestureDetector(
                  onTap: () async {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const LocationScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 48,
                    width: 290,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.red,
                            )
                          : Text(
                              'Cancel Job',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red)),
                            ),
                    ),
                  )),
                )
          ],
        ),
                    ),
                  ),
      ),
    );
  }
}
