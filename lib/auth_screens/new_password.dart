import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/auth_screens/tab_screens.dart';
import 'package:standman/global_variables/base_urls.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/helper/custom_toast.dart';
import 'package:standman/models/reset_password.dart';

class NewPassword extends StatefulWidget {
  final String? email;
  const NewPassword({super.key, this.email});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController confirmController = TextEditingController();
  TextEditingController passController = TextEditingController();
  ResetPasswordModel resetPasswordModel = ResetPasswordModel();
  bool _obsecureText = true;
  bool _obsecureText2 = true;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  resetPassword() async{
    var headersList = {
 'Accept': '*/*',
 
 'Content-Type': 'application/json' 
};
var url = Uri.parse('${baseImageURL}api/resetPassword');

var body = {
   "email": widget.email,
   "newPassword":passController.text,
   "confirmPassword":confirmController.text
   
    
} ;

var req = http.Request('POST', url);
req.headers.addAll(headersList);
req.body = json.encode(body);


var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode == 200)  {
  resetPasswordModel = resetPasswordModelFromJson(resBody);
  if(mounted){
    setState(() {
      
    });
  }
  print(resBody);
}
else {
  resetPasswordModel = resetPasswordModelFromJson(resBody);
  print(res.reasonPhrase);
}
  }

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
                "Create your new password",
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
                  "Please create your new password",
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
                        "Create new password",
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
                      ),
                       const SizedBox(
                height: 22,
              ),
                      Text(
                        "Confirm new password",
                        style: GoogleFonts.outfit(
                            textStyle:  const TextStyle(
                              color: GlobalVariables.textColor,
                                fontSize: 16, fontWeight: FontWeight.w300)),
                      ),
                       TextFormField(
                        obscureText: _obsecureText2,
                        controller: confirmController,
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
                                    _obsecureText2 = !_obsecureText2;
                                  });
                                },
                                icon: _obsecureText2
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
                   if(passController.text.isNotEmpty && confirmController.text.isNotEmpty){
                     await resetPassword();
                     if(resetPasswordModel.status == "success"){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>  const TabScreens()));
                        CustomToast.showToast(message: 'Passwrod Reset');
                     }
                     else{
                      CustomToast.showToast(message: resetPasswordModel.msg.toString());
                     }
                   }
                   else{
                     CustomToast.showToast(message: 'All fileds are required');
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
