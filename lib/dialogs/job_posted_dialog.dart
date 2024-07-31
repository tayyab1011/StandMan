import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';

class JobPostedDialog extends StatefulWidget {
  const JobPostedDialog({super.key});

  @override
  State<JobPostedDialog> createState() => _JobPostedDialogState();
}

class _JobPostedDialogState extends State<JobPostedDialog> {
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
                  'Job Posted Successfully',
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
              )
            ],
          ),
        ],
      ),
    );
    
  }
}
