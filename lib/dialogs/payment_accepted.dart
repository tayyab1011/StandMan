import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';

class PaymentAccepted extends StatefulWidget {
  const PaymentAccepted({super.key});

  @override
  State<PaymentAccepted> createState() => _PaymentAcceptedState();
}

class _PaymentAcceptedState extends State<PaymentAccepted> {
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
                 
                  
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       Text(
                    '\$25.86',
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue)),
                  ),
                        Text(
                          'You paid',
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
              const SizedBox(height: 30,),
               Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'From',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue)),
                      ),
                      Text(
                        'Beby Jovanca',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                  const SizedBox(
                height: 10,
              ),
                  Divider(),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'To',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue)),
                      ),
                      Text(
                        'Annette Black',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                  const SizedBox(
                height: 10,
              ),
                  const Divider(),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '24 Jul 2020',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                          Text(
                            '15:30',
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
                  const SizedBox(
                height: 10,
              ),
                  Divider(),
              const SizedBox(
                height: 30,
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
                          'Add Ratings',
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
