import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/home_screens/main_screen.dart';

class JobAcceptedDialog extends StatefulWidget {
  const JobAcceptedDialog({super.key});

  @override
  State<JobAcceptedDialog> createState() => _JobAcceptedDialogState();
}

class _JobAcceptedDialogState extends State<JobAcceptedDialog> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: -70,
              left: MediaQuery.of(context).size.width * 0.2,
              child: SvgPicture.asset('assets/images/done.svg')),
          Positioned(
              top: -30,
              right: 90,
              child: SvgPicture.asset('assets/images/check.svg')),
          Column(
            children: [
              const SizedBox(
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Job Accepted',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                height: 85,
                width: 230,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Color(0xFFF3F3F3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/women.png',
                      height: 44,
                      width: 44,
                    ),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Wade Warren',
                          style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
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
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainScreen()));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 48,
                  width: 307,
                  decoration: BoxDecoration(
                      color: GlobalVariables.buttonColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Go back to home',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                          ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
