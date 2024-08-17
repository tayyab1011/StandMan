import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/bottom_sheets/show_notes_sheet.dart';

class EmployeePaymentSheet extends StatefulWidget {
  const EmployeePaymentSheet({super.key});

  @override
  State<EmployeePaymentSheet> createState() => _EmployeePaymentSheetState();
}

class _EmployeePaymentSheetState extends State<EmployeePaymentSheet> {
  int selectedValue = 1;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
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
                    'Marvis',
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
                                  child: ShowNotesSheet());
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Previous Amount',
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Extra Amount',
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Booked Time',
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.red)),
                  ),
                ),
                Text(
                  '12:00-13:00',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.red)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Booked Closed',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.red)),
                ),
                Text(
                  '13:45',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.red)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 45.0),
                  child: Text(
                    'Extra Time',
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.red)),
                  ),
                ),
                Text(
                  '45',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.red)),
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
          ],
        ),
      ],
    );
  }
}
