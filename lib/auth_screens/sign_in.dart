import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standman/auth_screens/forgot_screen.dart';
import 'package:standman/auth_screens/sign_tab.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/helper/custom_toast.dart';
import 'package:standman/home_screens/main_screen.dart';
import 'package:http/http.dart' as http;
import 'package:standman/main.dart';
import 'package:standman/models/sign_in_model.dart';

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
  SignInModel signInModel = SignInModel();

  signIn() async{
    var headersList = {
 'Accept': '*/*',
 'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
 'Content-Type': 'application/json' 
};


var url = Uri.parse('http://192.168.1.14:3000/api/signIn');


var body = {
   "email": emailController.text,
    "password": passController.text
    
} ;

var req = http.Request('POST', url);
req.headers.addAll(headersList);
req.body = json.encode(body);



var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode == 200) {
  signInModel = signInModelFromJson(resBody);
  print(signInModel.data![0].firstName.toString());
  if(signInModel.data != null){
 prefs = await  SharedPreferences.getInstance();
   await prefs!.setString('profile', signInModel.data![0].profile.toString());
    await prefs!.setString("first_name", signInModel.data![0].firstName.toString());
    await prefs!.setString("id",  signInModel.data![0].id.toString());
   var profile = prefs!.getString('profile');
    // ignore: unnecessary_brace_in_string_interps
    print("First name:${profile}");
    }
  if(mounted){
    setState(() {
      
    });
  }
  print(resBody);
}
else {
  signInModel = signInModelFromJson(resBody);
  print(res.reasonPhrase);
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
                   if(emailController.text.isNotEmpty&&passController.text.isNotEmpty){
                    await signIn();
                    if(signInModel.status == "success"){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainScreen()));
                       CustomToast.showToast(message: 'Login Successfull');
                    }
                    else{
                      CustomToast.showToast(message: signInModel.message.toString());
                    }
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
