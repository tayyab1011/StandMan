import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/auth_screens/forgot_screen.dart';
import 'package:standman/auth_screens/sign_tab.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/home_screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _obsecureText = true;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;


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
                          child: SvgPicture.asset("assets/images/email.svg",
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
                        height: 25,
                      ),
                      Text(
                        "Password",
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                color: GlobalVariables.textColor,
                                fontSize: 16, fontWeight: FontWeight.w300)),
                      ),
                      TextFormField(
                        obscureText: _obsecureText,
                        controller: passController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: SvgPicture.asset("assets/images/lock.svg",
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
                              color: GlobalVariables.iconColor
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
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ForgotScreen()));
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
              ),
              
              GestureDetector(
                  onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainScreen()));
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
                              'LOGIN',
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
                             builder: (context) => const SignTab()));
                      },
                      child: Text(
                        'Register here',
                        style: GoogleFonts.outfit(
                            textStyle:  const TextStyle(
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
