import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:standman/auth_screens/new_password.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/helper/custom_toast.dart';

class OtpScreen extends StatefulWidget {
  final String? code;
  const OtpScreen({super.key, this.code});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  
  TextEditingController otp = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/logo2.svg',
                  width: 146,
                  height: 117,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Enter 4-digit OTP code",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 12),
                  child: Text(
                    "Please enter 4-digit OTP code here, after confirmation you can create new password.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 85.0),
                  child: PinCodeTextField(
                    controller: otp,
                    pastedTextStyle: const TextStyle(color: Colors.black),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      selectedColor: Colors.grey,
                      inactiveColor: Colors.grey,
                      activeColor: Colors.grey,
                      fieldHeight: 60,
                      fieldWidth: 12,
                    ),
                    keyboardType: TextInputType.phone,
                    appContext: context,
                    length: 4,
                  ),
                ),
                const SizedBox(height: 65),
                GestureDetector(
                    onTap: () async {
                      if(widget.code == otp.text){
                        print("Your otp is${otp.text}");
                        print(widget.code);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NewPassword()));
                      }
                      else{
                        
                        CustomToast.showToast(message: 'Invalid OTP');
                      }

                      
                    },
                    child: Container(
                      height: 54,
                      width: 286,
                      decoration: BoxDecoration(
                          color: GlobalVariables.buttonColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'CONFIRM',
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
          ),
        ),
      ),
    );
  }
}
