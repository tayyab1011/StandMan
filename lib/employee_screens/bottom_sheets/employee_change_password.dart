import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/auth_screens/forgot_screen.dart';
import 'package:standman/global_variables/global_variables.dart';


class EmployeeChangePassword extends StatefulWidget {
  const EmployeeChangePassword({super.key});

  @override
  State<EmployeeChangePassword> createState() => _EmployeeChangePasswordState();
}

class _EmployeeChangePasswordState extends State<EmployeeChangePassword> {
  TextEditingController confirmController = TextEditingController();
  TextEditingController currentController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _obsecureText = true;
  bool _obsecureText2 = true;
  bool _obsecureText3 = true;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Change Password',
                    style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current password",
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                color: GlobalVariables.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
                      ),
                      TextFormField(
                        obscureText: _obsecureText,
                        controller: currentController,
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
                            hintText: 'Enter your current Password',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotScreen()));
                              },
                              child: Text(
                                'Forgot Password?',
                                style: GoogleFonts.outfit(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey)),
                              )),
                        ],
                      ),
                      Text(
                        "New password",
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                color: GlobalVariables.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
                      ),
                      TextFormField(
                        obscureText: _obsecureText2,
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
                                    _obsecureText2 = !_obsecureText2;
                                  });
                                },
                                icon: _obsecureText2
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)),
                            hintText: 'Enter your New Password',
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
                        height: 22,
                      ),
                      Text(
                        "Confirm new password",
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                color: GlobalVariables.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
                      ),
                      TextFormField(
                        obscureText: _obsecureText3,
                        controller: confirmController,
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
                                    _obsecureText3 = !_obsecureText3;
                                  });
                                },
                                icon: _obsecureText3
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)),
                            hintText: 'Confirm New Password',
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
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => OtpScreen()));
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
                              'Update Password',
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
        ],
      ),
    );
  }
}
