import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:standman/auth_screens/tab_screens.dart';
import 'package:standman/auth_screens/upload_document.dart';
import 'package:standman/global_variables/global_variables.dart';

class AdminSignUp extends StatefulWidget {
  const AdminSignUp({super.key});

  @override
  State<AdminSignUp> createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController confrim = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _obsecureText = true;
  bool _obsecureText2 = true;
  ImagePicker _imagePicker = ImagePicker();
  File? _file;
  bool _isLoading = false;

  Future<void> pickedProfile() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        height: 125,
                        width: 110,
                        child: Stack(
                          children: [
                           _file !=null? Container(
                                    width: 110,
                                    height: 125,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(_file!))),
                                  ): SvgPicture.asset('assets/images/ellipse.svg'),
                            Positioned(
                              top: -4,
                              left: -9,
                              child:
                                  GestureDetector(
                                    onTap: pickedProfile,
                                    child: SvgPicture.asset('assets/images/camera.svg')),
                            )
                          ],
                        ),
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "We will verify your account within 1-3 business days. Please note that this timeframe is an average and not a guarantee. Depending on the current volume, the verification process could be faster or slower.",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: GlobalVariables.iconColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Phone Number",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: GlobalVariables.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                    ),
                    IntlPhoneField(
                      controller: phoneController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: 'Phone Number',
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
                    Text(
                      "First Name",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: GlobalVariables.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                    ),
                    TextFormField(
                      controller: fNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your First Name';
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: SvgPicture.asset(
                              "assets/images/name.svg",
                            ),
                          ),
                          hintText: 'First Name',
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
                    Text(
                      "Last Name",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: GlobalVariables.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                    ),
                    TextFormField(
                      controller: lNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Last Name  ';
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: SvgPicture.asset(
                              "assets/images/name.svg",
                            ),
                          ),
                          hintText: 'Last Name',
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
                    Text(
                      "Email",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: GlobalVariables.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
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
                    Text(
                      "Password",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: GlobalVariables.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                    ),
                    TextFormField(
                      obscureText: _obsecureText,
                      controller: passController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: SvgPicture.asset(
                              "assets/images/lock.svg",
                            ),
                          ),
                          suffixIcon: IconButton(
                              color: GlobalVariables.iconColor,
                              onPressed: () {
                                setState(() {
                                  _obsecureText = !_obsecureText;
                                });
                              },
                              icon: _obsecureText
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: GlobalVariables.iconColor),
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
                      height: 20,
                    ),
                    Text(
                      "Confirm Password",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: GlobalVariables.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                    ),
                    TextFormField(
                      obscureText: _obsecureText2,
                      controller: confrim,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: SvgPicture.asset(
                              "assets/images/lock.svg",
                            ),
                          ),
                          suffixIcon: IconButton(
                              color: GlobalVariables.iconColor,
                              onPressed: () {
                                setState(() {
                                  _obsecureText2 = !_obsecureText2;
                                });
                              },
                              icon: _obsecureText2
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          hintText: 'Confirm Password',
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: GlobalVariables.iconColor),
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
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text.rich(
                  TextSpan(
                      text: "By Clicking Sing Up, you agree to our",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: GlobalVariables.iconColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      children: [
                        TextSpan(
                            text: " Terms and Policy ",
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    color: GlobalVariables.buttonColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400))),
                        TextSpan(
                            text: "that you have read.",
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    color: GlobalVariables.iconColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400))),
                      ]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                  onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UploadDocument(
                              email: emailController.text,
                              file: _file,
                              password: passController.text,
                              confrim_password: confrim.text,
                              first_name: fNameController.text,
                              last_name: lNameController.text,
                              phone: phoneController.text,
                            )));
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
                              'NEXT',
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
              Text(
                'OR',
                style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 54,
                width: 232,
                decoration: BoxDecoration(
                    color: GlobalVariables.redButtonColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/Google.svg",
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Sign In with Google',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: GoogleFonts.outfit(
                        color: Colors.grey,
                        textStyle: const TextStyle(
                            height: 1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TabScreens()));
                      },
                      child: Text(
                        'Sign In here',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                color: GlobalVariables.buttonColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      )),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
