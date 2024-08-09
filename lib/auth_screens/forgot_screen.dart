import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/auth_screens/otp_screen.dart';
import 'package:standman/global_variables/base_urls.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/helper/custom_toast.dart';
import 'package:standman/models/otp_model.dart';
import 'package:http/http.dart'as http;

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController emailController = TextEditingController();
  OtpModel otpModel = OtpModel();

  sendOtp() async{
    var headersList = {
 'Accept': '*/*',
 'Content-Type': 'application/json' 
};
  var url = Uri.parse('${baseImageURL}api/sendOtp');


var body = {
   "email": emailController.text 
} ;

var req = http.Request('POST', url);
req.headers.addAll(headersList);
req.body = json.encode(body);


var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode == 200 ) {
  otpModel = otpModelFromJson(resBody);
   if(mounted){
    setState(() {
      
    });
  }
  print(resBody);
}
else {
  otpModel = otpModelFromJson(resBody);
  print(res.reasonPhrase);
}
  }

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/images/logo2.svg',
                width: 146,
                height: 117,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Lost your password?",
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Please enter your registered email. You will get 4-digit OTP code to reset password.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                               color: GlobalVariables.textColor,
                                fontSize: 16, fontWeight: FontWeight.w300)),
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email  ';
                          }
                          return null;
                        },
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: SvgPicture.asset(
                                "assets/images/email.svg",
                              ),
                            ),
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                              color: GlobalVariables.iconColor,
                              fontWeight: FontWeight.normal,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.15))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.15)))),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              GestureDetector(
                  onTap: () async {
                    if(emailController.text.isNotEmpty){
                      await sendOtp();
                      if(otpModel.status == 'success'){
                        Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => OtpScreen(code: otpModel.otp!.otp,email: otpModel.otp!.email,)));
                        CustomToast.showToast(message: 'OTP sent successfully');
                      }
                      else{
                        CustomToast.showToast(message: otpModel.message.toString());

                      }
                    }
                    else{
                      CustomToast.showToast(message: 'Enter your Email');
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
                              'SEND OTP',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
