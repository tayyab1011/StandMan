import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:standman/global_variables/global_variables.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  int selectedValue = 0;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/arrow-left.png',
              height: 24,
              width: 24,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Edit Profile",
            style: GoogleFonts.outfit(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                          Image.asset(
                            'assets/images/pfp.png',
                            height: 106,
                            width: 106,
                          ),
                          Positioned(
                            top: -4,
                            left: -9,
                            child: SvgPicture.asset('assets/images/camera.svg'),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Full Name",
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            color: GlobalVariables.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                  TextFormField(
                    controller: fNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Full Name  ';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: SvgPicture.asset(
                            "assets/images/profile_blue.svg",
                          ),
                        ),
                        hintText: 'Tayyab',
                        hintStyle: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                color: GlobalVariables.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
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
                    "Email",
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            color: GlobalVariables.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
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
                            "assets/images/email_blue.svg",
                          ),
                        ),
                        hintText: 'Email',
                        hintStyle: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                color: GlobalVariables.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
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
                    "Phone Number",
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            color: GlobalVariables.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                  IntlPhoneField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                color: GlobalVariables.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
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
                    height: 10,
                  ),
                  Text(
                    "Gender",
                    style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                            color: GlobalVariables.textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: const Color(0xFFF2F4F9))),
                        child: Row(
                          children: [
                            Radio(
                                activeColor: GlobalVariables.buttonColor,
                                value: 1,
                                groupValue: selectedValue,
                                onChanged: (value) {}),
                            Text(
                              "Male",
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: const Color(0xFFF2F4F9))),
                        child: Row(
                          children: [
                            Radio(
                                activeColor: GlobalVariables.buttonColor,
                                value: 0,
                                groupValue: selectedValue,
                                onChanged: (value) {}),
                            Text(
                              "Female",
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: const Color(0xFFF2F4F9))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                activeColor: GlobalVariables.buttonColor,
                                value: 1,
                                groupValue: selectedValue,
                                onChanged: (value) {}),
                            Text(
                              "Custom",
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () async {},
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
                            'Update Profile',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                          ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
