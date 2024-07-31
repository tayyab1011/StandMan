import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';

class OnGoingJobs extends StatefulWidget {
  const OnGoingJobs({super.key});

  @override
  State<OnGoingJobs> createState() => _OnGoingJobsState();
}

class _OnGoingJobsState extends State<OnGoingJobs> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            Text(
              "You did not created any job,",
              style: GoogleFonts.outfit(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Please create your Job now..!",
              style: GoogleFonts.outfit(
                textStyle: const TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Center(
              child: GestureDetector(
                      onTap: () async {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const LocationScreen()));
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
            ),
            const SizedBox(height: 30,),
            SvgPicture.asset('assets/images/layer.svg')
          ],
        ),
      ),
    );
  }
}
