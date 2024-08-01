import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/bottom_sheets/show_payments_sheet.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
     
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: Image.asset(
            'assets/images/arrow-left.png',
            height: 24,
            width: 24,

          ),
         
          centerTitle: true,
          title: Text(
            "Scan QR",
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
            decoration: const BoxDecoration(color: Colors.black),
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            showModalBottomSheet(
              backgroundColor: Colors.white,
              isScrollControlled: true,
              context: context, builder: (context){
              return SingleChildScrollView(child: ShowPaymentsSheet());

            });
          },
          child: SvgPicture.asset('assets/images/qr_code.svg')),
      ),
    );
  }
}