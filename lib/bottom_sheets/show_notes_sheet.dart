import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowNotesSheet extends StatelessWidget {
  const ShowNotesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0, left: 4),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Text(
                '- Customer books for less than an hour(60min) they still should be changed for (full 1hour-60min).',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Example: Customer books (13:00-13:45) "45min", the customer will be charged for (full 1hour - 60min) because its the minimum we charge, based on terms and regulations.',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.redAccent)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '- Customer books for less than an hour(60min) they still should be changed for (full 1hour-60min).',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Example: Customer books (12:00-13.35) "95min", the Customer will be charged for (95min).',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.redAccent)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '- Customer books for more than an hour(60min) but they come later than booked time. They will be charged for the exact time until an order is complete by QR-code scanning or any other method.',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Example: Customer books (12:00-13:45) "105min", but actually order is completed at (14:10)-additional "25min", the Customer will be charged for (130min).',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.redAccent)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '- Customer books for more than an hour(60min) but they come earlier than booked time. They will be charged for the exact time until an order is complete by QR-code scanning or any other method.',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'NOTE: 1st hour(60min) RULE still applies, if a customer came earlier than 1st hour(60min) still full hour(60min) will be charged',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Example: Customer books (12:00-13:15) "75min", but actually order is completed at (12:55)"55min", the Customer will be charged for (60min).',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.redAccent)),
              ),
              const SizedBox(
                height: 13,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
