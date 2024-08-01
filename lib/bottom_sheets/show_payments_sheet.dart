import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/bottom_sheets/show_notes_sheet.dart';
import 'package:standman/dialogs/payment_accepted.dart';
import 'package:standman/global_variables/global_variables.dart';

class ShowPaymentsSheet extends StatefulWidget {
  const ShowPaymentsSheet({super.key});

  @override
  State<ShowPaymentsSheet> createState() => _ShowPaymentsSheetState();
}

class _ShowPaymentsSheetState extends State<ShowPaymentsSheet> {
  int selectedValue = 1;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Payment',
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
                  const SizedBox(height: 20,),
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
                const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Choose payment method',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                       decoration:  BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.amber)
                          ),
                    
                      height: 70,
                      width: 350,
                      child: ListTile(
                        title: Text(
                      'Master Card',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                    subtitle: Text(
                      '6895 3526 8456 ****',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey)),
                    ),
                    trailing: Radio(
                      activeColor: Colors.blue,
                      value: 1, groupValue: selectedValue, onChanged: (value){
                    selectedValue = value!;
                    }),
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFFF2F4F9)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Image.asset('assets/images/master_frames.png',height: 30,width: 32,)
                        ],)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                       decoration:  BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: const Color(0xFFF2F4F9))
                          ),
                    
                      height: 70,
                      width: 350,
                      child: ListTile(
                        title: Text(
                      'Visa Card',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                    subtitle: Text(
                      '6895 3526 8456 ****',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey)),
                    ),
                    trailing: Radio(
                      activeColor: Colors.blue,
                      value: 0, groupValue: selectedValue, onChanged: (value){
                    selectedValue = value!;
                    }),
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFFF2F4F9)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Image.asset('assets/images/visa_frame.png',height: 32,width: 32,)
                        ],)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                       decoration:  BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: const Color(0xFFF2F4F9))
                          ),
                    
                      height: 46,
                      width: 350,
                      child: ListTile(
                        title: Text(
                      'Add New Payment Method',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ),
                    
                    leading: SvgPicture.asset('assets/images/add_card.svg'),
                    
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Center(
                    child: GestureDetector(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const PaymentAccepted();
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
                                    'Pay',
                                    style: GoogleFonts.outfit(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
            ],
          );
  }
}
