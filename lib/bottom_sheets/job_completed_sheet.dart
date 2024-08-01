import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/bottom_sheets/show_notes_sheet.dart';
import 'package:standman/dialogs/job_accepted_dialog.dart';
import 'package:standman/global_variables/global_variables.dart';

class JobCompletedSheet extends StatefulWidget {
  const JobCompletedSheet({super.key});

  @override
  State<JobCompletedSheet> createState() => _JobCompletedSheetState();
}

class _JobCompletedSheetState extends State<JobCompletedSheet> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            )),
                        Text(
                          'Estimated Payment',
                          style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ),
                        GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return const SingleChildScrollView(
                                      child: ShowNotesSheet()
                                    );
                                  });
                            },
                            child: SvgPicture.asset('assets/images/info.svg'))
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    '\$25.86',
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Amount',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black)),
                      ),
                      Text(
                        '\$21',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Service Charges',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black)),
                      ),
                      Text(
                        '\$2',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Tax',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black)),
                      ),
                      Text(
                        '\$2.86',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Base rate - \$21/hour (0.35¢/minute)',
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black)),
                  ),
                  Text(
                    'Service fee - 10% from the "Customer" and "StandMan"',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black)),
                  ),
                  Text(
                    'Tax - 13%',
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  GestureDetector(
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const JobAcceptedDialog();
                            });
                      },
                      child: Container(
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
                                  'Post Job',
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
          );
  }
}